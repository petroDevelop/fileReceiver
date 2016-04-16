<%@ page import="com.petrodata.microseism.MsProject" %>



<div class="fieldcontain ${hasErrors(bean: msProjectInstance, field: 'projectName', 'error')} ">
	<label for="projectName">
		<g:message code="msProject.projectName.label" default="Project Name" />
		
	</label>
	<g:textField name="projectName" maxlength="200" value="${msProjectInstance?.projectName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msProjectInstance, field: 'rigName', 'error')} ">
	<label for="rigName">
		<g:message code="msProject.rigName.label" default="Rig Name" />
		
	</label>
	<g:textField name="rigName" maxlength="100" value="${msProjectInstance?.rigName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msProjectInstance, field: 'msUser', 'error')} required">
	<label for="msUser">
		<g:message code="msProject.msUser.label" default="Ms User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="msUser" name="msUser.id" from="${com.petrodata.microseism.MsUser.list()}" optionKey="id" required="" value="${msProjectInstance?.msUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msProjectInstance, field: 'remark', 'error')} ">
	<label for="remark">
		<g:message code="msProject.remark.label" default="Remark" />
		
	</label>
	<g:textArea name="remark" cols="40" rows="5" maxlength="1000" value="${msProjectInstance?.remark}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msProjectInstance, field: 'files', 'error')} ">
	<label for="files">
		<g:message code="msProject.files.label" default="Files" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${msProjectInstance?.files?}" var="f">
    <li><g:link controller="msFile" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="msFile" action="create" params="['msProject.id': msProjectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'msFile.label', default: 'MsFile')])}</g:link>
</li>
</ul>

</div>

