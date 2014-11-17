package com.linksharing

import linksharing.UserPersistService
import org.grails.datastore.mapping.core.DatastoreUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = [action: this.&auth, only: 'list']
// defined with private scope, so it's not considered an action
    private auth() {

        String uid=session["user_id"]
        User user=User.findById(uid)
        if(user.isAdmin.equals("true")){
            return true
        }
        else{
            redirect(url: '/')
            return false}
    }

    def list(){
            List<User> userList=User.findAll()
            params["userList"]=userList
    }



    def index(Integer max) {
        //log.error("User Controller :: index() started ...")
        log.info("User Controller :: index() started ...")
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }



    def show(User userInstance) {
        log.info("User Controller :: Show() started ...")
        respond userInstance
    }

    def create() {
        log.info("User Controller :: create() started ...")
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        log.info("User Controller :: save() started ...")
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        log.info("User Controller :: edit() started ...")
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        log.info("User Controller :: update() started ...")
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {
        log.info("User Controller :: delete() started ...")
        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
