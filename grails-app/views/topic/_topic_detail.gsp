<%@ page import="com.linksharing.Subscription; com.linksharing.User; com.linksharing.Topic" %>
<!doctype html>
<html>
<head>
    <title>Topic SHow PAge</title>
</head>
<body>
<% Topic topic=params["topicObject"]
User user=params["userObject"]
boolean flag=false
 Set<Subscription> subscriptionSet=topic.subscriptions
subscriptionSet.each {
    if(it.user==user){flag=true}
}
%>
<div><g:form method="get" url="[controller:'Topic',action:'createUserTopic']">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Topic : "${topic.name}"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#0000FF;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  </span><br />
    &nbsp;
    <hr />
    <div style="float: left">
    <p>&nbsp;&nbsp; <img alt="BlankImage" src="/linksharing/home/${topic.user.image}" width="45"  />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
    </div>
    <div style="">
    <p>${topic.name}(${topic.visibility})</p>
    </br>
    <p>@${topic.user.email}&nbsp;&nbsp;&nbsp;&nbsp; subscription&nbsp;&nbsp; post</p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<%if((flag==false) && (user.id!=topic.user.id))/*(user.id!=topic.user.id)*/{%>Subscribe<%}%> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${topic.subscriptions.size()} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;${topic.resources.size()}&nbsp;</p>
    </br>
    <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<%if(user.id==topic.user.id){%><select name="seriousness"><option value="Serious">Serious</option><option value="VerySerious">VerySerious</option> </select>&nbsp;&nbsp; <img alt="mail" height="23" src="http://www.quackit.com/html/online-html-editor/ckeditor/ckeditor_4.4.1_full/plugins/smiley/images/envelope.png" title="mail" width="23" /><%}%></p>
    </div>
</g:form></div>

<p>&nbsp;</p>
</body>
</html>

