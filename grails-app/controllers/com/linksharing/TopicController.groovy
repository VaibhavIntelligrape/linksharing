package com.linksharing

import linksharing.UserPersistService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TopicController {


    def createUserTopic(){

        String userId=session["user_id"]
        UserPersistService userPersistService=new UserPersistService()
        User user=userPersistService.returnUser(userId)
        println("Topic Params :- "+params)
        Topic topic=new Topic(params)
        //topic.visibility=params["visibility"]
        topic.user=user
        println("Topic object :- "+topic.properties)
        boolean status=userPersistService.createTopic(topic)
        println("Topic save status :- "+status)
        if (status==true){
//            return "Topic saved.."
            render("Topic successfully saved.")
        }
        else {
//            return  "Topic not saved.."
            render("Topic not saved.")
        }
    }

    def topicShow(){

        println("PARAMS :- "+params)
        UserPersistService userPersistService =new UserPersistService()
        String topicId=params["tid"]
        Topic topic=Topic.findById(topicId)

        params["topicObject"]=topic

        //to take total users of a topic :-
        println( "---------------------")
        List<User> userList  = Subscription.createCriteria().list {
            projections{
                property("user")
            }
            eq("topic",topic )
        }

        println("USERList :- "+userList)
        params["subscribedUserList"]=userList


        List<Resource> resourceList=Resource.findAllByTopic(topic)
        println("Resource List of particular topic :- "+resourceList)
        params["resourceList"]=resourceList



        //For user detail page :-


        String uId=session["user_id"]

        User user=userPersistService.returnUser(uId)
        params["userObject"]=user

        /*List<Subscription> subscriptionList=userPersistService.returnUserSubscriptions(user.id)
           String totalUserSubscriptions= subscriptionList.size()*/


        List<Subscription> subscriptionList=userPersistService.returnUserSubscriptions(uId)
        println("subcriptionList SIze :- "+subscriptionList.size())
        params["userSubscriptionSize"]=subscriptionList.size()

        List<Topic> topicList=userPersistService.returnUserTopic(uId)
        println("TopicList SIze :- "+topicList.size())
        params["userTopicList"]=topicList
        params["userTopicListSize"]=topicList.size()





    }



    /*static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
    }

    def show(Topic topicInstance) {
        respond topicInstance
    }

    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'create'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }*/
}
