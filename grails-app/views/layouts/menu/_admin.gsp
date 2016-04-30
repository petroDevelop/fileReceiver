
<li><a href="${request.contextPath}/msUser"><span class="glyphicon glyphicon-th"></span> 用户管理</a></li>
<li><a href="${request.contextPath}/msProject"><span class="glyphicon glyphicon-stats"></span> 项目管理</a></li>
<li><a href="javascript:void(0);" onclick="changeFileSaveDirectory();"><span class="glyphicon glyphicon-info-sign"></span> 存储位置设置</a></li>
<li><a href="${request.contextPath}/msFile"><span class="glyphicon glyphicon-list-alt"></span> 文件管理</a></li>
<li><a href="${request.contextPath}/msSmallFile"><span class="glyphicon glyphicon-pencil"></span> 文件块管理</a></li>


<script>
    $(function(){
        <g:if test="${['baseUser','baseRole','requestmap'].contains(params.controller)}">
            $("div [href='#sub-item-1']").click();
        </g:if>

    });
    function changeFileSaveDirectory(){
        $.get("${request.contextPath}/workspace/catchFileSaveDirectory", {},
                function (data, textStatus) {
                    var path=prompt("请设置服务器地:",data.path);
                    if (path!=null && path!="" && path!==data.path) {
                        var obj={};
                        obj.path=path;
                        $.post("${request.contextPath}/workspace/changeFileSaveDirectory", obj,
                                function (data, textStatus) {
                                    if (data.result) {
                                        alert('设置成功!');
                                    } else {
                                        alert('出现问题!'+data.message);
                                    }
                                }, "json");
                    }
                }, "json");
    }
</script>
