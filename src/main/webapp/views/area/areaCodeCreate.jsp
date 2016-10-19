<%--
  Created by IntelliJ IDEA.
  User: zcf
  Date: 2016/9/8
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>区域管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/tree/demo.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/tree/zTreeStyle/zTreeStyle.css" rel="stylesheet">

    <script type="text/javascript" src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/validation/areaCode.js"></script>

    <script type="text/javascript" src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/tree/jquery.ztree.core.js"></script>
    <style>
        .Tabform ul {
            background: #F0F6E4;
        }
        .red{color: red;}
    </style>
    <script type="application/javascript">
        function pageBack(){
            location.href = "${ctx}/area/view";
        }

        var setting = {
            view:{showLine:false},
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onDblClick: onDblClick
            }
        };

        function onDblClick(event, treeId, treeNode, clickFlag) {
            $("#parentName").val(treeNode.name);
            $("#parentId").val(treeNode.id);
            var level = treeNode.areaLevel + 1;
            $("#areaLevel").val(level);
            $("#zhezhao1").css("display","none");
            $(".list_menul").css("display","none");
        }

        $(document).ready(function(){
            addAreaValidation.init('${ctx}');

            $.ajax({
                url:"${ctx}/area/checkArea",
                success:function(data){
                    $.fn.zTree.init($("#treeDemo"), setting,data);
                }
            });

        });

        function areaTree(){
            $("#zhezhao1").css("display","block");
            $(".list_menul").css("display","block");
            $("#dex_m").on('click',function(){
                $("#zhezhao1").css("display","none");
                $(".list_menul").css("display","none");
            })
        }

    </script>
</head>
<body>
    <div class="zhezhao" id="zhezhao1"></div>
    <div class="cont_txt">
        <p class="MUsers">区域管理->区域新增</p>
        <div class="tab_head">
            <ul>
            </ul>
        </div>
        <!--嵌套-->
        <div class="container col-sm-8" style="margin-top:20px;">
            <form id="addAreaForm" class="form-horizontal" role="form" action="${ctx}/area/save">
                <input type="hidden" id="areaLevel" method="post" name="areaLevel"/>
                <div class="form-group">
                    <label for="areaName" class="col-sm-2 control-label"><span class="red">* </span>区域名称:</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="areaName" id="areaName">
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="areaCode" class="col-sm-2 control-label"><span class="red">* </span>区域编码:</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="areaCode" name="areaCode">
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="parentId" class="col-sm-2 control-label"><span class="red">* </span>父节点:</label>
                    <div class="col-sm-5">
                        <input class="form-control" id="parentName" onclick="areaTree()" value="">
                        <span class="help-inline"></span>
                        <input id="parentId" name="parentId" style="display: none;" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="areaSort" class="col-sm-2 control-label"><span class="red">* </span>显示顺序:</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="areaSort" name="areaSort">
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">保存</button>
                        <button type="button" class="btn btn-primary" onclick="pageBack()">取消</button>
                    </div>
                </div>

            </form>
        </div>

        <!--区域列表-->
        <div class="list_menul" id="am">
            <h4>区域列表<span id="dex_m"></span></h4>
            <div class="check_for">
                <ul id="treeDemo" class="ztree" style="margin-top:1px;width:100%;height:400px;overflow:auto;background-color: #F0F6E4;"></ul>
            </div>
        </div>
        <!--区域列表-->
    </div>
</body>
</html>


