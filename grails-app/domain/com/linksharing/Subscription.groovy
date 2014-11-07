package com.linksharing

class Subscription {


    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }
}
