package com.linksharing

/**
 * Created by intelligrape on 7/11/14.
 */
class ReadingItem {

    boolean isRead;
    static belongsTo = [user : User,resource: Resource]
}
