<%@ page import="com.petrodata.microseism.MsFile" %>




<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="msFile.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="fileName" maxlength="200" required="" value="${msFileInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'fileSize', 'error')} required">
	<label for="fileSize">
		<g:message code="msFile.fileSize.label" default="File Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fileSize" class="form-control input-sm m-b-10"  type="number" value="${msFileInstance.fileSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'smallFileNum', 'error')} required">
	<label for="smallFileNum">
		<g:message code="msFile.smallFileNum.label" default="Small File Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="smallFileNum" class="form-control input-sm m-b-10"  type="number" value="${msFileInstance.smallFileNum}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'percent', 'error')} required">
	<label for="percent">
		<g:message code="msFile.percent.label" default="Percent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="percent" class="form-control input-sm m-b-10"  type="number" value="${msFileInstance.percent}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'uploaded', 'error')} ">
	<label for="uploaded">
		<g:message code="msFile.uploaded.label" default="Uploaded" />
		
	</label>
	<g:checkBox name="uploaded" value="${msFileInstance?.uploaded}" />
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'clientPath', 'error')} ">
	<label for="clientPath">
		<g:message code="msFile.clientPath.label" default="Client Path" />
		
	</label>
	<g:textArea name="clientPath" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msFileInstance?.clientPath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'md5', 'error')} ">
	<label for="md5">
		<g:message code="msFile.md5.label" default="Md5" />
		
	</label>
	<g:textArea name="md5" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msFileInstance?.md5}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'serverPath', 'error')} ">
	<label for="serverPath">
		<g:message code="msFile.serverPath.label" default="Server Path" />
		
	</label>
	<g:textArea name="serverPath" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msFileInstance?.serverPath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msFileInstance, field: 'msProject', 'error')} required">
	<label for="msProject">
		<g:message code="msFile.msProject.label" default="Ms Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="msProject" name="msProject.id" from="${com.petrodata.microseism.MsProject.list()}" optionKey="id" required="" value="${msFileInstance?.msProject?.id}" class="form-control input-lg m-b-10"/>
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
