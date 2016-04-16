package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException

class MsSmallFileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [msSmallFileInstanceList: MsSmallFile.list(params), msSmallFileInstanceTotal: MsSmallFile.count()]
    }

    def create() {
        [msSmallFileInstance: new MsSmallFile(params)]
    }

    def save() {
        def msSmallFileInstance = new MsSmallFile(params)
        if (!msSmallFileInstance.save(flush: true)) {
            render(view: "create", model: [msSmallFileInstance: msSmallFileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), msSmallFileInstance.id])
        redirect(action: "show", id: msSmallFileInstance.id)
    }

    def show(Long id) {
        def msSmallFileInstance = MsSmallFile.get(id)
        if (!msSmallFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), id])
            redirect(action: "list")
            return
        }

        [msSmallFileInstance: msSmallFileInstance]
    }

    def edit(Long id) {
        def msSmallFileInstance = MsSmallFile.get(id)
        if (!msSmallFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), id])
            redirect(action: "list")
            return
        }

        [msSmallFileInstance: msSmallFileInstance]
    }

    def update(Long id, Long version) {
        def msSmallFileInstance = MsSmallFile.get(id)
        if (!msSmallFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (msSmallFileInstance.version > version) {
                msSmallFileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'msSmallFile.label', default: 'MsSmallFile')] as Object[],
                          "Another user has updated this MsSmallFile while you were editing")
                render(view: "edit", model: [msSmallFileInstance: msSmallFileInstance])
                return
            }
        }

        msSmallFileInstance.properties = params

        if (!msSmallFileInstance.save(flush: true)) {
            render(view: "edit", model: [msSmallFileInstance: msSmallFileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), msSmallFileInstance.id])
        redirect(action: "show", id: msSmallFileInstance.id)
    }

    def delete(Long id) {
        def msSmallFileInstance = MsSmallFile.get(id)
        if (!msSmallFileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), id])
            redirect(action: "list")
            return
        }

        try {
            msSmallFileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile'), id])
            redirect(action: "show", id: id)
        }
    }
}
