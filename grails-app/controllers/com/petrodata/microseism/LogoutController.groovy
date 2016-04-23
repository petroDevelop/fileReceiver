package com.petrodata.microseism

class LogoutController {

    def index() {
        session.invalidate();
        redirect(controller: "workspace",action: "index")
    }
}
