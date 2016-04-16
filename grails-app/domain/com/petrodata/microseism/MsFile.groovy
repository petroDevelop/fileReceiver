package com.petrodata.microseism

//微地震数据文件表
class MsFile {

    //文件名称
    String fileName
    //文件大小，以字节个数记录
    long fileSize
    //拆分成多少个小文件
    int smallFileNum
    //上传总进度
    int percent    // 0--100
    MsProject project
    Date dateCreated
    Date lastUpdated

    static constraints = {
        fileName(size: 0..200, nullable: false)
        fileSize()
        smallFileNum()
        percent()
    }

    static belongsTo = [project: MsProject]
    static hasMany = [files : MsSmallFile]
}
