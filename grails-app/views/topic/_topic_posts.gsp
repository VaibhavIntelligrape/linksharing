<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.Topic; com.linksharing.User; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<body>
<%User user=params["userObject"]
Topic topic=params["topicObject"]
    %>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width: 450px">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div>
            <div style="padding: 5px 10px; text-align: left;float: left;">Posts :${topic.name} </div>

<div style="float: right;padding-right: 50px">
                <form class="" action="">
                        <input type="text" name="" style="height: 10px;width: 100px">
                    <button style="border: medium none; background: none repeat scroll 0% 0% transparent;" type="submit"><img src="/linksharing/home/searchbutton3.gif" alt="Save icon" style=""></button>
                </form>
</div>
            </div>
        </th>
    </tr>
    </thead>
    <tbody>
<%
List<Resource> resourceList=params["resourceList"]
    resourceList.each {
    %>
    <tr>
        <th scope="row" style="text-align: left;">
            <div>
            <div style="float: left;">
            <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${it.user.image}" width="55"  />
            </div>
            <div>

            <p>${it.description}</p>

             </div>
                <div>
                    <p><img alt="" src="/linksharing/assets/fb.jpeg" width="15"/>&nbsp; <img alt="" src="/linksharing/assets/twitter_ico.png" width="15"/>&nbsp; <img alt="" src="/linksharing/assets/gPlus.png" width="15"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>Download</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewFullSite</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>MarkAsRead</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewPost</u></span></span></p>
                </div>
        </div>
        </th>
    </tr>

    <%}%>
    </tbody>
</table>
</br>
</body>
</html>