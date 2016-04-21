package com.queue

class OnNotificationService {
    boolean transactional = false
    static exposes = ['jms']
    static destination = "queue.notification"

    def onMessage(it){
        println "GOT MESSAGE: $it"
    }
}
