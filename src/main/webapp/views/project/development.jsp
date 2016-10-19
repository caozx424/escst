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
    <title>建设单位</title>
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">

    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/page.css" rel="stylesheet">
    <script src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <style>
        @import url("/resources/static/css/madiel.css");
    </style>

    <style>
        tr td:nth-of-type(1){width:5%;}
        tr td:nth-of-type(2){width:20%;}
        tr td:nth-of-type(3){width:15%;}
        tr td:nth-of-type(4){width:15%;}
        tr td:nth-of-type(5){width:15%;}
        tr td:nth-of-type(6){width:15%;}
        tr td:nth-of-type(7){width:15%;}
        #tab input{display:none; border:1px solid #000;}
    </style>

    <script type="text/javascript" src="${ctx}/resources/static/js/type/type.js"></script>

</head>

<body>
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

<div class="cont_txt">
    <p class="MUsers">建设单位</p>
    <div class="tab_book">

        <div class="tab_head">
            <ul>
                <li> <a href="${ctx}/development/addList"  style="color: inherit"><img src="${ctx}/resources/static/images/plus_03.png"  /><span >建设单位录入</span></a></li>
            </ul>
        </div>

        <div class="form_message">
            <form method="post" id="query_form" action="${ctx}/development/list">
                <p>
                    <span>建设单位</span>&nbsp;:&nbsp;<input id="deve" type="text" name="developmentname"   value="${developmentname}" />

                    <input class="btn-col" type="submit" value="查询" />
                    <input class="btn-col" type="button" value="重置"  onclick="res()"/>
                </p>
            </form>
        </div>

        <c:if test="${empty page.vos}">
            <div>没有相关的数据</div>
        </c:if>
        <c:if test="${!empty page.vos}">
            <table class="table  table-striped" id="tab">
                <tr >
                    <th width="50px"  class="th_color">序号</th>
                    <th  class="th_color">建设单位</th>
                    <th  class="th_color">描述</th>
                    <th class="th_color">操作</th>
                </tr>
                <c:forEach items="${page.vos}" var="development" varStatus="status">
                    <tr>
                        <td>${(page.currentPage-1) * 10 + status.count}</td>
                        <td>${development.developmentname }</td>
                        <td>${development.description }</td>
                        <td  id="${development.id}">
                            <a href="${ctx}/development/addList?id=${development.id}"  title="点击编辑数据字典相关数据"   class="edit_link">编辑</a>
                            <a  href="#delcfmModel"  name="${development.id}"  data-toggle="modal"   class="remove_link">删除</a>
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
</html>

<script>
    $(function(){
        //删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
        $(".remove_link").click(function(){
            var id = $(this).attr("name");

            $("#remove_id").val(id);
        });

        //删除确认
        $("#remove_confirm").click(function(){
            var id = $("#remove_id").val();

            var url = "${ctx}/development/delet?id="+id;
//				alert(url);
            $.post(url,function(msg){
                if(msg=="success"){
                    $("#area_delSuc").css("display","block");

                }
            });
        });

    });




function  res(){
    $("#query_form")[0].reset();
    $("input[name=developmentname]").attr("value","");
}

    function sureSuc(){
        $("#area_delSuc").css("display","none");
        window.location.href = "${ctx}/development/list";
    }
</script>