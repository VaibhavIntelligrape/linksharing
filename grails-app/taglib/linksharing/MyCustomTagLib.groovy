package linksharing

import com.linksharing.Resource
import com.linksharing.User
import groovy.time.TimeCategory
import groovy.time.TimeDuration

class MyCustomTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def myTag={ it
        out<<"${it}"
        out << "${it.get("name")}"
    }

    def recentShares={

        List<Resource> ls=(List<Resource>)request.getAttribute("resourceList")

        /*println("ls :: "+ls)*/

        out << "TopicName : " +(ls.get(0).topic.name)
        out <<  "ResourceDescription : " +(ls.get(0).description)
        out <<  "TopicName : " +(ls.get(1).topic.name)
        out <<  "ResourceDescription : " +(ls.get(1).description)
    }

    def userInbox={


        List<Resource> ls=(List<Resource>)request.getAttribute("inboxList")
        /*User user*/
        println("Came in userINbox TagLib...")
        ls.each {
            println(":::: "+it)
            out << "Topic Name  :- "+it.topic
            out << "Resource Description : -"+it.description
            out << "Resource Date :- "+it.lastUpdated
        }



    }
    def diffTime={ myTime ->
          println("Time in taglib :- "+myTime.get("val"))
        Date date=new Date()
        TimeDuration tc=TimeCategory.minus(date,myTime.get("val"))
        out << "${tc.hours +"hrs,"+tc.minutes} min"
    }



}
