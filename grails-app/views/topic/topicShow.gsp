<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 13/11/14
  Time: 7:24 PM
--%>

<%@ page import="com.linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>
<%User user=params["userObject"]
    %>
<body>
<div class="container">
<div class="header">

    <div style="border: solid thick ;align-self: auto;height: 50px;">
        <div style="float: left">
            <header><b>LinkSharing App</b></header>
        </div>
        <div style="float: right; margin-top: 0px;">
            <div style="float: right">

                <input src="/linksharing/home/atchmnt.jpeg" name="submit" type="image"style="height: 15px ;width: 15px"><input src="/linksharing/home/page.png" name="submit" type="image"style="height: 15px ;width: 15px">
                <input src="/linksharing/home/${user.image}" name="submit" type="image"style="height: 15px ;width: 15px">${user.username}<input src="/linksharing/home/drop.jpeg" name="submit" type="image"style="height: 15px ;width: 15px">
            </div>
            <div style="float: right">
                <form id="search-form" name="search" action="/products" method="get">
                    <input id="search-input" name="search" type="text">
                    <input src="/linksharing/home/searchbutton3.gif" name="submit" type="image"style="height: 15px ;width: 15px">
                </form>
            </div>

        </div>
    </div>
</div>
<div class="mainBody" style="margin-top: 10px">
<div class="leftBody" style="float: left">
    <div style="border-style: solid; float:left;;width:auto;border-radius: 25px;margin-bottom: 10px;height:250px;width:450px;">
<g:render template="topic_detail"></g:render>
</div>
 <div style="border:solid thick ;float:left;clear:left;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px;margin-bottom: 10px">
        <g:render template="topics_userList"></g:render>
</div>
</div>
    <div class="rightBody" style="float: right">
    <div style="border:solid thick ;float:right;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px;margin-bottom: 10px">
        <g:render template="topic_posts"></g:render>
    </div>
        </div>



</div>
    </div>
</body>
</html>