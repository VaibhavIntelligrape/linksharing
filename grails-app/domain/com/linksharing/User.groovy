package com.linksharing

class User {

    String name;
    String image;
    int  age;
    String city;
    String email
    String password
    String confirmPassword
    static  transients=['confirmPassword']
    static hasMany = [topics : Topic,subscriptions:Subscription]
    static constraints = {
        image (blank: true,nullable: true)
       /*name validator: {
            if (it.length()<3) return ['entryMissing']
        }*/
      /*  password validator: {
            if(!password==confirmPassword) return ['false']
        }

     email(email: true, unique: true, blank:false,nullable: false )
        password(size: 4..15, blank: false)*/
    }
}
