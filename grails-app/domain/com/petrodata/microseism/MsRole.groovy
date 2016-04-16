package com.petrodata.microseism

class MsRole {

    String roleName
    String remark

    static constraints = {
        roleName(size: 0..10, nullable: false)
        remark(size: 0..500, nullable: true)
    }
    String toString(){
        return roleName
    }
}
