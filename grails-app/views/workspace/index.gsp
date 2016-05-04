<%@ page import="com.petrodata.microseism.MsUser" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="luminoPro">
    <%
        def user=com.petrodata.microseism.MsUser.findByUserName(session.user);
        if(user?.msRole?.roleName=="ROLE_ADMIN"){
            response.sendRedirect("${request.contextPath}/msUser");
        }
        if(user?.msRole?.roleName=="ROLE_USER"){
            response.sendRedirect("${request.contextPath}/msFile");
        }
        %>
</head>

<body>

<div class="row">
    <ol class="breadcrumb">

    </ol>
</div><!--/.row-->

<g:render template="manager"/>

</body>
</html>