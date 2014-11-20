<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.User; com.linksharing.Resource" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>

<body>
<%
List<Resource> ls=params["userCreatedResrcList"]
%>
<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div style="  padding: 5px 10px;">Posts</div>
        </th>
    </tr>
    </thead>
    <tbody>
    <%ls.each {
    %>
    <tr>
        <th scope="row" style="text-align: left;">
            <div>
                <div style="float: left;">

                </div>
                <div style="margin-left: 80px">
                    <p>${it.topic.name}</p>
                    </br>
                    ${it.description} </p>

                </div>
                <div>
                    <p><img alt="" src="/linksharing/assets/fb.jpeg" width="15"/>&nbsp; <img alt="" src="/linksharing/assets/twitter_ico.png" width="15"/>&nbsp; <img alt="" src="/linksharing/assets/gPlus.png" width="15"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>Download</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewFullSite</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>MarkAsRead</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u><g:link controller="post" action="index" params='[rid:"${it.id}"]'>ViewPost</g:link></u></span></span></p>
                </div>
            </div>
        </th>
    </tr>
    <% }%>
    %{--<tr>
        <th scope="row" style="text-align: left;">
            <p>UserName &nbsp; <%= ls.get(1).lastUpdated %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= ls.get(1).topic.name %><br />
                &nbsp;</p>

            <p><%= ls.get(1).description %></p>
        </th>
        <th scope="row" style="text-align: left;">&nbsp;</th>
    </tr>--}%
    </tbody>
</table>

%{--<g:userInbox/>--}%
</br>
</body>
</html>