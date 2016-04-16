package com.petrodata.microseism

class MsProject {

    //项目名称
    String projectName
    //所在井队名称
    String rigName
    //创建者，就是登录的用户
    MsUser creator
    String remark
    Date dateCreated
    Date lastUpdated

    static constraints = {
        projectName(size: 0..200, nullable: false)
        rigName(size: 0..100, nullable: true)
        creator(nullable: false)
        remark(size: 0..1000, nullable: true)
    }

    static hasMany = [files : MsFile]
}
