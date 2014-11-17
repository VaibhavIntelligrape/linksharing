<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.Topic; com.linksharing.User; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<body>
<%User user=params["userObject"]
Topic topic=params["topicObject"]
%>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width: 437px">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div>
                <div style="padding: 5px 10px; text-align: left;float: left;">Users :${topic.name} </div>

              </div>
        </th>
    </tr>
    </thead>
    <tbody>
    <%
        List<User> userList=params["subscribedUserList"]

        userList.each {
    %>
    <tr>
        <th scope="row" style="text-align: left;padding-right: 90px;">
            <div>
                <div style="float: left;">
                    <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${it.image}" width="55"  />
                </div>
               <div>
                <div>

                    <p>${it.firstName}</p>
                    <p>${it.email}</p>

                </div>
                <div>
                    <div style="float: left">
                    <p>Subscription</p>
                    <p>${it.subscriptions.size()}</p>
                </div>
                    <div>
                        <p>Topics</p>
                        <p>${it.topics.size()}</p>
                    </div>
                </div>
            </div>
            </div>
        </th>
    </tr>

    <%}%>
    </tbody>
</table>
</body>
</html>