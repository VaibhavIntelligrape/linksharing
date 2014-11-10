package com.linksharing

class HomeController {

    def index() {}

    def dashBoard() {

        println("In dsh....")

        println "Welcome ,"+session["user"]

        request.setAttribute("userName",session["user"])

    }
}
