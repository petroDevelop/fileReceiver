
<%@ page import="com.petrodata.microseism.MsProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'msProject.label', default: 'MsProject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-msProject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-msProject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list msProject">
			
				<g:if test="${msProjectInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="msProject.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${msProjectInstance}" field="projectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msProjectInstance?.rigName}">
				<li class="fieldcontain">
					<span id="rigName-label" class="property-label"><g:message code="msProject.rigName.label" default="Rig Name" /></span>
					
						<span class="property-value" aria-labelledby="rigName-label"><g:fieldValue bean="${msProjectInstance}" field="rigName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msProjectInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="msProject.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="msUser" action="show" id="${msProjectInstance?.creator?.id}">${msProjectInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${msProjectInstance?.remark}">
				<li class="fieldcontain">
					<span id="remark-label" class="property-label"><g:message code="msProject.remark.label" default="Remark" /></span>
					
						<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${msProjectInstance}" field="remark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${msProjectInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="msProject.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${msProjectInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${msProjectInstance?.files}">
				<li class="fieldcontain">
					<span id="files-label" class="property-label"><g:message code="msProject.files.label" default="Files" /></span>
					
						<g:each in="${msProjectInstance.files}" var="f">
						<span class="property-value" aria-labelledby="files-label"><g:link controller="msFile" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${msProjectInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="msProject.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${msProjectInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${msProjectInstance?.id}" />
					<g:link class="edit" action="edit" id="${msProjectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
