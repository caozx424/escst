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
                        alert("删除成功！");
                        window.location.href = "${ctx}/attendanceEquipment/list";
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


    <%--<style>--%>
    <%--tr th:nth-of-type(1){width:2%;}--%>
    <%--tr th:nth-of-type(2){width:8%;}--%>
    <%--tr th:nth-of-type(3){width:8%;}--%>
    <%--tr th:nth-of-type(4){width:8%;}--%>
    <%--tr th:nth-of-type(5){width:8%;}--%>
    <%--tr th:nth-of-type(6){width:8%;}--%>
    <%--tr th:nth-of-type(7){width:8%;}--%>
    <%--tr th:nth-of-type(8){width:8%}--%>
    <%--tr th:nth-of-type(9){width:8%}--%>
    <%--tr th:nth-of-type(10){width:8%}--%>
    <%--tr th:nth-of-type(11){width:8%}--%>
    <%--tr th:nth-of-type(12){width:8%}--%>
    <%--tr th:nth-of-type(13){width:10%}--%>
    <%--</style>--%>
</head>

<body>
<div class="cont_txt">
    <p class="MUsers">人员管理->设备任务</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/deviceTask/addList"><img src="/resources/static/images/plus_03.png"/><span>设备任务录入</span></a>
            <li>
        </ul>
    </div>


    <form method="post" id="query_form" action="${ctx}/deviceTask/list"></form>
    <div class="mtab">

<c:if test="${empty page.vos}">
    <div>没有相关的数据</div>
</c:if>
<c:if test="${!empty page.vos}">


<table class="table" id="tab" style="table-layout:fixed;">
            <tr class="th_color">
                <th width="5%">序号</th>
                <th width="8%">设备序列号</th>
                <th  width="30%" >要发送的数据</th>

                <th   width="30%">执行结果的详细信息</th>

                <th width="15%">执行时间</th>

                <th>操作人</th>

            </tr>

            <c:forEach items="${page.vos}" var="deviceTask" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${deviceTask.sn }</td>
                    <td style="word-wrap: break-word">${deviceTask.data }</td>
                    <td style="word-wrap: break-word">${deviceTask.resultDetail}</td>
                    <td><fmt:formatDate value="${deviceTask.returnTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${deviceTask.oprator}</td>

                </tr>
            </c:forEach>
        </table>

        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}"
                     formId="query_form"/>
</c:if>
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

