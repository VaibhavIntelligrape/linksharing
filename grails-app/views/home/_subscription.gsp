<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.User; com.linksharing.Topic; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<%List<Topic> ls=params["subscriptions"]
User user=params["userObject"]
%>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:440px ;height: 300px">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div style="  padding: 5px 10px;">Subscriptions</div>
        </th>
    </tr>
    </thead>
    <tbody>
    <%ls.each {if (it!=null ){
    %>
    <%if(session["user_id"]==it.user.id){%>
    <tr>
        <th scope="row" style="text-align: left;">
            <g:form method="get" url="[controller:'Topic',action:'createUserTopic']">
                <div>
                    <div style="float: left">
                <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${it.user.image}" width="45"  /></p>
                    </div>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="name" type="text" value="${it.name}" /><input name="save" type="submit" value="Save" />

                    <div>
                        <div style="float: left;padding-left: 170px">
                            <p>Subscription</p>
                            <p>${it.subscriptions.size()}</p>
                        </div>
                        <div>
                            <p>Posts</p>
                            <p>${it.resources.size()}</p>
                        </div>


                        <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <select name="seriousness"><option value="Serious">Serious</option><option value="VerySerious">VerySerious</option> </select> <select name="visibility"><option value="PRIVATE">PRIVATE</option><option value="PUBLIC">PUBLIC</option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </select>&nbsp;&nbsp; <img alt="mail" height="23" src="/linksharing/home/message.jpeg" title="mail" width="23" />
                            <img alt="mail" height="23" src="/linksharing/home/editPage.jpeg" title="mail" width="23" />
                            <img alt="mail" height="23" src="/linksharing/home/delete.jpeg" title="mail" width="23" />
                        </p>
                    </div>
                </div>
            </g:form>        </th>
    </tr>
    <%}else{
        String toId=it.id
        String flag=false
        user.subscriptions.each {
            if(it.topic.id==toId){
                flag=true
            }
        }
    %>
    <tr>
        <th scope="row" style="text-align: left;">
            <div style="float: left">
                <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${it.user.image}" width="45"  />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
            </div>
            <div style="">
                <g:link controller="topic" action="topicShow" params='[tid:"${it.id}"]'><p>${it.name}</p></g:link>
                <p> ${it.user.email}</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(!flag==true){%>Subscribe<%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subscription&nbsp;&nbsp; post</p>

                <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${it.subscriptions.size()}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;${it.resources.size()}&nbsp;</p>
            </br>

            </div>
        </th>
    </tr>
    <% }}%>
    <% }%>
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

%{--<g:userInbox/>--}%
</body>
</html>