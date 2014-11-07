package com.linksharing

abstract class Resource {

    String description;
    Date dateCreated;
    Date lastUpdated;

    static constraints = {
        description(maxSize: 1024)
    }
}
