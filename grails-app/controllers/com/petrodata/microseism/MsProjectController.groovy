package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException

class MsProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [msProjectInstanceList: MsProject.list(params), msProjectInstanceTotal: MsProject.count()]
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
        redirect(action: "show", id: msProjectInstance.id)
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
        redirect(action: "show", id: msProjectInstance.id)
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
}
