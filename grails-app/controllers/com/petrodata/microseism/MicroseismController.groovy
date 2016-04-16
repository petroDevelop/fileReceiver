package com.petrodata.microseism

import grails.converters.JSON

class MicroseismController {

   // def beforeInterceptor = [action: this.&auth, except: 'login']

/*    private auth() {
        if (!session.user) {
            redirect(action: 'login')
            return false
        }
    }

    def login(userName, userPwd) {
        //按两个角色区别对待，一是现场传输用的角色（UPLOAD），另一个是后端浏览上传进度用的角色（VIEW）
        //返回值里flag=1表示成功，flag=0表示失败，以下方法相同
        if (userName && userPwd) {
            def user = MsUser.findByUserNameAndUserPwd(userName, userPwd.encodeAsMD5())
            if (user) {
                session.user = user
                render([flag: 1] as JSON)
            }
        }else{
            render([flag: 0, msg: '用户名或密码错误'] as JSON)
        }
    }*/

/*    def saveProject() {
        //接收现场提交的微地震项目信息，包括：项目、主文件和拆分后的文件（子文件）信息
        //需要注意：先判断是否已存在同名文件，如果存在则需要提示前端是否覆盖现有文件

        def returnMsg = [:]

        def project = MsProject.findByProjectName(params.projectName)
        if (!project) {
            project = new MsProject([projectName: params.projectName, creator: session.user])
            project.save(flush: true)
        }
        def mainFile = MsFile.findByProjectAndFileName(project, params.mainFileName)
        if (!mainFile) {
            mainFile = new MsFile()
            mainFile.project = project
            mainFile.fileName = params.mainFileName
            mainFile.fileSize = params.mainFileSize.toLong()
            mainFile.smallFileNum = params.smallFileNum.toInteger()
            mainFile.save()

            //TODO save the small file info

        }else{
            returnMsg.flag = 0
            returnMsg.msg = '存在同名微地震数据文件'
        }

        render(returnMsg as JSON)
    }

    def receiveFile() {
        def msFile = request.getFile('msFile')
        if (msFile) {
            //判断该项目及对应文件信息是否已保存在数据库中

            //判读在指定位置以项目名称为目录的文件夹是否存在

            //保存拆分后的文件，将上传标志置为true，更新微地震文件表中的百分比值

        }
    }

    def listFile() {
        *//*分成两个查询：
          1、将正在进行上传的微地震数据放在一个结果集里
          2、将已完成上传的微地震数据放在一个结果集里
        *//*

    }*/

    def catchProjects(){
        def list=[]
        if(params.id){
            def projects=MsProject.findAllByMsUser(MsUser.get(params.id));
            projects.each{project->
                def map=[:]
                map.id=project.id;
                map.name=project.projectName;
                map.rigName=project.rigName;
                list<<map;
            }
        }
        render list as JSON;
    }
    //增加一条文件记录()
    def addOneFile(){
        //params（name,projectId,path,size,splitStartNum,splitEndNum,md5）
        def map=[:]
        def msProject=MsProject.get(params.projectId);
        def num=MsFile.countByMsProjectAndFileName(msProject,params.name);
        if(num>0){
            map.result=false;
            map.error=100;
            map.message="项目下已存在同名的文件";
        }else{
            def msFile=new MsFile(fileName: params.name,msProject: msProject);
            msFile.fileSize=params.size.toLong();
            msFile.clientPath=params.path;
            msFile.smallFileNum=params.splitEndNum.toInteger()+1;
            msFile.md5=params.md5;
            if(msFile.save(flush: true)){
                map.result=true;
                map.id=msFile.id;
            }else{
                map.result=false;
                map.error=200;
                map.message=msFile.errors.allErrors.collect {it.toString()}.join(";<br/>");
            }
        }
        render map as JSON;
    }
    def finishOneFile(){
        //params（fileId）
        def map=[:]
        def msFile=MsFile.get(params.fileId);
        if(msFile){
            def count=MsSmallFile.countByMsFileAndUploaded(msFile,true);
            if(count==msFile.smallFileNum){
                def file=new File(request.servletContext.getRealPath("/WEB-INF/files/${msFile.msProject.projectName}/${msFile.fileName}"));
                file.parentFile.mkdirs();
                msFile.serverPath=file.path;
                msFile.save(flush: true);
                file.withObjectOutputStream {outputStream->
                    MsSmallFile.findAllByMsFileAndUploaded(msFile,true,['sort':'splitNum','order':'asc']).each{smallFile->
                        outputStream.write(new File(smallFile.serverPath).bytes);
                    }
                }
                if(file.length()==msFile.fileSize){
                    if(file.bytes.encodeAsMD5()==msFile.md5){
                        msFile.uploaded=true;
                        msFile.save(flush: true);
                        map.result=true;
                    }else{
                        map.result=false;
                        map.error=600;
                        map.message="文件md5不一致";
                    }
                }else{
                    map.result=false;
                    map.error=500;
                    map.message="文件大小不一致";
                }
            }else{
                map.result=false;
                map.error=400;
                map.message="未上传完文件块";
            }

        }else{
            map.result=false;
            map.error=300;
            map.message="没有此文件";
        }
        render map as JSON;
    }
    def uploadOneBlock(){
        //params（name,fileId,splitNum,path,size,splitStartNum,splitEndNum,md5，uploadFile（二进制文件））
        def msFile=MsFile.get(params.fileId);
        def map=[:]
        if(msFile){
            def smallFile=MsSmallFile.findByMsFileAndFileName(msFile,params.name);
            if(!smallFile){
                smallFile=new MsSmallFile(fileName: params.name,fileSize: params.size.toLong(),splitNum:params.splitNum.toInteger());
                smallFile.msFile=msFile;
                smallFile.clientPath=params.path;
                smallFile.md5=params.md5;
                smallFile.save(flush: true);
            }
            if(smallFile.uploaded && smallFile.serverPath){
                map.result=false;
                map.error=000;
                map.message="之前已上传成功";
            }else{
                def file=new File(request.servletContext.getRealPath("/WEB-INF/smallFiles/${msFile.msProject.projectName}/${smallFile.fileName}"));
                file.parentFile.mkdirs();
                def uploadFile=request.getFile("uploadFile");
                uploadFile.transferTo(file);
                smallFile.serverPath=file.path;
                if(file.length()==smallFile.fileSize){
                    if(file.bytes.encodeAsMD5()==smallFile.md5){
                        smallFile.uploaded=true;
                    }else{
                        map.result=false;
                        map.error=900;
                        map.message="文件块md5不一致";
                    }
                }else{
                    map.result=false;
                    map.error=800;
                    map.message="文件块大小不一致";
                }
                smallFile.save(flush: true);
            }
        }else{
            map.result=false;
            map.error=700;
            map.message="没有父文件信息";
        }
        render map as JSON;
    }
}
