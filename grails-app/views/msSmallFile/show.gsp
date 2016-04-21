
<%@ page import="com.petrodata.microseism.MsSmallFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'msSmallFile.label', default: 'MsSmallFile')}" />
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
						

						<tr><th>	<span id="fileName-label" class="property-label"><g:message code="msSmallFile.fileName.label" default="File Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${msSmallFileInstance}" field="fileName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="splitNum-label" class="property-label"><g:message code="msSmallFile.splitNum.label" default="Split Num" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="splitNum-label"><g:fieldValue bean="${msSmallFileInstance}" field="splitNum"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="fileSize-label" class="property-label"><g:message code="msSmallFile.fileSize.label" default="File Size" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="fileSize-label"><g:fieldValue bean="${msSmallFileInstance}" field="fileSize"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="clientPath-label" class="property-label"><g:message code="msSmallFile.clientPath.label" default="Client Path" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="clientPath-label"><g:fieldValue bean="${msSmallFileInstance}" field="clientPath"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="md5-label" class="property-label"><g:message code="msSmallFile.md5.label" default="Md5" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="md5-label"><g:fieldValue bean="${msSmallFileInstance}" field="md5"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="serverPath-label" class="property-label"><g:message code="msSmallFile.serverPath.label" default="Server Path" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="serverPath-label"><g:fieldValue bean="${msSmallFileInstance}" field="serverPath"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="uploaded-label" class="property-label"><g:message code="msSmallFile.uploaded.label" default="Uploaded" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="uploaded-label"><g:formatBoolean boolean="${msSmallFileInstance?.uploaded}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="dateCreated-label" class="property-label"><g:message code="msSmallFile.dateCreated.label" default="Date Created" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${msSmallFileInstance?.dateCreated}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="lastUpdated-label" class="property-label"><g:message code="msSmallFile.lastUpdated.label" default="Last Updated" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${msSmallFileInstance?.lastUpdated}" /></span>
								</td>

						</tr>

						

						<tr><th>	<span id="msFile-label" class="property-label"><g:message code="msSmallFile.msFile.label" default="Ms File" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="msFile-label"><g:link controller="msFile" action="show" id="${msSmallFileInstance?.msFile?.id}">${msSmallFileInstance?.msFile?.encodeAsHTML()}</g:link></span>
								</td>

						</tr>

						   </table>
					<g:form url="[resource:msSmallFileInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${msSmallFileInstance?.id}" />
							<g:link class="btn btn-default margin" action="edit"  id="${msSmallFileInstance?.id}" resource="${msSmallFileInstance}">
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
