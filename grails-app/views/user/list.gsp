<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 17/11/14
  Time: 5:40 PM
--%>
<%@ page import="com.linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
<%List<User> userList=params["userList"]
userList.each {
    out.println("Username :: "+it.username)
}
%>
<body>

</body>
</html>