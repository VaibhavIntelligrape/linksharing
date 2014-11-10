package com.linksharing

abstract class Resource {

    String description;
    Date dateCreated;
    Date lastUpdated;
    static belongsTo = [topic:Topic ,user:User]
    static constraints = {
        description(maxSize: 1024)
    }
}
