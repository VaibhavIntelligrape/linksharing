package linksharing
import com.linksharing.DocumentResource
import com.linksharing.LinkResource
import com.linksharing.ReadingItem
import com.linksharing.Resource
import com.linksharing.ResourceRating
import com.linksharing.Seriousness
import com.linksharing.Subscription
import com.linksharing.Topic
import com.linksharing.User
import com.linksharing.Visibilty
import grails.plugin.mail.MailService
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile
/**
 * Created by intelligrape on 8/11/14.
 */
class UserPersistService {
    def mailService
    public createUser(User user){
        println "UserPersist Service :: createUser() started..."
        println("UserPersist Service :: User Details :- "+user)
        if (user.save()) {
            user.save()
            return true
        }
/*println user.errors.allErrors*/
        else {
            user.errors.each {
                println it
            }
            return false}

        println("IN Create User ...... :: "+user.firstName)
    }
    public recentShares(){
        println("Recent Shars :::")
/* Book.findAll("from Book as b where b.author=? order by b.releaseDate",
['Dan Brown'], [max: 10, offset: 5])*/
        List<Resource> ls=Resource.findAll("from Resource order by id desc ",[max: 3])
        return ls
        println("Resources :: "+ls)
    }
    public userInbox(userId){
        println("User INbox () started...:::"+userId)
/* Book.findAll("from Book as b where b.author=? order by b.releaseDate",
['Dan Brown'], [max: 10, offset: 5])*/
        List<ReadingItem> ls=ReadingItem.findAll("from ReadingItem as ri where ri.user.id=${userId} and ri.isRead=false order by lastUpdated desc ")
// println("Resources :: "+ls[0].resourceId)
/* Resource resource=Resource.get(ls[0].resourceId)
println(resource)*/
        List<Resource> rs=[]
        int j=0,i=0
        println("size :: "+ls.size())
        while(ls.size()-1>=i){
//println("xyz"+ls[j]?.resourceId)
            Resource resource=Resource.findById(ls[i].resourceId)
            rs.add(resource)
            i=i+1
        }
        println("Unread Resources List:: - "+rs)
        return rs
    }
    public returnUser(String id){
        User user =User.findById(id)
        return user
    }
    public returnUserSubscriptions(String id){
/* //Through criteria :-
Integer userCount = Subscription.createCriteria().count{
eq("user", user)
*//*'user' {
eq('id', user.id)
}*//*
}
println( "Count ::- "+userCount)*/
        List<Subscription> subscriptionList=Subscription.findAllById(id)
        return subscriptionList
    }

    public returnUserSubscriptions1(User user){
/* //Through criteria :-
Integer userCount = Subscription.createCriteria().count{
eq("user", user)
*//*'user' {
eq('id', user.id)
}*//*
}
println( "Count ::- "+userCount)*/
        println("returnUserSubscriptions1 started ...." )
    List<Subscription> subscriptionList=Subscription.findAllByUser(user)
        subscriptionList.each {println(it.properties)}
    }

    public returnUserTopic(String id){
        List<Topic> topicList=Topic.findAllById(id)
        return topicList
    }
    public addLinkResource(String uId,LinkResource linkResource,String tId){
// LinkResource linkResource=new LinkResource(url :"http://www.youtube${i}.com/",topic: topicList[0],user: userList[0],description: "Description${i}")
        UserPersistService userPersistService=new UserPersistService()
        println("addLinkResource :: started.....")
        println("Uid :- "+uId+" :: link :: "+linkResource+" :: TID :: "+tId)
        Topic topic=Topic.findById(tId)
        println("Topic Details :- "+topic.properties)
        User user=userPersistService.returnUser(uId)
        println("User Details :- "+user.properties)
        linkResource.user=user
        linkResource.topic=topic
        println("Link RESOURCE :: - "+linkResource.properties )
        linkResource.save(flush: true, failOnError: true)
        ReadingItem ri=new ReadingItem(isRead:true,user: user,resource: linkResource)
        ri.save()
        List<Subscription> subscriptionList=Subscription.findAllByTopic(topic)
        subscriptionList.each {
            if(user!=it.user){
            ReadingItem riObj=new ReadingItem(isRead:false,user: it.user,resource: linkResource)
            riObj.save()
            }
        }
    }
    public addDocumentResource(String uId,DocumentResource documentResource,String tId){
// LinkResource linkResource=new LinkResource(url :"http://www.youtube${i}.com/",topic: topicList[0],user: userList[0],description: "Description${i}")
        UserPersistService userPersistService=new UserPersistService()
        println("addDocumentResource :: started.....")
        println("Uid :- "+uId+" :: link :: "+documentResource+" :: TID :: "+tId)
        Topic topic=Topic.findById(tId)
        println("Topic Details :- "+topic.properties)
        User user=userPersistService.returnUser(uId)
        println("User Details :- "+user.properties)
        documentResource.user=user
        documentResource.topic=topic
        println("Link RESOURCE :: - "+documentResource.properties )
        documentResource.save(flush: true)
    }
    public createResourceRating(int rate,User user,Resource resource){
        ResourceRating resourceRating=new ResourceRating(score: rate,user: user,resource: resource)
        resourceRating.save()
    }
    public returnResourceRating(){
        List<Resource> resourceList=Resource.findAll()
        resourceList.each {
            int resourceId=it.id
            List<ResourceRating> ratingList=ResourceRating.findAllById(resourceId)
        }
// List<ResourceRating> resourceRatingList =ResourceRating.findAllByScore([order :"desc"])
//println("Lisy :: "+resourceRatingList)
    }
    public saveTopic(Topic topic){
        topic.save()\
}
    public getTrendingTopics(){
        List<Topic> listOfTopics=Topic.findAllByVisibility(Visibilty.PUBLIC)
        println("listOfTopics :: "+listOfTopics)
        def resList=[]
        listOfTopics.each {
            println "Topic Id= ${it.id} Topic Resouces Size = ${it.resources.size()}"
            resList.add(it.resources)
        }
        println "ResList :: ${resList}"
        resList.sort{-it.size()}
        println "SOrted :: ${resList} "
        List<Topic> trendingTopicList=[]
        for(i in 0..resList.size()-1){
            Set<Resource> res=resList.get(i)
            println "${i} = ${ res[0]?.topic}"
            trendingTopicList.add(res[0]?.topic)
        }
        println("Trendoing TOpics :: "+trendingTopicList)

        println("Trendoing TOpics :::::"+trendingTopicList.get(0).user.properties)
        return trendingTopicList
    }
    def String uploadFile(MultipartFile file,
                          String name, String destinationDirectory) {
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(destinationDirectory)
// Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }
// Store file
        if (!file.isEmpty()) {
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            return "${storagePath}/${name}"
        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }

    def createTopic(Topic topic) {
        topic.save()
        println("create topic started ....")
        User user=topic.user
        user.addToTopics(topic)
        println("Topic from user object :- "+user.topics)
        Subscription su = new Subscription(seriousness: Seriousness.SERIOUS, user: user, topic: topic)
        UserPersistService userPersistService=new UserPersistService()
        userPersistService.createSubscription(su)

           }
    def createSubscription(Subscription subscription) {
        subscription.save()
    }


    def returnFullResource(String rid) {
        Resource resource=Resource.findById(rid)
        return resource

    }
    public resourceRating(int rate,User user,Resource resource){

        ResourceRating resourceRating=new ResourceRating(score: rate,user:  user,resource:  resource)
        resourceRating.save()

    }

    public searchService(String searchString){

        //List<Resource> resourceList=Resource.findAllByDescription
        List<Resource> resourceList = Resource.createCriteria().list {
            or {
                ilike("description", "%${searchString}%")
                ilike("url", "%${searchString}%")
                'topic' {
                    ilike("name", "%${searchString}%")
                }
            }
        }
        /*resourceList.each {
            println("Resouce Searched :- "+it.properties)
        }*/
        return resourceList
    }


    def returnTopSubscriptions(String uId){
        List<Subscription> subscriptionList=Subscription.createCriteria().list{

            projections{
                    groupProperty('topic')
            }
            "user"{
                eq('id',uId.toLong())
            }
            "topic"{
                "resources"{
                order('lastUpdated','desc')
            }
            }
        }
        println("returnTopSubscriptions :: " + subscriptionList)
    return subscriptionList
    }

    def returnUserInbox(String uId){
        List<ReadingItem> readingItemList=ReadingItem.createCriteria().list{

            projections{
                groupProperty('resource')
            }
            eq('isRead',false)


            "user"{
                eq('id',uId.toLong())
            }
                "resource"{
                    order('lastUpdated','desc')

        }
        }
        println("returnUserInbox :: " + readingItemList)
        return readingItemList
    }



    def returnUserSeriousSubsRes(String uId){
        List<ReadingItem> readingSubsResList=ReadingItem.createCriteria().list{

            projections{
                groupProperty('resource')
            }
            eq('isRead',false)

            "user"{
                eq('id',uId.toLong())
            }
            "resource"{
                "topic"{
                    "subscriptions"{
                        eq('seriousness',Seriousness.SERIOUS)
                }
            }
          }
            maxResults(5)
        }
        println("returnUserSeriousSubsRes :: - " + readingItemList)
        return readingSubsResList
    }

    def topPost(){
        List<ResourceRating> resourceRatingList=ResourceRating.createCriteria().list{
            projections{
                groupProperty('resource')
                avg('score','avge')
            }
            order('avge','desc')
        }*.getAt(0)
        //if(resourceRatingList.size()>0) res
        println("resourceRatingList :: " + resourceRatingList)
        return resourceRatingList
    }

    def sendMailService(){

        try
        {
            println "coming for sendmail<><><><><><><><>topics name "
          //  println("mailSe :- "+mailService.class)
           // println("mailSe... :- "+mailService.properties)
            mailService.sendMail {
                to "namang@intelligrape.com"
                from "vaibhavs@intelligrape.com"
                subject "Mail Testing Linksharing"
                body "Hi this is test mail from vaibhav's link sharing.."
            }
        }
        catch (Exception ex)
        {
            ex.printStackTrace()
        }


    }
    def returnUserCreatedResources(User user){

    List<Resource> resourceList=Resource.findAllByUser(user)
        println("returnUserCreatedResources :: - "+resourceList)
        return resourceList
    }


}