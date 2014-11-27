<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.Subscription; com.linksharing.LinkResourceController; com.linksharing.LinkResource; com.linksharing.Topic; com.linksharing.User; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<%List<Subscription> topicList=params["subscriptionsList"]%>
<div>
    %{--<form action="/abc" enctype="text/plain" id="share_link" method="get" name="Share Link" target="_self">Share Link</form>--}%
<g:form url="[controller:'LinkResource',action:'addUserLinkResource']" method="get">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Send Invitation
    <input src="/linksharing/home/cancel.jpeg" name="cancel" class="cancel" id="cancel" type="image" style="border:hidden;float: right;margin-right:8px;margin-top:3px;height: 16px ;width: 16px;padding: 0px">
    <hr />
    <div style="background: url('/linksharing/home/ban2.jpeg');">
    <p>Email * : <input name="email" type="email" value="" /></p>

    <p>Topic * : <select name="topicId">
        <%topicList.each {%>
        <option value="${it.topic.id}">${it.topic.name}</option>
<%}%>
    </select></p>

    <p><input name="b1" type="submit" value="Invite" /></p>
    </div>
</g:form>
</div>
</body>
</html>