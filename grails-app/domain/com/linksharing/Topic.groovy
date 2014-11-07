package com.linksharing


class Topic {
    String name;
    //User createdBy;
    Date dateCreated;
    Date lastupdated;
    Visibilty visibility

    static belongsTo = [user : User]
    static hasMany = [subscriptions : Subscription ,resources : Resource]
    static constraints = {
    }
}
