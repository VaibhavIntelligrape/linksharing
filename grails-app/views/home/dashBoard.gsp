<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 8/11/14
  Time: 10:45 PM
--%>

<%@ page import="com.linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<%User user=params["userObject"]%>
<div style="border: solid thick ;align-self: auto;height: 50px;">
    <div style="float: left">
        <header><b>LinkSharing App</b></header>
    </div>
    <div style="float: right; margin-top: 0px;">
        <div style="float: right">
            <input src="/linksharing/home/chat.jpeg" name="submit" type="image" style="height: 15px ;width: 15px"><input src="/linksharing/home/msg.jpeg" name="submit" type="image"style="height: 15px ;width: 15px">
            <input src="/linksharing/home/atchmnt.jpeg" name="submit" type="image"style="height: 15px ;width: 15px"><input src="/linksharing/home/page.png" name="submit" type="image"style="height: 15px ;width: 15px">
            <input src="/linksharing/home/${user.image}" name="submit" type="image"style="height: 15px ;width: 15px">${user.username}<input src="/linksharing/home/drop.jpeg" name="submit" type="image"style="height: 15px ;width: 15px">
        <p style="margin-right: 10px"><g:render template="/logout"></g:render></p>
        </div>
        <div style="float: right">
        <form id="search-form" name="search" action="/products" method="get">
            <input id="search-input" name="search" type="text">
            <input src="/linksharing/home/searchbutton3.gif" name="submit" type="image"style="height: 15px ;width: 15px">
        </form>
        </div>

    </div>
</div>
<div>
%{--<b>Welcome, Dear ${request.getAttribute("userName")?request.getAttribute("userName").toString(): "no user"} </b>--}%
<br>
<div>
<div style="width: 40%;float: left">
<div>
<g:render template="user_detail" />
</div>
<div>
<g:render template="subscription"  />
</div>

<div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
<g:render template="trending_topics"  />
</div>

<div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
<g:render template="createLinkRes"  />
</div>
<div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
<g:render template="createTopic"  />
</div>
</div>
    <div style="float: right;margin-bottom: 2px" >
        <div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;">
            <g:render template="user_inbox"  />
        </div>
        <div style="border:solid thick ;margin-bottom: 2px;border-radius: 25px;height:250px;width:450px;overflow:scroll;">
        <g:render template="createLinkRes"  />
        </div>
        <div style="border:solid thick ;border-radius: 25px;margin-bottom: 2px;height:250px;width:450px;overflow:scroll;">
        <g:render template="createDocumentRes"  />
         </div>
<br>
    </div>
</div>
</div>
%{--<g:myTag name="vaibhav from taglib"></g:myTag>--}%
</body>
</html>