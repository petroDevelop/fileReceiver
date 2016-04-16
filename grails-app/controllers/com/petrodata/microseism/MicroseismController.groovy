package com.petrodata.microseism

import grails.converters.JSON

class MicroseismController {

   // def beforeInterceptor = [action: this.&auth, except: 'login']

    private auth() {
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
    }

    def saveProject() {
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
        /*分成两个查询：
          1、将正在进行上传的微地震数据放在一个结果集里
          2、将已完成上传的微地震数据放在一个结果集里
        */

    }

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
}
