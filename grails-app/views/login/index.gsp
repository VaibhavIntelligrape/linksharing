<%@ page import="com.linksharing.LinkResourceController; linksharing.UserPersistService; linksharing.UserPersistService; linksharing.UserPersistService; linksharing.UserPersistService; com.linksharing.User" %>
<%@ page import="com.linksharing.UserController" %>
<%@ page import="com.linksharing.Resource" %>
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
    <meta name="layout" content="login">
    %{--<g:layoutTitle>Link Sharing Application</g:layoutTitle>--}%
    %{--<title>Link Sharing Portal</title>--}%

</head>

<body>
<div class="body">
    <div style="border: solid thick ;align-self: auto;height: 50px;">
        <div style="float: left">
        <header><b>LinkSharing App</b></header>
        </div>
            <div style="float: right; margin-top: 0px">
            <form id="search-form" name="search" action="/products" method="get">
                <input id="search-input" name="search" type="text">
                <input src="/linksharing/home/searchbutton3.gif" name="submit" type="image">
            </form>
        </div>
    </div>
    <div style="margin-top: 5px">
<div style="float: left;">
    <%if(params.message!=null){%>
    <%out.println(params.message)
        }%>
    %{--<div style="border:solid thick ;float: left;clear: left;float: left;height:200px;width:500px;overflow:scroll;">--}%
    <div style="border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;">
        <g:render template="recent_shares"  />
    </div>

    <div style="border:solid thick ;float: left;clear: left;float: left;height:200px;width:500px;overflow:scroll;">
        <g:render template="top_post"  />
    </div>
</div>
    <div style="float: right;width: 450px">
    <div style="border:solid thick ;right:50px;top: 0px ;float: right" >
<%if(request.getAttribute("msg")!=null){
    println(request.getAttribute("msg").toString())
    out.println(request.getAttribute("msg").toString())} %>

<g:form url="[controller:'login',action:'loginHandler']">
    <table>
        <tr><td>Email:</td><td><input id="email1" name="email"  type="email"/></td></tr>
        <tr><td>Password :</td><td><input id="password1" name="password" type="password"/></td></tr>
        <tr><td colspan="2"><input value="Login" type="submit"/></td></tr>
    </table>
</g:form>



    <g:uploadForm action="register" method="post">
        <table>
            <tr><td>First Name:</td><td><input id="firstname" name="firstname" type="text"/></td></tr>
            <tr><td>Last Name:</td><td><input id="lastname" name="lastname" type="text"/></td></tr>
            <tr><td>Username:</td><td><input id="username" name="username" type="text"/></td></tr>
            <tr><td>Email:</td><td><input id="email" name="email"  type="email"/></td></tr>
            <tr><td>Password :</td><td><input id="password" name="password" type="password"/></td></tr>
            <tr><td>Confirm Password:</td><td><input id="confirmpassword" name="confirmpassword"  type="text"/></td></tr>
            <tr><td>Image:</td><td><input id="image" name="image"  type="file"/></td></tr>
            <tr><td colspan="2"><input value="Register" type="submit"/></td></tr>
        </table>

    </g:uploadForm>
</div>
</div>
</div>
</div>
</body>
</html>
