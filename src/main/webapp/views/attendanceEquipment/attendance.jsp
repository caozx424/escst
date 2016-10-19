<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>门禁设备管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function sureSuc(){
            $("#area_delSuc").css("display","none");
            window.location.href = "${ctx}/attendanceEquipment/list";
        }
        $(function () {
            //删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
            $(".remove_link").click(function () {
                var id = $(this).attr("name");
                $("#remove_id").val(id);
            });

            //删除确认
            $("#remove_confirm").click(function () {
                var id = $("#remove_id").val();
                //alert(id);
                var url = "${ctx}/attendanceEquipment/delete?id=" + id;
//				alert(url);
                $.post(url, function (msg) {
                    if (msg == "success") {
                        $("#area_delSuc").css("display","block");
                    }
                });
            });



            <%--//删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用--%>
            <%--$(".resetpwd_link").click(function(){--%>
            <%--var id = $(this).attr("name");--%>
            <%--$("#resetpwd_id").val(id);--%>
            <%--});--%>

            <%--//删除确认--%>
            <%--$("#remove_confirm").click(function(){--%>
            <%--var id = $("#resetpwd_id").val();--%>
            <%--//alert(id);--%>
            <%--var url = "${ctx}/icon/resetPwd?id="+id;--%>
            <%--//				alert(url);--%>
            <%--$.post(url,function(msg){--%>
            <%--if(msg=="success"){--%>
            <%--alert("删除成功！");--%>
            <%--window.location.href = "${ctx}/icon/iconList";--%>
            <%--}--%>
            <%--});--%>
            <%--});--%>

        });
    </script>


</head>

<body>
<div class="cont_txt">
    <p class="MUsers">人员管理->门禁设备</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/attendanceEquipment/addList"><img
                        src="/resources/static/images/plus_03.png"/><span>设备录入</span></a>
            <li>
        </ul>
    </div>
    <form method="post" id="query_form" action="${ctx}/attendanceEquipment/list"></form>
    <div class="mtab">
        <table class="table" id="tab">
            <tr class="th_color">
                <th>序号</th>
                <th>设备名称</th>
                <th>设备类型</th>

                <th>sn序列号</th>

                <th>项目名称</th>
                <th>设备功能</th>


                <th>最后通讯时间</th>

                <th>&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
            </tr>
            <c:forEach items="${page.vos}" var="attendance" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${attendance.name }</td>
                    <td>${attendance.kind }</td>
                    <td>${attendance.sn}</td>
                    <td>${attendance.architecturalname}</td>
                    <td>${attendance.func}</td>
                    <td><fmt:formatDate value="${attendance.lastConnTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                    <td>
                        <a href="${ctx}/attendanceEquipment/detail?id=${attendance.id}" class="edit_link">[详情]</a>
                        <a href="${ctx}/attendanceEquipment/addList?id=${attendance.id}" class="edit_link">[编辑]</a>
                        <a href="#delcfmModel" name="${attendance.id}" data-toggle="modal" class="remove_link">[删除]</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}"
                     formId="query_form"/>
    </div>
</div>

<!--删除成功对话框-->
<div class="modal" id="area_delSuc" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title mark_info">提示信息</h4>
            </div>
            <div class="modal-suc">
                <p>删除成功！</p>
            </div>
            <div class="modal-footer foot_md">
                <input type="hidden" id="url"/>
                <a class="btn btn-success"  onclick="sureSuc()">确定</a>
            </div>
        </div>
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
</body>
</html>

