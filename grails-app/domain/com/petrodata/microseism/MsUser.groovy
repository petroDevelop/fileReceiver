package com.petrodata.microseism

class MsUser {
    String id
    String userName
    String userPwd
    //所在井队名称，可以不填
    String rigName
    MsRole msRole

    static constraints = {
        userName(size: 0..50, nullable: false,unique: true)
        userPwd(size: 0..50, nullable: false)
        rigName(size: 0..100, nullable: true)
        msRole(nullable: false)
    }
    static mapping = {
        id generator: 'uuid'
    }
    String toString(){
        return userName
    }
}
