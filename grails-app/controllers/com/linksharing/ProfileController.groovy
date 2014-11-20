package com.linksharing

import linksharing.UserPersistService

class ProfileController {



    def profilePublicaly() {

        String uId=params["uid"]

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


        //for trending topics :-

        List<Topic> trendingTopicList=userPersistService.getTrendingTopics()
        params["trendingTopicList"]=trendingTopicList


        //for only user's post :-
        List<Resource> resourceList=userPersistService.returnUserCreatedResources(user)
        params["userCreatedResrcList"]=resourceList


    }

    def profileEdit() {

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


        //for trending topics :-

        List<Topic> trendingTopicList=userPersistService.getTrendingTopics()
        params["trendingTopicList"]=trendingTopicList

    }
}
