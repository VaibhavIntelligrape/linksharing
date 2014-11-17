<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.Topic; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <resource:rating />
    <title></title>
</head>

<body>
<%Resource ls=params["resourceObject"]
%>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 340px;">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div style="  padding: 5px 10px;">Full Post</div>
        </th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" style="text-align: left;">
            <div>
                <div style="float: left;">
                    <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${ls.user.image}" width="55"  />
                </div>
                <div>
                    <p>${ls.user.firstName} &nbsp; ${ls.lastUpdated} <span style="padding-left: 50px">${ls.topic.name}</span><br />
                    &nbsp;${ls.user.email}</p>
                </br>Rating
                </br></br>
                    ${ls.description} </p>

                </div>
                <div>
                    <p><img alt="" src="/linksharing/assets/fb.jpeg" width="15"/>&nbsp; <img alt="" src="/linksharing/assets/twitter_ico.png" width="15"/>&nbsp; <img alt="" src="/linksharing/assets/gPlus.png" width="15"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>Download</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewFullSite</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>MarkAsRead</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewPost</u></span></span></p>
                </div>
            </div>
        </th>
    </tr>
    </tbody>
</table>

%{--<g:userInbox/>--}%
</body>
</html>