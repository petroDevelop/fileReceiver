package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException

class MsRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [msRoleInstanceList: MsRole.list(params), msRoleInstanceTotal: MsRole.count()]
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
        redirect(action: "show", id: msRoleInstance.id)
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
        redirect(action: "show", id: msRoleInstance.id)
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
}
