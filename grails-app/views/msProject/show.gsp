
<%@ page import="com.petrodata.microseism.MsProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'msProject.label', default: 'MsProject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a  href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:link  action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			<li class="active" ><g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:message code="default.show.label" args="[entityName]" />
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
				</div>
				<div class="panel-body">
					<table class="table tile">
						

						<tr><th>	<span id="projectName-label" class="property-label"><g:message code="msProject.projectName.label" default="Project Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${msProjectInstance}" field="projectName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="rigName-label" class="property-label"><g:message code="msProject.rigName.label" default="Rig Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="rigName-label"><g:fieldValue bean="${msProjectInstance}" field="rigName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="msUser-label" class="property-label"><g:message code="msProject.msUser.label" default="Ms User" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="msUser-label"><g:link controller="msUser" action="show" id="${msProjectInstance?.msUser?.id}">${msProjectInstance?.msUser?.encodeAsHTML()}</g:link></span>
								</td>

						</tr>

						

						<tr><th>	<span id="remark-label" class="property-label"><g:message code="msProject.remark.label" default="Remark" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${msProjectInstance}" field="remark"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="dateCreated-label" class="property-label"><g:message code="msProject.dateCreated.label" default="Date Created" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${msProjectInstance?.dateCreated}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="files-label" class="property-label"><g:message code="msProject.files.label" default="Files" /></span></th>
							<td>
								<g:each in="${msProjectInstance.files}" var="f">
									<span class="property-value" aria-labelledby="files-label"><g:link controller="msFile" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
								</g:each>
								</td>

						</tr>

						

						<tr><th>	<span id="lastUpdated-label" class="property-label"><g:message code="msProject.lastUpdated.label" default="Last Updated" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${msProjectInstance?.lastUpdated}" /></span>
								</td>

						</tr>

						   </table>
					<g:form url="[resource:msProjectInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${msProjectInstance?.id}" />
							<g:link class="btn btn-default margin" action="edit"  id="${msProjectInstance?.id}" resource="${msProjectInstance}">
								<span class="glyphicon glyphicon-edit"></span>
								<g:message code="default.button.edit.label" default="Edit" /></g:link>
							<button type="submit" name="_action_delete"
									class="btn btn-default margin"
									onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
								<span class="glyphicon glyphicon-trash"></span>${message(code: 'default.button.delete.label', default: 'Delete')}</button>

						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div><!--/.row-->



	</body>
</html>
