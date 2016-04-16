package com.petrodata.microseism

//拆分后单个文件表
class MsSmallFile {

    //文件名称
    String fileName
    //文件大小，以字节个数记录
    Long fileSize
    //上传成功与否标志
    Boolean uploaded = false
    Date dateCreated
    Date lastUpdated

    static constraints = {
        fileName(size: 0..200, nullable: false)
        fileSize(nullable: false)
        uploaded(nullable: false)
    }

    static belongsTo = [file : MsFile]
}
