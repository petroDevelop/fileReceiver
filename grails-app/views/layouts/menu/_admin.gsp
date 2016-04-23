
<li><a href="${request.contextPath}/msUser"><span class="glyphicon glyphicon-th"></span> 用户管理</a></li>
<li><a href="${request.contextPath}/msProject"><span class="glyphicon glyphicon-stats"></span> 项目管理</a></li>
<li><a href="${request.contextPath}/msFile"><span class="glyphicon glyphicon-list-alt"></span> 文件管理</a></li>
<li><a href="${request.contextPath}/msSmallFile"><span class="glyphicon glyphicon-pencil"></span> 文件块管理</a></li>


<script>
    $(function(){
        <g:if test="${['baseUser','baseRole','requestmap'].contains(params.controller)}">
            $("div [href='#sub-item-1']").click();
        </g:if>

    });
</script>
