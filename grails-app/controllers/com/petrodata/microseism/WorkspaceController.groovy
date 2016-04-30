package com.petrodata.microseism

import grails.converters.JSON

class WorkspaceController {
     def beforeInterceptor = [action: this.&auth, except: 'login']

    private auth() {
        if (!session.user) {
            redirect(controller: 'login',action: 'auth')
            return false
        }
    }
    def index() {}
    def catchFileSaveDirectory(){
        def map=[:]
        try{
            def properties=new Properties()
            def inStream=MicroseismController.class.getResourceAsStream("/config.properties")
            properties.load(inStream.newReader('utf8'))
            def realPath=properties.getProperty("fileSaveDirectory");
            if(!realPath){
                realPath=request.servletContext.getRealPath("/WEB-INF");
            }
            map.path=realPath;
        }catch(e){
            map.path=request.servletContext.getRealPath("/WEB-INF");
        }
        render map as JSON;
    }
    def changeFileSaveDirectory(){
        def map=[:];
        try{
            def file=new File(params.path);
            if(file.exists()){
                if(file.isDirectory()){
                }else{
                    file.delete();
                    file.mkdirs();
                }
            }else{
                file.mkdirs();
            }
            def resource=MicroseismController.class.getResource("/config.properties");
            //def inStream=MicroseismController.class.getResourceAsStream("/config.properties");
            println resource.path
            def one=new File(resource.path)
            println one.path
            one.withWriter {write->
                write.write("fileSaveDirectory=${file.path}")
            }
            map.result=true;
        }catch(e){
            map.result=false;
            map.message=e.message
        }
        render map as JSON;
    }
    def changeSkin(){
        if(params.skin){
            session.skin=params.skin;
        }
        def map=[:]
        map.result=true;
        render map as JSON;
    }
}
