<%@ page import="com.petrodata.microseism.MsFile" %>



<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'fileName', 'error')} ">
	<label for="fileName">
		<g:message code="msFile.fileName.label" default="File Name" />
		
	</label>
	<g:textField name="fileName" maxlength="200" value="${msFileInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'fileSize', 'error')} required">
	<label for="fileSize">
		<g:message code="msFile.fileSize.label" default="File Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fileSize" type="number" value="${msFileInstance.fileSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'smallFileNum', 'error')} required">
	<label for="smallFileNum">
		<g:message code="msFile.smallFileNum.label" default="Small File Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="smallFileNum" type="number" value="${msFileInstance.smallFileNum}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'percent', 'error')} required">
	<label for="percent">
		<g:message code="msFile.percent.label" default="Percent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="percent" type="number" value="${msFileInstance.percent}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'files', 'error')} ">
	<label for="files">
		<g:message code="msFile.files.label" default="Files" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${msFileInstance?.files?}" var="f">
    <li><g:link controller="msSmallFile" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="msSmallFile" action="create" params="['msFile.id': msFileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'msSmallFile.label', default: 'MsSmallFile')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="msFile.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.petrodata.microseism.MsProject.list()}" optionKey="id" required="" value="${msFileInstance?.project?.id}" class="many-to-one"/>
</div>

