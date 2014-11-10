<%@ page import="com.linksharing.User" %>
<%@ page import="com.linksharing.UserController" %>
<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 8/11/14
  Time: 9:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="main"/>
    <title>Link Sharing Portal</title>
</head>

<body>
<div class="body">
<%if(request.getAttribute("msg")!=null){
    println(request.getAttribute("msg").toString())
    out.println(request.getAttribute("msg").toString())} %>

<g:form url="[controller:'User',action:'loginHandler']">
    <table>
        <tr><td>Email:</td><td><input id="email1" name="email"  type="email"/></td></tr>
        <tr><td>Password :</td><td><input id="password1" name="password" type="password"/></td></tr>
        <tr><td colspan="2"><input value="Login" type="submit"/></td></tr>
    </table>
</g:form>



    <g:form action="register">
        <table>
            <tr><td>Name:</td><td><input id="name" name="name" type="text"/></td></tr>
            <tr><td>Email:</td><td><input id="email" name="email"  type="email"/></td></tr>
            <tr><td>Password :</td><td><input id="password" name="password" type="password"/></td></tr>
            <tr><td>City :</td><td><input id="city" name="city" type="text"/></td></tr>
            %{-- <tr><td>Confirm Password:</td><td><input id="password" name="password"  type="text"/></td></tr>--}%
            <tr><td>Age:</td><td><input id="age" name="age"  type="number"/></td></tr>
            <tr><td colspan="2"><input value="Register" type="submit"/></td></tr>
        </table>

    </g:form>
</div>
</body>
</html>
