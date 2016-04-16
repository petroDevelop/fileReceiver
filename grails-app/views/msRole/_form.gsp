<%@ page import="com.petrodata.microseism.MsRole" %>



<div class="fieldcontain ${hasErrors(bean: msRoleInstance, field: 'roleName', 'error')} ">
	<label for="roleName">
		<g:message code="msRole.roleName.label" default="Role Name" />
		
	</label>
	<g:textField name="roleName" maxlength="10" value="${msRoleInstance?.roleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msRoleInstance, field: 'remark', 'error')} ">
	<label for="remark">
		<g:message code="msRole.remark.label" default="Remark" />
		
	</label>
	<g:textArea name="remark" cols="40" rows="5" maxlength="500" value="${msRoleInstance?.remark}"/>
</div>

