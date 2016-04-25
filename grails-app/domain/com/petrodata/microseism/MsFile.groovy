package com.petrodata.microseism

//微地震数据文件表
class MsFile {

    //文件名称
    String fileName
    //文件大小，以字节个数记录
    long fileSize
    //拆分成多少个小文件
    int smallFileNum=1;
    //上传总进度
    transient int percent    // 0--100
    //上传成功与否标志
    boolean uploaded = false
    MsProject msProject
    //客户端path
    String clientPath
    String md5
    //服务器合并后path
    String serverPath
    Date dateCreated
    Date lastUpdated

    static constraints = {
        fileName(size: 0..200, nullable: false)
        fileSize()
        smallFileNum()
        percent()
        uploaded()
        clientPath(size: 0..500,nullable: true)
        md5(size: 0..500,nullable: true)
        serverPath(size: 0..500,nullable: true)
    }

    static belongsTo = [msProject: MsProject]
    //static hasMany = [files : MsSmallFile]
    String toString(){
        return fileName
    }
    int getPercent(){
        if(!id ||this.id<=0){return 0}
        def count=MsSmallFile.countByMsFileAndUploaded(this,true);
        return (count/smallFileNum).intValue();
    }
}
