<%@ page import="com.linksharing.User" %>
<!doctype html>
<html>
<head>
    <title>HTML Editor - Full Version</title>
</head>
<body>




<%User user=params["userObject"]
String userSubscriptionSize=params["userSubscriptionSize"]
String userTopicListSize=params["userTopicListSize"]
%>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width: 500px;width: 500px;>
<thead>
<tr>
<th colspan="2" scope="row">
<div div style="background: none repeat scroll 0% 0% rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px; text-align: left;">Trending Topics</div>
</th>
</tr>
</thead>
<tbody>
<tr>
    <th scope="row" style="text-align: left;">
        <g:form method="get" url="[controller:'Topic',action:'createUserTopic']">
            <hr />
            <div>
                <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/assets/person1.jpeg" width="55"  />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UserName</p>
            </div>
            <div>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @User Email</p>

                <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>

                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subscription&nbsp;&nbsp;&nbsp;&nbsp; Topics</p>

                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sixsisi &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; size &nbsp;</p>

                <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
            </div>
        </g:form>
    </th>
    <th scope="row" style="text-align: left;">&nbsp;</th>
</tr>

<tr>
    <th scope="row" style="text-align: left;">
        <g:form method="get" url="[controller:'Topic',action:'createUserTopic']">
            <hr />
            <div>
                <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/assets/person1.jpeg" width="55"  />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UserName</p>
            </div>
            <div>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @User Email</p>

                <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>

                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subscription&nbsp;&nbsp;&nbsp;&nbsp; Topics</p>

                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sixsisi &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; size &nbsp;</p>

                <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
            </div>
        </g:form>
    </th>
    <th scope="row" style="text-align: left;">&nbsp;</th>
</tr>
%{--<tr>l
    <th scope="row" style="text-align: left;">
        <p>UserName &nbsp; <%= ls.get(1).lastUpdated %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= ls.get(1).topic.name %><br />
            &nbsp;</p>

        <p><%= ls.get(1).description %></p>
    </th>
    <th scope="row" style="text-align: left;">&nbsp;</th>
</tr>--}%
</tbody>
</table>
</body>
</html>
