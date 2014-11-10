package com.linksharing

class User {

    String name;
    int  age;
    String city;
    String email
    String password
    static hasMany = [topics : Topic,subscriptions:Subscription]
    static constraints = {
      /*  name validator: {
            if (it.length()<3) return ['entryMissing']
        }
        email(email: true, unique: true, blank:false,nullable: false )
        password(size: 5..15, blank: false)*/
    }
}
