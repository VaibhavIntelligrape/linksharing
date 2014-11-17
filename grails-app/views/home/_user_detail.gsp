<%@ page import="com.linksharing.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="login">
</head>
<body>
<p>&nbsp;</p>
<%User user=params["userObject"]
  String userSubscriptionSize=params["userSubscriptionSize"]
String userTopicListSize=params["userTopicListSize"]
%>
<div style="border-style: solid;margin-bottom: 2px;float:left;clear:right;width:450px;length:50px;border-radius: 25px"><g:form method="get" url="[controller:'Topic',action:'createUserTopic']">
    <div>
    <div style="float: left">
    &nbsp;&nbsp; &nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${user.image}" width="55" height="65" />
    </div>
    <div style="width: 300px;margin-left: 100px">
        <span> ${user.firstName} ${user.lastName}</span>
    </div>
    </div>
    <div>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @${user.username}</p>

    <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subscription&nbsp;&nbsp;&nbsp;&nbsp; Topics</p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${userSubscriptionSize} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; ${userTopicListSize}&nbsp;</p>

    <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
    </div>
</g:form></div>

<p>&nbsp;</p>
</body>
</html>
