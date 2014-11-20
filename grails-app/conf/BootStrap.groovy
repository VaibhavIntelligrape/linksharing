import com.linksharing.LinkResource
import com.linksharing.ReadingItem
import com.linksharing.Resource
import com.linksharing.Seriousness
import com.linksharing.Subscription
import com.linksharing.Topic
import com.linksharing.User
import com.linksharing.UserCommand
import com.linksharing.Visibilty
import linksharing.UserPersistService

class BootStrap {

    def init = { servletContext ->

           println "Hi,Bootstrap launched ..."
            /* UserPersistantService userPersistantService =new UserPersistantService()
            println "Bootstrap going to create and save user ..."
           List<User> userList=userPersistantService. createUser()
            println("Bootstrap :: userList :: "+userList)
            List<Topic> topicList=  userPersistantService.createTopic(userList[0],userList[1])
            println("Bootstrap :: topicList :: "+topicList)
            List<Subscription> subscriptionList=  userPersistantService.createSubscription(userList,topicList)
            println("Bootstrap :: subscriptionList :: "+subscriptionList)
           List<Resource> resourceList= userPersistantService.createLinkResource(userList,topicList)
            userPersistantService.createReadingItem(userList,resourceList)
            *//*userPersistantService.markAsRead*//*
            userPersistantService.unreadItemList()
            userPersistantService.resourceRating(5,userList.get(0),resourceList.get(0))*/


        UserPersistService userPersistService = new UserPersistService()

        User obj = new User(firstName: "Vaibhav",lastName: "Sharma",email: "vaibhav@gmail.com",username: "vaibhav", password: "12345", confirmPassword: "12345", image: "VAIBHAV.jpg",isAdmin: "false")
        userPersistService.createUser(obj)

        User obj1 = new User(firstName: "Mohit",lastName: "Sharma",email: "mohit@gmail.com",username: "mohit", password: "12345", confirmPassword:  "12345", image: "mohit.jpg",isAdmin: "false")
        userPersistService.createUser(obj1)

        User obj2 = new User(firstName: "Sujeet",lastName: "Kumar",email: "sujeet@gmail.com",username: "sujeet", password: "12345", confirmPassword:  "12345", image: "sujet.jpg",isAdmin: "false")
        userPersistService.createUser(obj2)

        UserCommand cmdObj =new UserCommand(firstName: "Ankit",lastName: "Kumar",email: "ankit@gmail.com",username: "ankit", password: "12345", confirmPassword:  "12345", image: "person1.jpg",isAdmin: "false")
        User obj3 =new User()
        obj3.properties=cmdObj.properties
        userPersistService.createUser(obj3)


        //to create topic :-
        Topic to = new Topic(name: "Grails", visibility: Visibilty.PUBLIC, user: obj)
        userPersistService.createTopic(to)
        Topic to1 = new Topic(name: "Node", visibility: Visibilty.PUBLIC, user: obj1)
        userPersistService.createTopic(to1)
        Topic to2 = new Topic(name: "Aws", visibility: Visibilty.PRIVATE, user: obj2)
        userPersistService.createTopic(to2)
        Topic to3 = new Topic(name: "BigData", visibility: Visibilty.PUBLIC, user: obj)
        userPersistService.createTopic(to3)

        //to create subscription :-
        Subscription su = new Subscription(seriousness: Seriousness.VERY_SERIOUS, user: obj, topic: to1)
        userPersistService.createSubscription(su)
        Subscription su1 = new Subscription(seriousness: Seriousness.SERIOUS, user: obj1, topic: to)
        userPersistService.createSubscription(su1)
        Subscription su2 = new Subscription(seriousness: Seriousness.SERIOUS, user: obj2, topic: to)
        userPersistService.createSubscription(su2)
        Subscription su3 = new Subscription(seriousness: Seriousness.VERY_SERIOUS, user: obj, topic: to2)
        userPersistService.createSubscription(su3)

        //to create link resource :-
        LinkResource lr = new LinkResource(url: "http://www.youtube.com/", topic: to, user: obj, description: "Added by Vaibhav in Grails")
        userPersistService.addLinkResource(obj.id.toString(), lr, to.id.toString())
        LinkResource lr1 = new LinkResource(url: "http://www.grails.com/", topic: to, user: obj1, description: "Added by Mohit in Grails")
        userPersistService.addLinkResource(obj1.id.toString(), lr1, to.id.toString())
        LinkResource lr2 = new LinkResource(url: "http://www.facebook.com/", topic: to1, user: obj, description: "Added by Vaibhav in Node")
        userPersistService.addLinkResource(obj.id.toString(), lr2, to1.id.toString())
        LinkResource lr3 = new LinkResource(url: "http://www.intelligrape.com/", topic: to2, user: obj, description: "Added by Vaibhav in Aws")
        userPersistService.addLinkResource(obj.id.toString(), lr3, to2.id.toString())

        //to rate the resources :-
        userPersistService.resourceRating(5,obj,lr)
        userPersistService.resourceRating(4,obj1,lr)
        userPersistService.resourceRating(3,obj2,lr)
        userPersistService.resourceRating(5,obj2,lr1)
        userPersistService.resourceRating(5,obj1,lr1)

    }
    def destroy = {
    }


}
