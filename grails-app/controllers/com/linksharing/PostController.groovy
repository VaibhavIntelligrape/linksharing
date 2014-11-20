package com.linksharing

import linksharing.UserPersistService

class PostController {

    def index() {

        UserPersistService userPersistService=new UserPersistService()



        //For user detail page :-
        String uId=session["user_id"]
        User user=userPersistService.returnUser(uId)
        params["userObject"]=user



        String rid=params["rid"]
        Resource resource=userPersistService.returnFullResource(rid)
        params["resourceObject"]=resource

        //for trending topics :-
        List<Topic> trendingTopicList=userPersistService.getTrendingTopics()
        params["trendingTopicList"]=trendingTopicList


    }

}
