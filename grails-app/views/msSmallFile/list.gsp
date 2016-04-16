
<%@ page import="com.petrodata.microseism.MsSmallFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msSmallFile.label', default: 'MsSmallFile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-msSmallFile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-msSmallFile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fileName" title="${message(code: 'msSmallFile.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="fileSize" title="${message(code: 'msSmallFile.fileSize.label', default: 'File Size')}" />
					
						<g:sortableColumn property="uploaded" title="${message(code: 'msSmallFile.uploaded.label', default: 'Uploaded')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'msSmallFile.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="msSmallFile.file.label" default="File" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'msSmallFile.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${msSmallFileInstanceList}" status="i" var="msSmallFileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${msSmallFileInstance.id}">${fieldValue(bean: msSmallFileInstance, field: "fileName")}</g:link></td>
					
						<td>${fieldValue(bean: msSmallFileInstance, field: "fileSize")}</td>
					
						<td><g:formatBoolean boolean="${msSmallFileInstance.uploaded}" /></td>
					
						<td><g:formatDate date="${msSmallFileInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: msSmallFileInstance, field: "file")}</td>
					
						<td><g:formatDate date="${msSmallFileInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${msSmallFileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
