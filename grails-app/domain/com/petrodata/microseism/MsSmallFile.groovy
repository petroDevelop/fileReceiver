package com.petrodata.microseism

//拆分后单个文件表
class MsSmallFile {

    //文件名称
    String fileName
    //文件大小，以字节个数记录
    long fileSize
    //切分顺序
    int splitNum
    MsFile msFile
    //客户端path
    String clientPath
    String md5
    //服务器合并后path
    String serverPath
    //上传成功与否标志
    boolean uploaded = false
    Date dateCreated
    Date lastUpdated

    static constraints = {
        fileName(size: 0..200, nullable: false)
        splitNum()
        fileSize(nullable: false)
        clientPath(size: 0..500, nullable: true)
        md5(size: 0..500, nullable: true)
        serverPath(size: 0..500, nullable: true)
        uploaded(nullable: false)
    }

    static belongsTo = [msFile : MsFile]
    String toString(){
        return fileName
    }
}
