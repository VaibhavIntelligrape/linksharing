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


            <g:form url="[controller:'Topic',action:'createUserTopic']" method="get">&nbsp;&nbsp;Create Topic
                <input src="/linksharing/home/cancel.jpeg" name="cancel" class="cancel" id="cancel" type="image" style="border:hidden;float: right;margin-right:8px;margin-top:3px;height: 16px ;width: 16px;padding: 0px">
    <hr />
                <div style="background: url('/linksharing/home/ban2.jpeg');">
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