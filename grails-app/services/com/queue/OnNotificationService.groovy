package com.queue

import com.petrodata.microseism.MsFile
import com.petrodata.microseism.MsSmallFile

class OnNotificationService {
    boolean transactional = false
    static exposes = ['jms']
    static destination = "queue.notification"

    def onMessage(obj){
        if(obj.fileId){
            //if(obj.taskType=='finishOneFile'){
            //    combineOneFile(MsFile.get(obj.fileId),obj.realpath);
            //}
            if(obj.taskType=='uploadOneBlock'){
                def map=processBlockFile(obj);
                if(!map.result){
                    println map
                }
            }
        }
    }
    private processBlockFile(obj){
        try{
            if(obj.fileId){
                def msFile=MsFile.get(obj.fileId);
                def map=[:]
                if(msFile){
                    def smallFile=MsSmallFile.findByMsFileAndFileName(msFile,obj.name.decodeURL());
                    if(!smallFile){
                        smallFile=new MsSmallFile(fileName: obj.name.decodeURL(),fileSize: obj.size.toLong(),splitNum:obj.splitNum.toInteger());
                        smallFile.msFile=msFile;
                        smallFile.clientPath=obj.path?.decodeURL();
                        smallFile.md5=obj.md5;
                        smallFile.save(flush: true);
                    }
                    if(smallFile.uploaded && smallFile.serverPath){
                        map.result=false;
                        map.error=000;
                        map.message="之前已上传成功";
                    }else{
                        def file=new File(obj.realpath+"/smallFiles/${msFile.msProject.projectName}/${smallFile.fileName}");
                        file.parentFile.mkdirs();
                        file.bytes=obj.block;
                        smallFile.serverPath=file.path;
                        smallFile.save(flush: true);
                        //println obj.splitNum+"="+file.length()+"======"+smallFile.fileSize
                        if(file.length()==smallFile.fileSize){
                            if(file.bytes.encodeAsMD5()==smallFile.md5){
                                smallFile.uploaded=true;
                                map.result=true;
                                smallFile.save(flush: true);
                                //判断是否文件都已传完并合并
                                if(MsSmallFile.countByMsFileAndUploaded(msFile,true)==msFile.smallFileNum){
                                   map=combineOneFile(msFile,obj.realpath);
                                }
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

                    }
                }else{
                    map.result=false;
                    map.error=700;
                    map.message="没有父文件信息";
                }
                return map;
            }
            return [result:false,message:'未提供fileId'];
        }catch(e){
            println e.message
            return [result:false,message:e.message]
        }

    }
    private combineOneFile(MsFile msFile,realpath){
        def map=[:]
        if(msFile){
            def count=MsSmallFile.countByMsFileAndUploaded(msFile,true);
            if(count==msFile.smallFileNum){
                def file=new File(realpath+"/files/${msFile.msProject.projectName}/${msFile.fileName}");
                file.parentFile.mkdirs();
                file.deleteOnExit();
                msFile.serverPath=file.path;
                msFile.save(flush: true);
                file.withOutputStream {outputStream->
                    MsSmallFile.findAllByMsFileAndUploaded(msFile,true,['sort':'splitNum','order':'asc']).each{smallFile->
                        def oneSmallFile=new File(smallFile.serverPath);
                        if(oneSmallFile.exists()){
                            outputStream.write(oneSmallFile.bytes);
                            oneSmallFile.delete();
                        }
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
        //println map;
        return map;
    }
}
