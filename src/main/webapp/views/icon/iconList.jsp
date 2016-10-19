<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>图标管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function(){
            //删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
            $(".remove_link").click(function(){
                var id = $(this).attr("name");
                $("#remove_id").val(id);
            });

            //删除确认
            $("#remove_confirm").click(function(){
                var id = $("#remove_id").val();
                var url = "${ctx}/icon/delete?id="+id;
                $.post(url,function(msg){
                    if(msg == true){
                        $("#icon_delSuc").css("display","block");
                    }
                });
            });
        });

        // 点击确认后，重新显示检索页面
        function sureSuc(){
            $("#icon_delSuc").css("display","none");
            window.location.href= "${ctx}/icon/iconList";
        }

    </script>
</head>

<body>
<div class="cont_txt">
    <p class="MUsers">系统管理-图标管理</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/icon/iconSub"><img src="${ctx}/resources/static/images/plus_03.png" /><span>图标录入</span></a>
            <li>
        </ul>
    </div>
    <div class="form_message">
        <form action="${ctx}/icon/iconList" method="post" id="query_form">
            <p>
                <span>图标名称</span>：<input type="text" name="name" value="${iconEntity.name}"/>
                <input class="btn-col" type="submit" value="查询" />
                <input class="btn-col" type="reset" value="重置" />
            </p>
        </form>
    </div>
    <div class="mtab">
        <table class="table" id="tab">
            <tr class="th_color">
                <th>序号</th>
                <th>图标名称</th>
                <th>图标样式</th>
                <th>图标类型</th>
                <th>图标</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${page.vos}" var="icon" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${icon.name }</td>
                    <td>${icon.iconclas }</td>
                    <td>${icon.typeName }</td>
                    <td><img src = "${ctx}/${icon.path}" /></td>
                    <td>${icon.extend }</td>
                    <td>
                        <a href="${ctx}/icon/iconSub?id=${icon.id}"  class="edit_link">编辑</a>
                        <a href="#delcfmModel" name="${icon.id}" data-toggle="modal" class="remove_link">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
    </div>
</div>
<!--删除对话框-->
<div class="modal fade container" id="delcfmModel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x</span></button>
                <h4 class="modal-title mark_info">确认</h4></div>
            <div class="modal-body">
                <p>确认删除该条记录？</p>
            </div>
            <div class="modal-footer foot_md">
                <input type="hidden" id="remove_id" value=""/>
                <button type="button" class="btn btn-default arrow_left" data-dismiss="modal">取消</button>
                <a id="remove_confirm" class="btn btn-success" data-dismiss="modal">确定</a></div>
        </div>
    </div>
</div>

<!--删除成功对话框-->
<div class="modal" id="icon_delSuc" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title mark_info">提示信息</h4>
            </div>
            <div class="modal-suc">
                <p>图标删除成功！</p>
            </div>
            <div class="modal-footer foot_md">
                <input type="hidden" id="url"/>
                <a class="btn btn-success"  onclick="sureSuc()">确定</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>

