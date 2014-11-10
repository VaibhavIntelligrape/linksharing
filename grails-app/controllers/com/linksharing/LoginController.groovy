package com.linksharing

import linksharing.UserPersistService

/**
 * Created by intelligrape on 8/11/14.
 */
class LoginController {

    def beforeInterceptor = [action: this.&auth, only: 'index']
// defined with private scope, so it's not considered an action
    private auth() {

        println( " USer ::- "+session["user"])
        if (session["user"]) {
            redirect(controller:'home',action:'dashBoard')
            return false
        }
    }

    def index() {
        println( " LoginController ... index()....")
        println(request.getAttribute("msg").toString())
    }

    def register() {
        UserPersistService userPersistService =new UserPersistService()
        println( " LoginController ... registration()....")
        println(params)
        User user=new User()
        user.properties=params
        println("User :: "+user.properties)
        boolean status=userPersistService.createUser(user)
        if(status==true){
            session["user"] = user.name
            println("sesion name :::: "+session["user"])
            println("COrrect User ::  going to redirect .... ")
            redirect(controller:'login',action:'index')
        }
        else {
            println("COrrect User ::  going to redirect .... ")
            redirect(controller:'login',action:'index')
        }
    }

}
