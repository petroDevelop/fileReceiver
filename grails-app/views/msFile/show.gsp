
<%@ page import="com.petrodata.microseism.MsFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'msFile.label', default: 'MsFile')}" />
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
						

						<tr><th>	<span id="fileName-label" class="property-label"><g:message code="msFile.fileName.label" default="File Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${msFileInstance}" field="fileName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="fileSize-label" class="property-label"><g:message code="msFile.fileSize.label" default="File Size" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="fileSize-label"><g:fieldValue bean="${msFileInstance}" field="fileSize"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="smallFileNum-label" class="property-label"><g:message code="msFile.smallFileNum.label" default="Small File Num" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="smallFileNum-label"><g:fieldValue bean="${msFileInstance}" field="smallFileNum"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="percent-label" class="property-label"><g:message code="msFile.percent.label" default="Percent" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="percent-label"><g:fieldValue bean="${msFileInstance}" field="percent"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="uploaded-label" class="property-label"><g:message code="msFile.uploaded.label" default="Uploaded" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="uploaded-label"><g:formatBoolean boolean="${msFileInstance?.uploaded}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="clientPath-label" class="property-label"><g:message code="msFile.clientPath.label" default="Client Path" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="clientPath-label"><g:fieldValue bean="${msFileInstance}" field="clientPath"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="md5-label" class="property-label"><g:message code="msFile.md5.label" default="Md5" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="md5-label"><g:fieldValue bean="${msFileInstance}" field="md5"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="serverPath-label" class="property-label"><g:message code="msFile.serverPath.label" default="Server Path" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="serverPath-label"><g:fieldValue bean="${msFileInstance}" field="serverPath"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="dateCreated-label" class="property-label"><g:message code="msFile.dateCreated.label" default="Date Created" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${msFileInstance?.dateCreated}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="lastUpdated-label" class="property-label"><g:message code="msFile.lastUpdated.label" default="Last Updated" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${msFileInstance?.lastUpdated}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="msProject-label" class="property-label"><g:message code="msFile.msProject.label" default="Ms Project" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="msProject-label"><g:link controller="msProject" action="show" id="${msFileInstance?.msProject?.id}">${msFileInstance?.msProject?.encodeAsHTML()}</g:link></span>
								</td>

						</tr>

						   </table>
					<g:form url="[resource:msFileInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${msFileInstance?.id}" />
							<g:link class="btn btn-default margin" action="edit"  id="${msFileInstance?.id}" resource="${msFileInstance}">
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
