<%@ page import="com.linksharing.User" %>
<%User user=params["userObject"]%>

<div style="background: url('/linksharing/home/links_banner1.jpg'); border: solid thick ;align-self: auto;height: 150px;">

    <div style="float: right; margin-top: 0px;">
        <%
//            session["user_id"]!=null
if(user!=null)
{

        %>


        <div style="float: right;" >
            <input src="/linksharing/home/chat.jpeg" name="chat" id="chat" type="image" style="height: 25px ;width: 20px;padding: 0px"><input id="msg" src="/linksharing/home/msg.jpeg" name="submit" type="image"style="height: 25px ;width: 20px;padding: 0px">
            <input src="/linksharing/home/atchmnt.jpeg" name="submit" id="atchmnt" type="image"style="height: 25px ;width: 20px;padding: 0px"><input src="/linksharing/home/page.png"  id="page" name="submit" type="image"style="height: 25px ;width: 20px;padding: 0px">
           <div style="position: relative;float: right">
            <input src="/linksharing/home/${user.image}" name="submit" type="image"style="height: 25px ;width: 20px;padding: 0px"> ${user.userName}
            <input src="/linksharing/home/drop.jpeg" id="dropSubmit" name="dropSubmit" type="image"style="height: 20px ;width: 20px;padding: 0px">

               <div class="dropOption" hidden="hidden" style="position: absolute;width: 100%">
<g:link controller="profile" action="profileEdit" name="userProfile"><span style="border:solid;width:50px;float: right;clear: left">Profile</span></g:link>
                <span style="border: solid;float: right;;width:50px;clear: right">Users</span>
                <span style="border: solid;float: right;width:50px;clear: right">Topic</span>
                <span style="border: solid;float: right;width:50px;clear: right">Posts</span>
<g:link controller="login" action="logout" name="logoutAc"><span style="border: solid;width:50px;float: right;clear: right">Logout</span></g:link>
            </div>
           </div>
        </div>
               <%}%>
        <div style="float: right">
            <form id="search-form" name="search" action="/products" method="get">
                <input type="text" placeholder="Search" name="q" class="placeholder" style=" height: 16px;">
                <input src="/linksharing/home/searchbutton3.gif" name="submit" type="image"style="float:right;  height: 25px ;width: 20px;padding: 0px">
            </form>
        </div>

    </div>
    <div style="float: right;clear: right;width: auto;">
        </br>
        <b style="font-size: 50px;font-family:'Times New Roman';"><marquee>LinkSharing App</marquee></b>
    </div>
</div>
    <script type="text/javascript">


            $(function() {

                $('#dropSubmit').click(function() {
                    $('.dropOption').toggle(1000);
                    return false;
                });


                $('#chat').click(function() {
                    $('#lockDiv').fadeIn();
                    $('#createTopic').fadeIn("slow");
                    return false;
                });
                $('#msg').click(function() {
                    $('#lockDiv').fadeIn();
                    $('#senInvite').fadeIn("slow");
                    return false;
                });
                $('#atchmnt').click(function() {
                    $('#lockDiv').fadeIn();
                    $('#createLinkRes').fadeIn("slow");
                    return false;
                });
                $('#page').click(function() {
                    $('#lockDiv').fadeIn();
                    $('#createDocumentRes').fadeIn("slow");
                    return false;
                });
                $('.container').click(function() {
                    $("#lockDiv").fadeOut();
                    $('#createTopic,#senInvite,#createDocumentRes,#createLinkRes').fadeOut("slow");
//                    /return false;
                });
                $('.cancel').click(function() {
                    $("#lockDiv").fadeOut();
                    $('#createTopic,#senInvite,#createDocumentRes,#createLinkRes').fadeOut("slow");
                    return false;
                });


            });




          /*  $(document).ready(function(){
                $("#chat").click(function(){
                    $("#createTopic").css("display", "block");
                    });
            });*/


	    </script>
