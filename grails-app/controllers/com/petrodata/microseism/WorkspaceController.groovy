package com.petrodata.microseism

class WorkspaceController {
     def beforeInterceptor = [action: this.&auth, except: 'login']

    private auth() {
        if (!session.user) {
            redirect(controller: 'login',action: 'auth')
            return false
        }
    }
    def index() {}
}
