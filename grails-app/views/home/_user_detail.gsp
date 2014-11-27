<%@ page import="com.linksharing.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    %{--<meta name="layout" content="login">--}%
</head>
<body>
<p>&nbsp;</p>
<%User user=params["userObject"]
  String userSubscriptionSize=params["userSubscriptionSize"]
String userTopicListSize=params["userTopicListSize"]
%>
<div style="background: url('/linksharing/home/ban2.jpeg');border-style: solid;margin-bottom: 2px;float:left;clear:right;width:450px;length:50px;border-radius: 25px"><g:form method="get" url="[controller:'Topic',action:'createUserTopic']">
    <div style="margin:10px 10px 10px 10px ">
    <div style="float: left">
    &nbsp;&nbsp; &nbsp;&nbsp;<g:link controller="profile" action="profilePublicaly" params='[uid:"${user.id}"]'><img style="border: 4px groove black" alt="BlankImage" src="/linksharing/home/${user.image}" width="80" height="100" /></g:link>
    </div>
    <div style="width: 300px;margin-left: 150px">
        <span> ${user.firstName} ${user.lastName}</span>
    </div>

    <div style="margin-left: 150px">
    <p>@${user.userName}</p>
    </div>
    <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>

    <p>&nbsp; &nbsp; &nbsp;&nbsp;Subscription&nbsp;&nbsp;&nbsp;&nbsp; Topics</p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${user.subscriptions.size()} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; ${user.topics.size()}&nbsp;</p>

    <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
    </div>
</g:form></div>

<p>&nbsp;</p>
</body>
</html>
