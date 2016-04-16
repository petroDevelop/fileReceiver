
<%@ page import="com.petrodata.microseism.MsFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msFile.label', default: 'MsFile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-msFile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-msFile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list msFile">
			
				<g:if test="${msFileInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="msFile.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${msFileInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.fileSize}">
				<li class="fieldcontain">
					<span id="fileSize-label" class="property-label"><g:message code="msFile.fileSize.label" default="File Size" /></span>
					
						<span class="property-value" aria-labelledby="fileSize-label"><g:fieldValue bean="${msFileInstance}" field="fileSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.smallFileNum}">
				<li class="fieldcontain">
					<span id="smallFileNum-label" class="property-label"><g:message code="msFile.smallFileNum.label" default="Small File Num" /></span>
					
						<span class="property-value" aria-labelledby="smallFileNum-label"><g:fieldValue bean="${msFileInstance}" field="smallFileNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.percent}">
				<li class="fieldcontain">
					<span id="percent-label" class="property-label"><g:message code="msFile.percent.label" default="Percent" /></span>
					
						<span class="property-value" aria-labelledby="percent-label"><g:fieldValue bean="${msFileInstance}" field="percent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="msFile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${msFileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.files}">
				<li class="fieldcontain">
					<span id="files-label" class="property-label"><g:message code="msFile.files.label" default="Files" /></span>
					
						<g:each in="${msFileInstance.files}" var="f">
						<span class="property-value" aria-labelledby="files-label"><g:link controller="msSmallFile" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="msFile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${msFileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${msFileInstance?.msProject}">
				<li class="fieldcontain">
					<span id="msProject-label" class="property-label"><g:message code="msFile.msProject.label" default="Ms Project" /></span>
					
						<span class="property-value" aria-labelledby="msProject-label"><g:link controller="msProject" action="show" id="${msFileInstance?.msProject?.id}">${msFileInstance?.msProject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${msFileInstance?.id}" />
					<g:link class="edit" action="edit" id="${msFileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
