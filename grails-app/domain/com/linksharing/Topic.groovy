package com.linksharing


class Topic {
    String name;
    //User createdBy;
    Date dateCreated
    Date lastUpdated
    Visibilty visibility

    static belongsTo = [user : User]
    static hasMany = [subscriptions : Subscription ,resources : Resource]
    static constraints = {
    }
}
