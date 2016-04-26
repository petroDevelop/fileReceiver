package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class MsRoleController {

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
        //[msRoleInstanceList: MsRole.list(params), msRoleInstanceTotal: MsRole.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=MsRole.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=MsRole.createCriteria().list{
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
        [msRoleInstance: new MsRole(params)]
    }

    def save() {
        def msRoleInstance = new MsRole(params)
        if (!msRoleInstance.save(flush: true)) {
            render(view: "create", model: [msRoleInstance: msRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'msRole.label', default: 'MsRole'), msRoleInstance.id])
        redirect(action: "list", id: msRoleInstance.id)
    }

    def show(Long id) {
        def msRoleInstance = MsRole.get(id)
        if (!msRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msRole.label', default: 'MsRole'), id])
            redirect(action: "list")
            return
        }

        [msRoleInstance: msRoleInstance]
    }

    def edit(Long id) {
        def msRoleInstance = MsRole.get(id)
        if (!msRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msRole.label', default: 'MsRole'), id])
            redirect(action: "list")
            return
        }

        [msRoleInstance: msRoleInstance]
    }

    def update(Long id, Long version) {
        def msRoleInstance = MsRole.get(id)
        if (!msRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msRole.label', default: 'MsRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (msRoleInstance.version > version) {
                    msRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'msRole.label', default: 'MsRole')] as Object[],
                            "Another user has updated this MsRole while you were editing")
                render(view: "edit", model: [msRoleInstance: msRoleInstance])
                return
            }
        }

        msRoleInstance.properties = params

        if (!msRoleInstance.save(flush: true)) {
            render(view: "edit", model: [msRoleInstance: msRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'msRole.label', default: 'MsRole'), msRoleInstance.id])
        redirect(action: "list", id: msRoleInstance.id)
    }

    def delete(Long id) {
        def msRoleInstance = MsRole.get(id)
        if (!msRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msRole.label', default: 'MsRole'), id])
            redirect(action: "list")
            return
        }

        try {
            msRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'msRole.label', default: 'MsRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'msRole.label', default: 'MsRole'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=MsRole.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'msRole.label', default: 'MsRole'), params.ids])
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
