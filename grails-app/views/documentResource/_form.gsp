<%@ page import="com.linksharing.DocumentResource" %>



<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="documentResource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${documentResourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="documentResource.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileName" required="" value="${documentResourceInstance?.fileName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'contentType', 'error')} required">
	<label for="contentType">
		<g:message code="documentResource.contentType.label" default="Content Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contentType" required="" value="${documentResourceInstance?.contentType}"/>

</div>

