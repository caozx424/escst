<%--
  Created by IntelliJ IDEA.
  User: zcf
  Date: 2016/9/8
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>区域管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">

    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <style>
        .th_color{background-color: #4092e8}
    </style>
    <script type="application/javascript">
        function edit(areaId){
            location.href = "${ctx}/area/update?areaId="+areaId;
        }

        $(function(){
            //删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
            $(".remove_link").click(function(){
                var id = $(this).attr("name");
                $("#remove_id").val(id);
            });

            //删除确认
            $("#remove_confirm").click(function(){
                var id = $("#remove_id").val();
                var url = "${ctx}/area/delete?areaId="+id;
                $.post(url,function(msg){
                    if(msg == true){
                        $("#area_delSuc").css("display","block");
                    }
                });
            });

        });

        function sureSuc(){
            $("#area_delSuc").css("display","none");
            window.location.href= "${ctx}/area/view";
        }
    </script>
</head>
<body>
    <div class="cont_txt">
        <p class="MUsers">区域管理</p>
        <div class="tab_head">
            <ul>
                <li><a style="color:white" href="${ctx}/area/create"><img src="${ctx}/resources/static/images/plus_03.png" /><span>新增区域</span></a></li>
            </ul>
        </div>
    </div>
    <div class="form_message">
        <form method="post" id="query_form" action="${ctx}/area/view">
        </form>
    </div>
    <div class="mtab">
        <table  class="table table-striped table-fixed-head" id="tab">
            <tr class="th_color">
                <th class="th_color">序号</th>
                <th class="th_color">地域名称</th>
                <th class="th_color">区域码</th>
                <th class="th_color">操作</th>
            </tr>
            <c:if test="${!empty page.vos}">
                <c:forEach items="${page.vos}" var="areaCode" varStatus="status">
                    <tr>
                        <td>${(page.currentPage-1) * 10 + status.count}</td>
                        <td>${areaCode.areaName}</td>
                        <td>${areaCode.areaCode}</td>
                        <td>
                            <a href="javascript:void(-1);" class="edit_link" onclick="edit('${areaCode.id}')">编辑</a>
                            <a href="#delcfmModel" name="${areaCode.id}" data-toggle="modal" class="remove_link">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
    </div>
    <!--删除对话框-->
    <div class="modal fade container" id="delcfmModel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                    <h4 class="modal-title mark_info">提示信息</h4>
                </div>
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
    <div class="modal" id="area_delSuc" style="display:none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title mark_info">提示信息</h4>
                </div>
                <div class="modal-suc">
                    <p>区域删除成功！</p>
                </div>
                <div class="modal-footer foot_md">
                    <input type="hidden" id="url"/>
                    <a class="btn btn-success"  onclick="sureSuc()">确定</a>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="list_menul" id="area_delSuc">--%>
        <%--<h4>提示信息<span id="dex_m"></span></h4>--%>
        <%--<div class="check_for">--%>
            <%--<div class="check_body modal-suc">--%>
                <%--<p>区域删除成功！</p>--%>
            <%--</div>--%>
            <%--<div class="check_foot">--%>
                <%--<p><button>全选</button><button>重置</button><button id="seva">保存</button></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</body>
</html>
