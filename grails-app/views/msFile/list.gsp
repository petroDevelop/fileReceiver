
<%@ page import="com.petrodata.microseism.MsFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msFile.label', default: 'MsFile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-msFile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-msFile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fileName" title="${message(code: 'msFile.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="fileSize" title="${message(code: 'msFile.fileSize.label', default: 'File Size')}" />
					
						<g:sortableColumn property="smallFileNum" title="${message(code: 'msFile.smallFileNum.label', default: 'Small File Num')}" />
					
						<g:sortableColumn property="percent" title="${message(code: 'msFile.percent.label', default: 'Percent')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'msFile.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'msFile.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${msFileInstanceList}" status="i" var="msFileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${msFileInstance.id}">${fieldValue(bean: msFileInstance, field: "fileName")}</g:link></td>
					
						<td>${fieldValue(bean: msFileInstance, field: "fileSize")}</td>
					
						<td>${fieldValue(bean: msFileInstance, field: "smallFileNum")}</td>
					
						<td>${fieldValue(bean: msFileInstance, field: "percent")}</td>
					
						<td><g:formatDate date="${msFileInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${msFileInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${msFileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
