<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.DocumentResourceController; com.linksharing.Topic; com.linksharing.User; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<%List<Topic> topicList=params["userTopicList"]%>
<div>
    %{--<form action="/abc" enctype="text/plain" id="share_link" method="get" name="Share Link" target="_self">Share Link</form>--}%
%{---<g:form url="[controller:'LinkResource',action:'addUserLinkResource']" method="get">Document Link--}%
  <g:uploadForm url="[controller:'DocumentResource',action:'addUserDocumentResource']">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share Document
      <input src="/linksharing/home/cancel.jpeg" name="cancel" class="cancel" id="cancel" type="image" style="border:hidden;float: right;margin-right:8px;margin-top:3px;height: 16px ;width: 16px;padding: 0px">
    <hr />
      <div style="background: url('/linksharing/home/ban2.jpeg');">
      <p>Document * : <input name="doc" type="file" value="" /></p>

      <p>Desciption * :<textarea name="description"></textarea></p>

      <p>&nbsp;</p>

      <p>Topic * : <select name="topicId">
        <%topicList.each {%>
        <option value="${it.id}">${it.name}</option>
<%}%>
    </select></p>

    <p><input name="b1" type="submit" value="Share" /></p>
      </div>
  </g:uploadForm>
</div>
</body>
</html>