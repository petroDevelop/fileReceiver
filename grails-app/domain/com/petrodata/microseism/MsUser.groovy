package com.petrodata.microseism

class MsUser {

    String userName
    String userPwd
    //所在井队名称，可以不填
    String rigName
    MsRole role

    static constraints = {
        userName(size: 0..50, nullable: false,unique: true)
        userPwd(size: 0..50, nullable: false)
        rigName(size: 0..100, nullable: true)
        role(nullable: false)
    }
    static mapping = {
        id generator: 'uuid'
    }
}
