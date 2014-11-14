<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 8/11/14
  Time: 10:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<b>Welcome, Dear ${session["user"]?session["user"]: "no user"} </b>
<br>
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
%{--<g:myTag name="vaibhav from taglib"></g:myTag>--}%
</body>
</html>