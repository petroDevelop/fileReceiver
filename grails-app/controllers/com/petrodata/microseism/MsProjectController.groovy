package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class MsProjectController {

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
        //[msProjectInstanceList: MsProject.list(params), msProjectInstanceTotal: MsProject.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=MsProject.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=MsProject.createCriteria().list{
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
        [msProjectInstance: new MsProject(params)]
    }

    def save() {
        def msProjectInstance = new MsProject(params)
        if (!msProjectInstance.save(flush: true)) {
            render(view: "create", model: [msProjectInstance: msProjectInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'msProject.label', default: 'MsProject'), msProjectInstance.id])
        redirect(action: "list", id: msProjectInstance.id)
    }

    def show(Long id) {
        def msProjectInstance = MsProject.get(id)
        if (!msProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msProject.label', default: 'MsProject'), id])
            redirect(action: "list")
            return
        }

        [msProjectInstance: msProjectInstance]
    }

    def edit(Long id) {
        def msProjectInstance = MsProject.get(id)
        if (!msProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msProject.label', default: 'MsProject'), id])
            redirect(action: "list")
            return
        }

        [msProjectInstance: msProjectInstance]
    }

    def update(Long id, Long version) {
        def msProjectInstance = MsProject.get(id)
        if (!msProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msProject.label', default: 'MsProject'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (msProjectInstance.version > version) {
                    msProjectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'msProject.label', default: 'MsProject')] as Object[],
                            "Another user has updated this MsProject while you were editing")
                render(view: "edit", model: [msProjectInstance: msProjectInstance])
                return
            }
        }

        msProjectInstance.properties = params

        if (!msProjectInstance.save(flush: true)) {
            render(view: "edit", model: [msProjectInstance: msProjectInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'msProject.label', default: 'MsProject'), msProjectInstance.id])
        redirect(action: "list", id: msProjectInstance.id)
    }

    def delete(Long id) {
        def msProjectInstance = MsProject.get(id)
        if (!msProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msProject.label', default: 'MsProject'), id])
            redirect(action: "list")
            return
        }

        try {
            msProjectInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'msProject.label', default: 'MsProject'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'msProject.label', default: 'MsProject'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=MsProject.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'msProject.label', default: 'MsProject'), params.ids])
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
