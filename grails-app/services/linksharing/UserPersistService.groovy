package linksharing

import com.linksharing.User

/**
 * Created by intelligrape on 8/11/14.
 */
class UserPersistService {

    public createUser(User user){
        println "UserPersist Service :: createUser() started..."
         user.save()
        if (!user.save()) {
            user.errors.each {
                println it
            }
        return false
        }
        println("In UserPer...... :: "+user.name)
        /*println user.errors.allErrors*/
        return true
    }
}
