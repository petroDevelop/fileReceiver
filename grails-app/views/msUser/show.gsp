
<%@ page import="com.petrodata.microseism.MsUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msUser.label', default: 'MsUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-msUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-msUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list msUser">
			
				<g:if test="${msUserInstance?.userName}">
				<li class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="msUser.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${msUserInstance}" field="userName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msUserInstance?.userPwd}">
				<li class="fieldcontain">
					<span id="userPwd-label" class="property-label"><g:message code="msUser.userPwd.label" default="User Pwd" /></span>
					
						<span class="property-value" aria-labelledby="userPwd-label"><g:fieldValue bean="${msUserInstance}" field="userPwd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msUserInstance?.rigName}">
				<li class="fieldcontain">
					<span id="rigName-label" class="property-label"><g:message code="msUser.rigName.label" default="Rig Name" /></span>
					
						<span class="property-value" aria-labelledby="rigName-label"><g:fieldValue bean="${msUserInstance}" field="rigName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msUserInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="msUser.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="msRole" action="show" id="${msUserInstance?.role?.id}">${msUserInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${msUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${msUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
