<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/xml; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>智慧工地大数据云服务平台</title>
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
                //alert(id);
                var url = "${ctx}/supervision/delete?id="+id;
//				alert(url);
                $.post(url,function(msg){
                    if(msg=="success"){
                        alert("删除成功！");
                        window.location.href = "${ctx}/supervision/list";
                    }
                });
            });

            //删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
            $(".resetpwd_link").click(function(){
                var id = $(this).attr("name");
                $("#resetpwd_id").val(id);
            });

            //删除确认
            $("#remove_confirm").click(function(){
                var id = $("#resetpwd_id").val();
                //alert(id);
                var url = "${ctx}/supervision/delete?id="+id;
//				alert(url);
                $.post(url,function(msg){
                    if(msg=="success"){
                        alert("删除成功！");
                        window.location.href = "${ctx}/supervision/list";
                    }
                });
            });

        });
    </script>

    <%--<style>--%>
        <%--tr td:nth-of-type(1){width:5%;}--%>
        <%--tr td:nth-of-type(2){width:15%;}--%>
        <%--tr td:nth-of-type(3){width:15%;}--%>
        <%--tr td:nth-of-type(4){width:15%;}--%>
        <%--tr td:nth-of-type(5){width:15%;}--%>
        <%--tr td:nth-of-type(6){width:15%;}--%>
        <%--tr td:nth-of-type(7){width:20%;}--%>
    <%--</style>--%>

</head>


<body>

<div class="cont_txt">
    <p class="MUsers">监理单位</p>

    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/supervision/editor"><img src="${ctx}/resources/static/images/plus_03.png" /><span>监理单位录入</span></a>
            <li>
        </ul>
    </div>

    <div class="form_message">
        <form method="post" action="${ctx}/supervision/list" id="query_form">
            <p>
                <span>单位名称</span>&nbsp;:&nbsp;<input type="text" name="supervisionname" value="${supervisionname}"/>
                <input class="btn-col" type="submit" value="查询" />
                <input class="btn-col" type="reset" onclick="res()" value="重置" />
            </p>
        </form>
    </div>

    <div class="mtab">
        <table class="table table-striped table-fixed-head" id="tab">
            <tr class="th_color">
                <th class="th_color">序号</th>
                <th class="th_color">单位名称</th>
                <th class="th_color">描述</th>
                <th class="th_color">操作</th>
            </tr>
            <c:forEach items="${page.vos}" var="supervision" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${supervision.supervisionname }</td>
                    <td>${supervision.description }</td>
                    <td id="${supervision.id}">
                        <a href="${ctx}/supervision/editor?id=${supervision.id}"  class="edit_link">编辑</a>
                        <a href="#delcfmModel" name="${supervision.id}" data-toggle="modal" class="remove_link">删除</a>
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
<script>
    function res(){
    $("#query_form")[0].reset();
    $("input[name=supervisionname]").attr("value","");
    }
</script>
</body>
</html>

