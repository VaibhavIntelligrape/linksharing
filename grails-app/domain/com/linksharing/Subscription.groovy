package com.linksharing

class Subscription {

    Seriousness seriousness;

    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }
}
