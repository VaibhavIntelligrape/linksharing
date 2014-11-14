<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 13/11/14
  Time: 7:24 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<div class="container">
<div class="header" style="height: 10px"></div>
<div class="mainBody">
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