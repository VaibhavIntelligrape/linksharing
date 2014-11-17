package com.linksharing

import linksharing.UserPersistService

class HomeController {

    def index() {}

    def dashBoard() {
        if(session["user"]){
        println("In dsh....")

        println "Welcome ,"+session["user"]
        println("User ID From session :: "+session["user_id"])

            String uId=session["user_id"]

        request.setAttribute("user",session["user"])
            UserPersistService userPersistService =new UserPersistService()

         //For user detail page :-
         User user=userPersistService.returnUser(uId)
         params["userObject"]=user
            println("Usr :- "+user.properties)

        /*List<Subscription> subscriptionList=userPersistService.returnUserSubscriptions(user.id)
           String totalUserSubscriptions= subscriptionList.size()*/


            List<Subscription> subscriptionList=userPersistService.returnUserSubscriptions(uId)
            println("subcriptionList SIze :- "+subscriptionList.size())
            params["userSubscriptionSize"]=subscriptionList.size()

            List<Topic> topicList=userPersistService.returnUserTopic(uId)
            println("TopicList SIze :- "+topicList.size())
            params["userTopicList"]=topicList
            params["userTopicListSize"]=topicList.size()



        List<Resource> resourceList=userPersistService.recentShares();
        println("resourceList :: "+resourceList)
        request.setAttribute("resourceList",resourceList)


         List<Resource> list=(List<Resource>) userPersistService.userInbox(uId)
        println("Inbox resource list :: - "+list)

        request.setAttribute("inboxList",list)


         //for trending topics :-

            List<Topic> trendingTopicList=userPersistService.getTrendingTopics()
                params["trendingTopicList"]=trendingTopicList


            userPersistService.returnUserSubscriptions1(user)


        }
    }
}
















