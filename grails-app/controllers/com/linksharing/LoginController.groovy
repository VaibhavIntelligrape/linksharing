package com.linksharing

import linksharing.UserPersistService
import org.springframework.web.multipart.MultipartFile

/**
 * Created by intelligrape on 8/11/14.
 */
class LoginController {

    def beforeInterceptor = [action: this.&auth, only: 'index']
// defined with private scope, so it's not considered an action
    private auth() {

        println( " USer ::- "+session["user"])
        if (session["user"]) {
            redirect(controller:'home',action:'dashBoard')
            return false
        }
    }

    def index() {
        println( " LoginController ... index()....")
        println(request.getAttribute("msg").toString())

        UserPersistService userPersistService =new UserPersistService()
        List<Resource> resourceList=userPersistService.recentShares();
        println("resourceList :: "+resourceList)
        request.setAttribute("resourceList",resourceList)

        println("date :-"+new Date().dateTimeString)

       /* List<ResourceRating> resourceRatingList=userPersistService.returnResourceRating()
        println("ResourceRatingList :- "+resourceRatingList)*/
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
        user.age=params.int("age")
        user.email=params["email"]
        user.password=params["password"]
        user.name=params["name"]
        user.city=params["city"]
        println("User :: "+user.properties)
        boolean status=userPersistService.createUser(user)
        if(status==true){
            session["user"] = user.name
            session["user_id"] = user.id
            println("sesion name :::: "+session["user"])
            println("COrrect User ::  going to redirect .... ")
            redirect(controller:'login',action:'index')
        }
        else {
            println("COrrect User ::  going to redirect .... ")
            redirect(controller:'login',action:'index')
        }
    }

}
