import com.linksharing.ReadingItem
import com.linksharing.Resource
import com.linksharing.Subscription
import com.linksharing.Topic
import com.linksharing.User

class BootStrap {

    def init = { servletContext ->

        println "Hi,Bootstrap launched ..."
        UserPersistantService userPersistantService =new UserPersistantService()
        println "Bootstrap going to create and save user ..."
       List<User> userList=userPersistantService. createUser()
        println("Bootstrap :: userList :: "+userList)
        List<Topic> topicList=  userPersistantService.createTopic(userList[0],userList[1])
        println("Bootstrap :: topicList :: "+topicList)
        List<Subscription> subscriptionList=  userPersistantService.createSubscription(userList,topicList)
        println("Bootstrap :: subscriptionList :: "+subscriptionList)
       List<Resource> resourceList= userPersistantService.createLinkResource(userList,topicList)
        userPersistantService.createReadingItem(userList,resourceList)
        /*userPersistantService.markAsRead*/
        userPersistantService.unreadItemList()
        userPersistantService.resourceRating(5,userList.get(0),resourceList.get(0))

    }
    def destroy = {
    }


}
