<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
</br>
%{--<g:recentShares/>--}%

<%
    List<Resource> ls=(List<Resource>)request.getAttribute("resourceList")

    /*println("ls :: "+ls)*/
/*
    out << "TopicName : " +(ls.get(0).topic.name)
    out <<  "ResourceDescription : " +(ls.get(0).description)
    out <<  "TopicName : " +(ls.get(1).topic.name)
    out <<  "ResourceDescription : " +(ls.get(1).description)*/
%>

<table align="left" border="0" cellpadding="1" cellspacing="1" style="width:  485px;">
    <thead>
    <tr>
        <th scope="row">
            <div style="background: none repeat scroll 0% 0% rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px; text-align: left;"><b>Top Post</b></div>
        </th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" style="text-align: left;">
            <p><%=ls.get(0).topic.name%> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName</p>

            <p><%=ls.get(0).description%></p>
        </th>
    </tr>
    </tbody>
</table>
</br>
-----------------------------------------------------------------------------------------------------------------------------------------
</body>
</html>