
<%@ page import="com.petrodata.microseism.MsUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'msUser.label', default: 'MsUser')}" />
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
						

						<tr><th>	<span id="userName-label" class="property-label"><g:message code="msUser.userName.label" default="User Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${msUserInstance}" field="userName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="userPwd-label" class="property-label"><g:message code="msUser.userPwd.label" default="User Pwd" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="userPwd-label"><g:fieldValue bean="${msUserInstance}" field="userPwd"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="rigName-label" class="property-label"><g:message code="msUser.rigName.label" default="Rig Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="rigName-label"><g:fieldValue bean="${msUserInstance}" field="rigName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="msRole-label" class="property-label"><g:message code="msUser.msRole.label" default="Ms Role" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="msRole-label"><g:link controller="msRole" action="show" id="${msUserInstance?.msRole?.id}">${msUserInstance?.msRole?.encodeAsHTML()}</g:link></span>
								</td>

						</tr>

						   </table>
					<g:form url="[resource:msUserInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${msUserInstance?.id}" />
							<g:link class="btn btn-default margin" action="edit"  id="${msUserInstance?.id}" resource="${msUserInstance}">
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
