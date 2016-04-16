package com.petrodata.microseism

import org.springframework.dao.DataIntegrityViolationException

class MsUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [msUserInstanceList: MsUser.list(params), msUserInstanceTotal: MsUser.count()]
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
        redirect(action: "show", id: msUserInstance.id)
    }

    def show(Long id) {
        def msUserInstance = MsUser.get(id)
        if (!msUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
            return
        }

        [msUserInstance: msUserInstance]
    }

    def edit(Long id) {
        def msUserInstance = MsUser.get(id)
        if (!msUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'msUser.label', default: 'MsUser'), id])
            redirect(action: "list")
            return
        }

        [msUserInstance: msUserInstance]
    }

    def update(Long id, Long version) {
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
        redirect(action: "show", id: msUserInstance.id)
    }

    def delete(Long id) {
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
}
