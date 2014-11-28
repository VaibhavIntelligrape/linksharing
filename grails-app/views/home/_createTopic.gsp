<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/11/14
  Time: 3:23 PM
--%>
<%@ page import="com.linksharing.TopicController; com.linksharing.DocumentResourceController; com.linksharing.Topic; com.linksharing.User; com.linksharing.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>

%{--url="[controller:'Topic',action:'createUserTopic']" method="get"--}%
            %{--<g:form>&nbsp;&nbsp;Create Topic--}%
<g:formRemote name="myForm" before="spin();" update="updateMe" after="spin()" url="[controller: 'Topic', action: 'createUserTopic',
/* params: [sort: 'title', order: 'desc']*/]">&nbsp;&nbsp;Create Topic
                <input src="/linksharing/home/cancel.jpeg" name="cancel" class="cancel" id="cancel" type="image" style="border:hidden;float: right;margin-right:8px;margin-top:3px;height: 16px ;width: 16px;padding: 0px">
    <hr />
                <div style="background: url('/linksharing/home/ban2.jpeg');">
    <p>Name * : <input name="name" id="tname" type="text"/></p>

    <p>&nbsp;</p>

    <p>Visibility * : <select name="visibility" id="visibility">
        <option value="PUBLIC">Public</option>
        <option value="PRIVATE">Private</option>
    </select></p>
    <p><input name="topicSaveB" id="topicSaveB" type="submit" value="create" /></p>
  </g:formRemote>
<div id="spin" hidden="hidden">
    <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Loading..." width="16" height="16" />
</div>
<div id="updateMe">
</div>
</div>

<script>
/*  $("#topicSaveB").click(function() {
        var topicName=$("#tname").val();
        var visibile=$("#visibility").val()
//      alert(topicName +" :: "+visibile)
        $.ajax({

            url:"${g.createLink(controller:'topic',action:'createUserTopic')}",
            dataType:'json'
            beforeSend: function() {
                $('spinner').style.display = visible ? "inline" : "none";
            }
            data: {name: topicName,visibility: visibile}
            success: function(data) {
                alert(data)
            },
            error: function(request, status, error) {
                alert(error)
            },
            complete: function() {
            }
        });
        return false;
    });
  */

   /* $("#topicSaveB").click(function(){
        alert("bjdbdvm lfmvlmv");
        return false;
    });*/
function spin(){
        $("#spin").fadeToggle()
}
</script>