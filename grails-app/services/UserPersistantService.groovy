import com.linksharing.*

/**
 * Created by intelligrape on 7/11/14.
 */
class UserPersistantService {


        public createUser(){
            println "UserPersistantService :: createUser() started..."
            List<User> list=[];
            User obj1=new User(name:"Vaibhav",age:24,city:"New Delhi",email:"vaibhav@gmail.com",password:"12345",confirmPassword: "12345",image:"VAIBHAV.jpg")
            User obj2=new User(name:"Naman",age:26,city:"Delhi",email:"ankit@gmail.com",password:"123456",confirmPassword: "123456")
                list.add(obj1)
                list.add(obj2)
                obj1.save()
                obj2.save()
            println("UserPersistantService :: User List :: "+list)
            return  list
        }

    public createTopic(User u1,User u2){
        println "UserPersistantService :: createTopic() started..."
            List<Topic> topicList=[];
            Topic to1=new Topic(name:"Grails",visibility: Visibilty.PUBLIC,user:u1)
            to1.save()
            User user=User.get(1)
            println user.properties
            println("Will not show topics of user :: "+user.topics)
            user.addToTopics(to1)
        println("Will show topics of user :: "+user.topics)

        Topic to2=new Topic(name:"Node.js",visibility: Visibilty.PUBLIC,user:u2)
            to2.save()

        User user1=User.get(2)
        println("Will not show topics of user :: "+user1.topics)
        user1.addToTopics(to2)
        println("Will show topics of user :: "+user1.topics)

        topicList.add(to1)
            topicList.add(to2)
        /*User user = User.get(1)
        println ("user name:  "+user.name)
        println ("user topics:  "+user.topics)*/
            println("UserPersistantService :: Topic List :: "+topicList)
        return topicList
    }
    public createSubscription(List<User> userList,List<Topic> topicList){
        println "UserPersistantService :: createSubscription() started..."
        List<Subscription> subscriptionList=[];
            Subscription su1=new Subscription(seriousness: Seriousness.VERY_SERIOUS,user: userList[0],topic: topicList[0])
            su1.save()
            Subscription su2=new Subscription(seriousness: Seriousness.SERIOUS,user: userList[1],topic: topicList[1])
            su2.save()
        subscriptionList.add(su1)
        subscriptionList.add(su2)
        println("UserPersistantService :: Subscription Listt :: "+subscriptionList)
        return subscriptionList;
}
  public createLinkResource(List<User> userList,List<Topic> topicList){
        List<Resource> resourceList=[]
        for(i in 1..11){
            LinkResource lr=new LinkResource(url :"http://www.youtube${i}.com/",topic: topicList[0],user: userList[0],description: "Description${i}")
            println("lr :: "+lr.properties)
            resourceList.add(lr)
            lr.save()
        }
            for(i in 1..10){
            LinkResource lr1=new LinkResource(url :"http://www.google${i}.com/",topic: topicList[1],user: userList[1],description: "Description${i}")
            resourceList.add(lr1)
            lr1.save()
            //println lr.errors.allErrors
        }

       /* LinkResource lr2=new LinkResource(url :"http://www.google.com/",topic: to2,user: obj2,description: "This is the complete world")
        lr2.save()
        LinkResource lr21=new LinkResource(url :"http://www.google1.com/",topic: to2,user: obj2,description: "This is the 21complete world")
        lr21.save()*/
        return resourceList
  }
    public createReadingItem(List<User> userList,List<Resource> resourceList){
        List<ReadingItem> readingItemList=[]
        for(i in 0..9){
        ReadingItem ri=new ReadingItem(isRead:false,user: userList[0],resource: resourceList[i])
        ri.save()
        readingItemList.add(ri)
        }
        for(i in 10..19){
            ReadingItem ri=new ReadingItem(isRead:false,user: userList[1],resource: resourceList[i])
            ri.save()
            readingItemList.add(ri)
        }
       /* ReadingItem ri11=new ReadingItem(isRead:false,user: obj1,resource: lr11)
        ri11.save()
        ReadingItem ri21=new ReadingItem(isRead:false,user: obj1,resource: lr21)
        ri21.save()*/
        return readingItemList
    }
/*     public markAsRead(){
//        ReadingItem rdI1=ReadingItem.findById(1)//UPDATE table_name SET column1=value1,column2=value2,...WHERE some_column=some_value
  //          println rdI1.properties
}
*/
        public unreadItemList(){
        List<ReadingItem> res=ReadingItem.findAllWhere(isRead: false)

        res.each {

            println("${it}"+it.properties)
        }
        }

        public resourceRating(int rate,User user,Resource resource){

       ResourceRating resourceRating=new ResourceRating(score: rate,user:  user,resource:  resource)
            resourceRating.save()

    }




        }
