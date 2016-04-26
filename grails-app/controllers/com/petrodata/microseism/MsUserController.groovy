package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class MsUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]
    def beforeInterceptor = [action: this.&auth, except: 'login']

    private auth() {
        if (!session.user) {
            redirect(controller: 'login',action: 'auth')
            return false
        }
    }
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[msUserInstanceList: MsUser.list(params), msUserInstanceTotal: MsUser.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=MsUser.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=MsUser.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }
    def create() {
        [msUserInstance: new MsUser(params)]
    }

    def save() {
        def msUserInstance = new MsUser(params)
        if (!msUserInstance.save(flush: true)) {
            render(view: "create", model: [msUserInstance: msUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'msUser.label', default: 'MsUser'), msUserInstance.id])
        redirect(action: "list", id: msUserInstance.id)
    }

    def show(String id) {
        def msUserInstance = MsUser.get(id)
        if (!msUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
            return
        }

        [msUserInstance: msUserInstance]
    }

    def edit(String id) {
        def msUserInstance = MsUser.get(id)
        if (!msUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
            return
        }

        [msUserInstance: msUserInstance]
    }

    def update(String id, Long version) {
        def msUserInstance = MsUser.get(id)
        if (!msUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (msUserInstance.version > version) {
                    msUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'msUser.label', default: 'MsUser')] as Object[],
                            "Another user has updated this MsUser while you were editing")
                render(view: "edit", model: [msUserInstance: msUserInstance])
                return
            }
        }

        msUserInstance.properties = params

        if (!msUserInstance.save(flush: true)) {
            render(view: "edit", model: [msUserInstance: msUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'msUser.label', default: 'MsUser'), msUserInstance.id])
        redirect(action: "list", id: msUserInstance.id)
    }

    def delete(String id) {
        def msUserInstance = MsUser.get(id)
        if (!msUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
            return
        }

        try {
            msUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=MsUser.get(it);
                
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'msUser.label', default: 'MsUser'), params.ids])
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }
    def importExel(){
        def map=[:];
        def file = request.getFile('file');
        if(file ||!file?.empty) {  //file.originalFilename
            try{
                new ExcelReadBuilder(2003,file.bytes).eachLine([sheet:'sheet1',labels:true]) {
                   println "${it.rowNum},${cell[0]},${cell[1]},${cell[2]},${cell[3]}......"
                }
                map.result=true;
            }catch(e){
                map.result=false;
                map.message=e.message;
            }
        }else{
            map.result=false;
            map.message="file is empty!";
        }
        render((map as JSON).toString());
    }
}
