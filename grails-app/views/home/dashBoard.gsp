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
</head>

<body>
<%User user=params["userObject"]%>
%{--<g:render template="header_home"/>--}%
<div class="container">
%{--<b>Welcome, Dear ${request.getAttribute("userName")?request.getAttribute("userName").toString(): "no user"} </b>--}%
<br>
<div>
<div style="width: 40%;float: left;margin-left: 80px;">
<div>
<g:render template="user_detail" />
</div>

    <div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
<g:render template="subscription"  />
</div>

<div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
<g:render template="trending_topics"  />
</div>

%{--<div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
<g:render template="createLinkRes"  />
</div>--}%
</div>
    <div style="float: right;margin-top:45px;margin-right: 80px">
        <div class="fadeMe" id="lockDiv" style="position:fixed;width: 100%;height: 100%;top:0;left: 0;z-index: 10; background: #000;opacity: 0.5;"hidden="hidden">&nbsp;</div>
        <div style="border:solid thick ;border-radius: 25px;height:auto;width:460px;overflow:scroll">
            <g:render template="user_inbox"  />
        </div>
        %{--<div style="border:solid thick ;margin-bottom: 2px;border-radius: 25px;height:250px;width:450px;overflow:scroll;">
        <g:render template="senInvite"  />
        </div>--}%
        %{--<div style="border:solid thick ;border-radius: 25px;margin-bottom: 2px;height:250px;width:450px;overflow:scroll;">
        <g:render template="createDocumentRes"  />
         </div>--}%
<br>
    </div>
</div>
</div>
%{--

<div class="createTopic" id="createTopic" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:200px;width:450px;margin: auto;">
    <g:render template="createTopic"  />
</div>
<div class="senInvite" id="senInvite" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:200px;width:450px;margin: auto;">
    <g:render template="senInvite"  />
</div>
<div class="createDocumentRes" id="createDocumentRes" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:265px;width:450px;margin: auto;">
    <g:render template="createDocumentRes"  />
</div>
<div class="createLinkRes" id="createLinkRes" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:260px;width:450px;margin: auto;">
    <g:render template="createLinkRes"  />
</div>
--}%

%{--<g:myTag name="vaibhav from taglib"></g:myTag>--}%
</body>
</html>