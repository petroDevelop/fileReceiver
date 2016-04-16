
<%@ page import="com.petrodata.microseism.MsSmallFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msSmallFile.label', default: 'MsSmallFile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-msSmallFile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-msSmallFile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list msSmallFile">
			
				<g:if test="${msSmallFileInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="msSmallFile.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${msSmallFileInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msSmallFileInstance?.fileSize}">
				<li class="fieldcontain">
					<span id="fileSize-label" class="property-label"><g:message code="msSmallFile.fileSize.label" default="File Size" /></span>
					
						<span class="property-value" aria-labelledby="fileSize-label"><g:fieldValue bean="${msSmallFileInstance}" field="fileSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msSmallFileInstance?.uploaded}">
				<li class="fieldcontain">
					<span id="uploaded-label" class="property-label"><g:message code="msSmallFile.uploaded.label" default="Uploaded" /></span>
					
						<span class="property-value" aria-labelledby="uploaded-label"><g:formatBoolean boolean="${msSmallFileInstance?.uploaded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${msSmallFileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="msSmallFile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${msSmallFileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${msSmallFileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="msSmallFile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${msSmallFileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${msSmallFileInstance?.msFile}">
				<li class="fieldcontain">
					<span id="msFile-label" class="property-label"><g:message code="msSmallFile.msFile.label" default="Ms File" /></span>
					
						<span class="property-value" aria-labelledby="msFile-label"><g:link controller="msFile" action="show" id="${msSmallFileInstance?.msFile?.id}">${msSmallFileInstance?.msFile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${msSmallFileInstance?.id}" />
					<g:link class="edit" action="edit" id="${msSmallFileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
