<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.TopicController; com.linksharing.DocumentResourceController; com.linksharing.Topic; com.linksharing.User; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div>
<g:form url="[controller:'Topic',action:'createUserTopic']" method="get">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create Topic
    <hr />
    <p>Name * : <input name="name" type="text" value="" /></p>

    <p>&nbsp;</p>

    <p>Visibility * : <select name="visibility">
        <option value="PUBLIC">Public</option>
        <option value="PRIVATE">Private</option>
    </select></p>

    <p><input name="b1" type="submit" value="create" /></p>
  </g:form>
</div>
</body>
</html>