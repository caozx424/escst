<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>菜单管理录入/编辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/tree/demo.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/tree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/tree/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/validation/menuSub.js"></script>
    <%--<script type="text/javascript" src="${ctx}/resources/static/js/menu/menu.js"></script>--%>

    <style>
        .Tabform ul {
            background: #F0F6E4;
        }
        .red{color: red;}
    </style>

    <script type="application/javascript">
        // 返回到菜单管理主页面
        function pageBack(){
            location.href = "${ctx}/menu/menuList";
        }

        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            },
            // 解决树形菜单无法向下扩展的问题
            view:{showLine:false},
            callback: {
                onDblClick: onDblClick
            }
        };

        function onDblClick(event, treeId, treeNode, clickFlag) {
            $("#parentMenuName").val(treeNode.name);
            $("#parentMenuId").val(treeNode.id);
            var level = treeNode.menuLevel + 1;
            $("#menuLevel").val(level);
            $("#zhezhao1").css("display","none");
            $(".list_menul").css("display","none");
        }

        $(document).ready(function(){
            menuSubValidation.init('${ctx}');

            $.ajax({
                url:"${ctx}/menu/treeMenu",
                success:function(data){
                    $.fn.zTree.init($("#treeDemo"), setting,data);
                }
            });
        });

        function menuTree(){
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
    <p class="MUsers">系统管理-菜单管理</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/menu/menuSub">
                    <span>${titleName}</span>
                </a>
            </li>
        </ul>
    </div>
    <!--嵌套-->
    <div class="container col-sm-8" style="margin-top:20px;">
        <form id="menuSubForm" class="form-horizontal" method="post" role="form" action="${ctx}/menu/save">
                <input type="hidden" id="id" name="id" value="${menuEntity.id}"/>
            <div class="form-group">
                <label for="menuName" class="col-sm-2 control-label"><span class="red">* </span>菜单名称：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="menuName" id="menuName" value="${menuEntity.menuName}">
                    <span class="help-inline"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单等级：</label>
                <div class="col-sm-5">
                    <select class="form-control" name="menuLevel" id="menuLevel" datatype="*">
                        <option value="0" <c:if test="${menuEntity.menuLevel eq 0}">selected="selected"</c:if>>一级菜单</option>
                        <option value="1" <c:if test="${menuEntity.menuLevel > 0}">selected="selected"</c:if>>下级菜单</option>
                    </select>
                    <span class="help-inline"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="parentMenuId" class="col-sm-2 control-label"><span class="red">* </span>父菜单：</label>
                <div class="col-sm-5">
                    <input class="form-control" id="parentMenuName" onclick="menuTree()" value="">
                    <span class="help-inline"></span>
                    <input id="parentMenuId" name="parentMenuId" style="display: none;" value="">
                </div>
            </div>
            <div class="form-group">
                <label for="menuUrl" class="col-sm-2 control-label">菜单地址：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="menuUrl" name="menuUrl" value="${menuEntity.menuUrl}">
                    <span class="help-inline"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">图标名称：</label>
                <div class="col-sm-5">
                    <select class="form-control" name="iconid" id="iconid">
                        <c:forEach items="${iconList}" var="iconEntity">
                            <c:if test="${menuEntity.iconid eq iconEntity.id}">
                                <option id="${iconEntity.id}" value="${iconEntity.id}" selected>${iconEntity.name}</option>
                            </c:if>
                            <c:if test="${menuEntity.iconid ne iconEntity.id}">
                                <option id="${iconEntity.id}" value="${iconEntity.id}">${iconEntity.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <span class="help-inline"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="menuOrder" class="col-sm-2 control-label"><span class="red">* </span>菜单顺序：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="menuOrder" name="menuOrder" value="${menuEntity.menuOrder}">
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
</div>

<!--菜单列表-->
<div class="list_menul" id="am">
    <h4>菜单列表<span id="dex_m"></span></h4>
    <div class="check_for">
        <ul id="treeDemo" class="ztree" style="margin-top:1px;width:100%;height:400px;overflow:auto;background-color: #F0F6E4;"></ul>
    </div>
</div>
<!--菜单列表-->

</body>
</html>