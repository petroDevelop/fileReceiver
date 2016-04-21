<%@ page import="com.petrodata.microseism.MsUser" %>




<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="msUser.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="userName" maxlength="50" required="" value="${msUserInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'userPwd', 'error')} required">
	<label for="userPwd">
		<g:message code="msUser.userPwd.label" default="User Pwd" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="userPwd" maxlength="50" required="" value="${msUserInstance?.userPwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'rigName', 'error')} ">
	<label for="rigName">
		<g:message code="msUser.rigName.label" default="Rig Name" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="rigName" maxlength="100" value="${msUserInstance?.rigName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: msUserInstance, field: 'msRole', 'error')} required">
	<label for="msRole">
		<g:message code="msUser.msRole.label" default="Ms Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="msRole" name="msRole.id" from="${com.petrodata.microseism.MsRole.list()}" optionKey="id" required="" value="${msUserInstance?.msRole?.id}" class="form-control input-lg m-b-10"/>
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
