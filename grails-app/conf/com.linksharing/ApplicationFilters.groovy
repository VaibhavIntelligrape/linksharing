package com.linksharing

class ApplicationFilters {

    def filters = {
        all(controller:'login', action: 'index|loginHandler|register' ,invert:"true") {
            before = {
           println("In Filter :: "+params)
                String user=session["user"]
               /* if (!session["user_id"] && !actionName.equals('index')) {
                    println("Going to redirect from filter...")
                    redirect(controller:'login',action: 'index')
                    return false
                }*/

                if(user==null){
                    println("User not found in session :: "+user)
                    redirect(controller: 'login',action: 'index')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }


    }
}
