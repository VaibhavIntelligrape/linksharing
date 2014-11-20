package com.linksharing

class User {

    String firstName;
    String lastName;
    String username;
    String image;
    String email
    String password
    String confirmPassword
    static  transients=['confirmPassword']
    String isAdmin
    static hasMany = [topics : Topic,subscriptions:Subscription]


    static constraints = {
        confirmPassword (bindable:true)
        image (blank: true,nullable: true)
        password (blank: false, nullable: false, size:4..10,
                validator: {password, obj ->
                    if(obj.confirmPassword != password){
                        return ["Password do not match"]
                    }
        })
       /*name validator: {
            if (it.length()<3) return ['entryMissing']
        }*//*
      *//*  password validator: {
            if(!password==confirmPassword) return ['false']
        }

     email(email: true, unique: true, blank:false,nullable: false )
        password(size: 4..15, blank: false)*//*
    }*/
}
}