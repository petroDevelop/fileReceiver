<%@ page import="com.petrodata.microseism.MsSmallFile" %>



<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'fileName', 'error')} ">
	<label for="fileName">
		<g:message code="msSmallFile.fileName.label" default="File Name" />
		
	</label>
	<g:textField name="fileName" maxlength="200" value="${msSmallFileInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'fileSize', 'error')} required">
	<label for="fileSize">
		<g:message code="msSmallFile.fileSize.label" default="File Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fileSize" type="number" value="${msSmallFileInstance.fileSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'uploaded', 'error')} ">
	<label for="uploaded">
		<g:message code="msSmallFile.uploaded.label" default="Uploaded" />
		
	</label>
	<g:checkBox name="uploaded" value="${msSmallFileInstance?.uploaded}" />
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'msFile', 'error')} required">
	<label for="msFile">
		<g:message code="msSmallFile.msFile.label" default="Ms File" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="msFile" name="msFile.id" from="${com.petrodata.microseism.MsFile.list()}" optionKey="id" required="" value="${msSmallFileInstance?.msFile?.id}" class="many-to-one"/>
</div>

