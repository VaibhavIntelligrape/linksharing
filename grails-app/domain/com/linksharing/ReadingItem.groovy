package com.linksharing

/**
 * Created by intelligrape on 7/11/14.
 */
class ReadingItem {

    Date dateCreated;
    Date lastUpdated;
    boolean isRead;
    static belongsTo = [user : User,resource: Resource]
}
