<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 8/11/14
  Time: 10:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<b>Welcome, Dear ${session["user"]?session["user"]: "no user"} </b>
<b>Welcome, Dear ${request.getAttribute("userName")?request.getAttribute("userName").toString(): "no user"} </b>
</body>
</html>