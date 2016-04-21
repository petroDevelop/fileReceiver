<%@ page import="com.petrodata.microseism.MsRole" %>




<div class="fieldcontain ${hasErrors(bean: msRoleInstance, field: 'roleName', 'error')} required">
	<label for="roleName">
		<g:message code="msRole.roleName.label" default="Role Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="roleName" maxlength="10" required="" value="${msRoleInstance?.roleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msRoleInstance, field: 'remark', 'error')} ">
	<label for="remark">
		<g:message code="msRole.remark.label" default="Remark" />
		
	</label>
	<g:textArea name="remark" class="form-control overflow"  cols="40" rows="5" maxlength="500" value="${msRoleInstance?.remark}"/>
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
