package com.linksharing

class User {

    String firstName;
    String lastName;
    String username;
    String image;
    String email
    String password
    String confirmPassword
    //static  transients=['confirmPassword']
    String isAdmin
    static hasMany = [topics : Topic,subscriptions:Subscription]
    static constraints = {
        image (blank: true,nullable: true)
        password (blank: false, nullable: false, size:4..10 ,
                validator: {password, obj ->
            def password2 = obj.properties["confirmPassword"]
                    println("password2 :- "+password2)
                    println("OBJ :- "+obj.properties)
                    println("OBJ :- "+obj.password)
                    println("password :: "+password)
            password2 == password ? true : ["Password do not match"/*'invalid.matchingpasswords'*/]
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