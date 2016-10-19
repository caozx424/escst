<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="U-XA-Compatible" content="IE=9"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>上下班记录</title>
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/tree/demo.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/tree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <script src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/tree/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/tree/jquery.ztree.excheck.js"></script>

    <style>
        @import url("/resources/static/css/madiel.css");
    </style>

    <style>
        tr td:nth-of-type(1){width:5%;}
        tr td:nth-of-type(2){width:10%;}
        tr td:nth-of-type(3){width:10%;}
        tr td:nth-of-type(4){width:10%;}
        tr td:nth-of-type(5){width:10%;}
        tr td:nth-of-type(6){width:10%;}
        tr td:nth-of-type(7){width:10%;}
        tr td:nth-of-type(7){width:10%;}
        tr td:nth-of-type(7){width:10%;}
        tr td:nth-of-type(7){width:10%;}
        #tab input{display:none; border:1px solid #000;}
    </style>
    <script>
        $(function(){
            //删除
            $(".remove_link").click(function(){
                var id = $(this).attr("name");
                $("#id").val(id);
            });
            $("#remove_confirm").click(function(){
                var id = $("#id").val();
                var data = {"id":id};
                var url = "${ctx}/peopletime/delete";
                $.post(url,data,function(msg){
                    if(msg=="success"){
                        alert("删除成功！");
                        window.location.href = "${ctx}/peopletime/list";
                    }
                });
            });
        });
    </script>
</head>

<body>
<div class="zhezhao" id="zhezhao_div"></div>
<div class="cont_txt">
    <p class="MUsers">人员管理->上下班时间管理</p>
    <div class="tab_book">
        <div class="tab_head">
            <ul>
                <li><a href="${ctx}/peopletime/toupdate?id=0"><img src="/resources/static/images/plus_03.png" /><span>录入</span></a></li>
            </ul>
        </div>
        <div>
            <form method="post" id="query_form" action="${ctx}/peopletime/list">
            </form>
        </div>

        <c:if test="${empty page.vos}">
            <div>没有相关的数据</div>
        </c:if>
        <c:if test="${!empty page.vos}">
            <table class="table" id="tab">
                <tr class="th_color">
                    <th >序号</th>
                    <th >项目名称</th>
                    <th>上午上班时间</th>
                    <th>上午下班时间</th>
                    <th>下午上班时间</th>
                    <th>下午下班时间</th>
                    <th>加班开始时间</th>
                    <th>到场提醒(小时)</th>
                    <th>午休时间(小时)</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.vos}" var="people" varStatus="status">
                    <tr>
                        <td>${(page.currentPage-1) * 10 + status.count}</td>
                        <td>${people.architecturalname}</td>
                        <td>${people.amup}</td>
                        <td>${people.amdown}</td>
                        <td>${people.pmup}</td>
                        <td>${people.pmdown}</td>
                        <td>${people.overStartTime}</td>
                        <td>${people.warnTime}</td>
                        <td>${people.noontimeRest}</td>
                        <td>
                            <a href="${ctx}/peopletime/toupdate?id=${people.id}" title="点击编辑角色相关数据"  class="edit_link">编辑</a>
                            <a href="#user_edit" title="点击删除角色相关数据" name="${people.id}" data-toggle="modal" class="remove_link">删除</a>

                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${!empty page.vos}">
            <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
        </c:if>

    </div>
</div>

</body>

<!--删除对话框-->
<div class="modal fade container" id="user_edit" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                <h4 class="modal-title mark_info">确认</h4>
            </div>
            <div class="modal-body">
                <p>确认删除该条记录？</p>
            </div>
            <div class="modal-footer foot_md">
                <input type="hidden" id="id"/>
                <button type="button" class="btn btn-default arrow_left" data-dismiss="modal">取消</button>
                <a id="remove_confirm" class="btn btn-success" data-dismiss="modal">确定</a>
            </div>
        </div>
    </div>
</div>



</html>