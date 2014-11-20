package com.linksharing

import linksharing.UserPersistService
import org.springframework.mail.MailSender
import org.springframework.web.multipart.MultipartFile

/**
 * Created by intelligrape on 8/11/14.
 */
class LoginController {

    /*def beforeInterceptor = [action: this.&auth, only: 'index']
// defined with private scope, so it's not considered an action
    private auth() {

        println( " USer ::- "+session["user"])
        if (session["user"]) {
            redirect(controller:'home',action:'dashBoard')
            return false
        }
    }*/

    def index() {
        println( " LoginController ... index()....")


        UserPersistService userPersistService =new UserPersistService()
        List<Resource> resourceList=userPersistService.recentShares();
        println("resourceList :: "+resourceList)
        request.setAttribute("resourceList",resourceList)

     //   println("date :-"+new Date().dateTimeString)

       /* List<ResourceRating> resourceRatingList=userPersistService.returnResourNceRating()
        println("ResourceRatingList :- "+resourceRatingList)*/
     //   List<ReadingItem> ls=ReadingItem.findAll("from ReadingItem as ri where ri.user.id=${userId} and ri.isRead=false order by lastUpdated desc ")
        //List<Resource> resources=Resource.findAll(" av  (score) from Resource as ri  order by lastUpdated desc ")

        //for top post :-

       List<Resource> tempResourceRatingList= userPersistService.topPost()
        println("resourceRatingList :::: " +tempResourceRatingList.get(0).user.properties)
        params["resourceRatingList"]=tempResourceRatingList
       /* Resource resource=resourceRatingList.get(0)
        println("User of Resouce :: - " +resource.user.properties)*/




      }


    def loginHandler(){

        println("UserController :: loginHandler() started...")
        String email= params.get("email")
        String password=params.get("password")

        User user =User.findByEmail(email)
        println("USER :: "+user)

        if(user?.password==password){
            session["user"] = user.firstName
            session["user_id"] = user.id
            println("sesion name :::: "+session["user"])
            println("COrrect User ::  going to redirect .... ")

            params["userObject"]=user
            redirect(controller:'home',action:'dashBoard')
        }
        else{
            /*request.setAttribute("msg","Please correct input.")*///how to prompt error on login page on incorrect input.
            redirect(controller:'login',action:'index')
            println "not correct user"}

    }


    def register() {
        UserPersistService userPersistService =new UserPersistService()
        println( " LoginController ... registration()....")
        println(params)

        //For image :-
        MultipartFile uploadedFile = params['image']
        if(!uploadedFile.empty){
            println "Class: ${uploadedFile.class}"
            println "Name: ${uploadedFile.name}"
            println "OriginalFileName: ${uploadedFile.originalFilename}"
            println "Size: ${uploadedFile.size}"
            println "ContentType: ${uploadedFile.contentType}"

           /* def webRootDir = servletContext.getRealPath("/")
            def userDir = new File(webRootDir, "/linksharing/assets/images")
            userDir.mkdirs()
            uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))*/

           /* File file = new File("${uploadedFile.originalFilename}");
            File dir = new File("/home/Desktop");
            boolean fileMoved = file.renameTo(new File(dir, file.getName()));
            println("File status :: "+fileMoved)*/

            def status=userPersistService.uploadFile(uploadedFile,uploadedFile.originalFilename,"/home")
                println( "File Stat :- "+status)
        }


        User user=new User()
        String fileName=uploadedFile.originalFilename
        user.image=fileName
        user.email=params["email"]
        user.password=params["password"]
        user.confirmPassword=params["confirmpassword"]
        user.username=params["username"]
        user.firstName=params["firstname"]
        user.lastName=params["lastname"]
        user.isAdmin="false"
        println("User :: "+user.properties)
        boolean status=userPersistService.createUser(user)
        println("user creation status :- "+status)
        if(status==true){
            session["user"] = user.username
            session["user_id"] = user.id
            println("sesion name :::: "+session["user"])
            println("COrrect User ::  going to redirect .... ")
            redirect(url: '/')
        }
        else {
            println("COrrect User ::  going to redirect .... ")
            redirect(controller:'login',action:'index')
        }
    }

    def logout() {
       session.invalidate()
        redirect(url: "/")
    }
}
