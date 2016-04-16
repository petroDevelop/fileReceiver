
<%@ page import="com.petrodata.microseism.MsProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msProject.label', default: 'MsProject')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-msProject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-msProject" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="projectName" title="${message(code: 'msProject.projectName.label', default: 'Project Name')}" />
					
						<g:sortableColumn property="rigName" title="${message(code: 'msProject.rigName.label', default: 'Rig Name')}" />
					
						<th><g:message code="msProject.msUser.label" default="Ms User" /></th>
					
						<g:sortableColumn property="remark" title="${message(code: 'msProject.remark.label', default: 'Remark')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'msProject.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'msProject.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${msProjectInstanceList}" status="i" var="msProjectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${msProjectInstance.id}">${fieldValue(bean: msProjectInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: msProjectInstance, field: "rigName")}</td>
					
						<td>${fieldValue(bean: msProjectInstance, field: "msUser")}</td>
					
						<td>${fieldValue(bean: msProjectInstance, field: "remark")}</td>
					
						<td><g:formatDate date="${msProjectInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${msProjectInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${msProjectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
