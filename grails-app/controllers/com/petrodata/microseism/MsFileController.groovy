package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException

class MsFileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [msFileInstanceList: MsFile.list(params), msFileInstanceTotal: MsFile.count()]
    }

    def create() {
        [msFileInstance: new MsFile(params)]
    }

    def save() {
        def msFileInstance = new MsFile(params)
        if (!msFileInstance.save(flush: true)) {
            render(view: "create", model: [msFileInstance: msFileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'msFile.label', default: 'MsFile'), msFileInstance.id])
        redirect(action: "show", id: msFileInstance.id)
    }

    def show(Long id) {
        def msFileInstance = MsFile.get(id)
        if (!msFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msFile.label', default: 'MsFile'), id])
            redirect(action: "list")
            return
        }

        [msFileInstance: msFileInstance]
    }

    def edit(Long id) {
        def msFileInstance = MsFile.get(id)
        if (!msFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msFile.label', default: 'MsFile'), id])
            redirect(action: "list")
            return
        }

        [msFileInstance: msFileInstance]
    }

    def update(Long id, Long version) {
        def msFileInstance = MsFile.get(id)
        if (!msFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msFile.label', default: 'MsFile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (msFileInstance.version > version) {
                msFileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'msFile.label', default: 'MsFile')] as Object[],
                          "Another user has updated this MsFile while you were editing")
                render(view: "edit", model: [msFileInstance: msFileInstance])
                return
            }
        }

        msFileInstance.properties = params

        if (!msFileInstance.save(flush: true)) {
            render(view: "edit", model: [msFileInstance: msFileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'msFile.label', default: 'MsFile'), msFileInstance.id])
        redirect(action: "show", id: msFileInstance.id)
    }

    def delete(Long id) {
        def msFileInstance = MsFile.get(id)
        if (!msFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msFile.label', default: 'MsFile'), id])
            redirect(action: "list")
            return
        }

        try {
            msFileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'msFile.label', default: 'MsFile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'msFile.label', default: 'MsFile'), id])
            redirect(action: "show", id: id)
        }
    }
}
