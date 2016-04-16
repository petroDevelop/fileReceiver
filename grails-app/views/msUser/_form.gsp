<%@ page import="com.petrodata.microseism.MsUser" %>



<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="msUser.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" maxlength="50" value="${msUserInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'userPwd', 'error')} ">
	<label for="userPwd">
		<g:message code="msUser.userPwd.label" default="User Pwd" />
		
	</label>
	<g:textField name="userPwd" maxlength="50" value="${msUserInstance?.userPwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'rigName', 'error')} ">
	<label for="rigName">
		<g:message code="msUser.rigName.label" default="Rig Name" />
		
	</label>
	<g:textField name="rigName" maxlength="100" value="${msUserInstance?.rigName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'msRole', 'error')} required">
	<label for="msRole">
		<g:message code="msUser.msRole.label" default="Ms Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="msRole" name="msRole.id" from="${com.petrodata.microseism.MsRole.list()}" optionKey="id" required="" value="${msUserInstance?.msRole?.id}" class="many-to-one"/>
</div>

