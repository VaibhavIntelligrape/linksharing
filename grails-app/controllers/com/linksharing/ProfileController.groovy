package com.linksharing

import linksharing.UserPersistService
import org.springframework.web.multipart.MultipartFile

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

        if(params["msg"]!=null){
            params["msg"]=params["msg"]
        }

    }

    def profileUpdate() {
        UserPersistService userPersistService =new UserPersistService()
        println( " ProfileController ... profileUpdate()....")
        println("profileUpdate :: "+params)

        //For image :-
        MultipartFile uploadedFile = params['image']
        if(!uploadedFile.empty){
            def status=userPersistService.uploadFile(uploadedFile,uploadedFile.originalFilename,"/home")
            println( "File Stat :- "+status)
        }
        String fileName=uploadedFile.originalFilename
        println("FILE NAME :- "+fileName)
        String uId=session["user_id"]
        User user=userPersistService.returnUser(uId)
        println("User properties before :: "+user.properties)

        if(params["uname"]!=null){user.userName=params["uname"]}
        if(params["fname"]!=null){user.firstName=params["fname"]}
        if(params["lname"]!=null){user.lastName=params["lname"]}
        if(fileName!=null && fileName!=""){user.image=fileName}
        user.confirmPassword=user.password

        /*user.image=fileName
        user.userName=params["uname"]
        user.firstName=params["fname"]
        user.lastName=params["lname"]*/
        println("User properties after ::"+user.properties)
        boolean status=userPersistService.updateUserProfile(user)
        println("user creation status :- "+status)
        if(status==true){
            session["user"] = user.userName
            session["user_id"] = user.id
            println("sesion name :::: "+session["user"])
            println("COrrect User ::  going to redirect .... ")
            redirect(controller:'profile',action:'profileEdit',params: [msg: 'Dear User ,You are successfully updated.'])
        }
        else {
            println("IncOrrect User ::  going to redirect .... ")
            redirect(controller:'profile',action:'profileEdit',params: [msg: 'Dear User ,You are not updated successfully.'])
        }
    }

    def profilePasswordUpdate() {
        UserPersistService userPersistService =new UserPersistService()
        println( " ProfileController ... profilePasswordUpdate()....")
        println(params)

        String uId=session["user_id"]
        User user=userPersistService.returnUser(uId)
        println("User properties before :: "+user.properties)

        String pass=params["password"]
        String cpass=params["cpassword"]
        println("PAss :- "+pass+" :: cpass :- "+cpass)
        if(pass.equals(cpass)){
        println("Password updated ... ")
        user.password=pass
        user.confirmPassword=cpass
            println("User properties after :: "+user.properties)
            userPersistService.updateUserPassword(user)
            redirect(controller:'profile',action:'profileEdit',params: [msg: 'Dear User ,You are successfully updated.'])
        }
        else {
            println("Password not updated ... ")
            redirect(controller:'profile',action:'profileEdit',params: [msg: 'Dear User ,You are not updated successfully.'])
        }
}
}
