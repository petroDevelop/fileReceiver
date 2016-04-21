
<%@ page import="com.petrodata.microseism.MsRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'msRole.label', default: 'MsRole')}" />
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
						

						<tr><th>	<span id="roleName-label" class="property-label"><g:message code="msRole.roleName.label" default="Role Name" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="roleName-label"><g:fieldValue bean="${msRoleInstance}" field="roleName"/></span>
								</td>

						</tr>

						

						<tr><th>	<span id="remark-label" class="property-label"><g:message code="msRole.remark.label" default="Remark" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${msRoleInstance}" field="remark"/></span>
								</td>

						</tr>

						   </table>
					<g:form url="[resource:msRoleInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${msRoleInstance?.id}" />
							<g:link class="btn btn-default margin" action="edit"  id="${msRoleInstance?.id}" resource="${msRoleInstance}">
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
