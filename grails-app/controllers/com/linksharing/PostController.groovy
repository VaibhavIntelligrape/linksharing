package com.linksharing

import linksharing.UserPersistService

class PostController {

    def index() {

        UserPersistService userPersistService=new UserPersistService()
        String rid=params["rid"]
        Resource resource=userPersistService.returnFullResource(rid)
        params["resourceObject"]=resource

        //for trending topics :-
        List<Topic> trendingTopicList=userPersistService.getTrendingTopics()
        params["trendingTopicList"]=trendingTopicList


    }

}
