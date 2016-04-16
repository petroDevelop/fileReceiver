
<%@ page import="com.petrodata.microseism.MsUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msUser.label', default: 'MsUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-msUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-msUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="userName" title="${message(code: 'msUser.userName.label', default: 'User Name')}" />
					
						<g:sortableColumn property="userPwd" title="${message(code: 'msUser.userPwd.label', default: 'User Pwd')}" />
					
						<g:sortableColumn property="rigName" title="${message(code: 'msUser.rigName.label', default: 'Rig Name')}" />
					
						<th><g:message code="msUser.role.label" default="Role" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${msUserInstanceList}" status="i" var="msUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${msUserInstance.id}">${fieldValue(bean: msUserInstance, field: "userName")}</g:link></td>
					
						<td>${fieldValue(bean: msUserInstance, field: "userPwd")}</td>
					
						<td>${fieldValue(bean: msUserInstance, field: "rigName")}</td>
					
						<td>${fieldValue(bean: msUserInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${msUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
