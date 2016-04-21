<%@ page import="com.petrodata.microseism.MsSmallFile" %>




<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="msSmallFile.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="fileName" maxlength="200" required="" value="${msSmallFileInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'splitNum', 'error')} required">
	<label for="splitNum">
		<g:message code="msSmallFile.splitNum.label" default="Split Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="splitNum" class="form-control input-sm m-b-10"  type="number" value="${msSmallFileInstance.splitNum}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'fileSize', 'error')} required">
	<label for="fileSize">
		<g:message code="msSmallFile.fileSize.label" default="File Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fileSize" class="form-control input-sm m-b-10"  type="number" value="${msSmallFileInstance.fileSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'clientPath', 'error')} ">
	<label for="clientPath">
		<g:message code="msSmallFile.clientPath.label" default="Client Path" />
		
	</label>
	<g:textArea name="clientPath" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msSmallFileInstance?.clientPath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'md5', 'error')} ">
	<label for="md5">
		<g:message code="msSmallFile.md5.label" default="Md5" />
		
	</label>
	<g:textArea name="md5" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msSmallFileInstance?.md5}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msSmallFileInstance, field: 'serverPath', 'error')} ">
	<label for="serverPath">
		<g:message code="msSmallFile.serverPath.label" default="Server Path" />
		
	</label>
	<g:textArea name="serverPath" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msSmallFileInstance?.serverPath}"/>
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
	<g:select id="msFile" name="msFile.id" from="${com.petrodata.microseism.MsFile.list()}" optionKey="id" required="" value="${msSmallFileInstance?.msFile?.id}" class="form-control input-lg m-b-10"/>
</div>



<script>
	$('.form_date').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
</script>
