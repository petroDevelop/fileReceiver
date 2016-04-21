package com.petrodata.microseism

import grails.converters.JSON

class LoginController {

    def index() {

    }
    def clientLogin(){
        def map=[:]
        def user=MsUser.findByUserName(params.username);
        if(user.userPwd==params.password){
            map.result=true;
            map.id=user.id;
            map.name=user.userName;
            map.username=user.userName;
        }else{
            map.result=false;
        }
        render map as JSON;
    }
    def auth(){

    }
}
