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
    <title>角色管理</title>
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
        tr td:nth-of-type(2){width:20%;}
        tr td:nth-of-type(3){width:15%;}
        tr td:nth-of-type(4){width:15%;}
        tr td:nth-of-type(5){width:15%;}
        tr td:nth-of-type(6){width:15%;}
        tr td:nth-of-type(7){width:15%;}
        #tab input{display:none; border:1px solid #000;}
    </style>
    <script>
        //重置
        function reset(){
            $("#query_form")[0].reset();
            $("#myform").attr("value","");
        }

        var setting = {
            view: {
                dblClickExpand: false,
                showLine: false,
                selectedMulti: false
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable:true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: ""
                }
            },
            callback: {
                beforeClick: function(treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                    if (treeNode.isParent) {
                        zTree.expandNode(treeNode);
                        return false;
                    } else {
                        return true;
                    }
                }
            }
        };

        $(function(){
            //删除
            $(".remove_link").click(function(){
                var id = $(this).attr("name");
                $("#roleId").val(id);
            });

            $("#remove_confirm").click(function(){
               var roleId = $("#roleId").val();
                var data = {"id":roleId};
                var url = "${ctx}/role/delete";
                $.post(url,data,function(msg){
                    if(msg=="success"){
                        alert("删除成功！");
                        window.location.href = "${ctx}/role/list";
                    }
                });
            });

            /*权限设置*/
            $(".auth_link").on("click",function(){
                $("#tree").html("");
                $("#zhezhao_div").css("display","block");
                $(".menu_list").css("display","block");
                var id = $(this).attr("name");
                $("#roleId_hidden").val(id);
                var url = "${ctx}/role/setAuthority?id=" + id;
                $.post(url,function(data){
                    //alert(data);
                    data = eval("(" + data + ")");
                    var t = $("#tree");
                    t = $.fn.zTree.init(t, setting, data);
                    var treeObj = $.fn.zTree.getZTreeObj("tree");
                    treeObj.expandAll(true);
                });
            });

            //全选
            $("#all_check").click(function(){
                var treeObj = $.fn.zTree.getZTreeObj("tree");
                treeObj.checkAllNodes(true);
            });

            //重置权限菜单
            $("#reset").click(function(){
                $("#tree").html("");
                var roleId = $("#roleId_hidden").val();
                var url = "${ctx}/role/setAuthority?id=" + roleId;
                $.post(url,function(data){
                    //alert(data);
                    data = eval("(" + data + ")");
                    var t = $("#tree");
                    t = $.fn.zTree.init(t, setting, data);
                    var treeObj = $.fn.zTree.getZTreeObj("tree");
                    treeObj.expandAll(true);
                });
            });

            //确认保存权限
            $("#confirm_save").on('click',function(){
                var roleId = $("#roleId_hidden").val();
                //获取选择的nodes
                var treeObj = $.fn.zTree.getZTreeObj("tree");
                var nodes = treeObj.getCheckedNodes(true);
                var menuIds = [];
                if(nodes.length>0){
                    for(var i=0;i<nodes.length;i++){
                       var id = nodes[i].id;
                        menuIds.push(id);
                    }
                }
                var url = "${ctx}/role/updateAuthority?menuIds="+menuIds+"&roleId=" + roleId;
                $.post(url,function(data){
                   if(data=="success"){
                       alert("更新权限成功！");
                       window.location.href = "${ctx}/role/list";
                   }else{
                       alert(data);
                   }
                });
                $("#zhezhao_div").css("display","none");
                $(".menu_list").css("display","none");
            });

           $("#dex_m").on('click',function(){
                $("#zhezhao_div").css("display","none");
                $(".menu_list").css("display","none");
            });

        });
    </script>
</head>

<body>
<div class="zhezhao" id="zhezhao_div"></div>
<div class="cont_txt">
    <div class="tab_book">
        <div class="tab_head">
            <ul>
                <li><a href="${ctx}/role/toupdate?id=0"><img src="${ctx}/resources/static/images/plus_03.png" /><span>角色录入</span></a></li>
            </ul>
        </div>
        <div class="form_message">
            <form method="post" id="query_form" action="${ctx}/role/list">
                <p>
                    <span>角色名称</span>&nbsp;:&nbsp;
                    <input type="text" name="role_name"  value="${rolename}"  class="input" id="myform"/>
                    <input class="btn-col" type="submit" value="查询" id="form1"/>
                    <input class="btn-col" type="button" onclick="reset();" value="重置" />
                </p>
            </form>
        </div>

        <c:if test="${empty page.vos}">
            <div>没有相关的数据</div>
        </c:if>
        <c:if test="${!empty page.vos}">
            <table class="table" id="tab">
                <tr class="th_color">
                    <th width="50px"></th>
                    <th>角色编码</th>
                    <th>角色名称</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.vos}" var="role" varStatus="status">
                    <tr>
                        <td>${(page.currentPage-1) * 10 + status.count}</td>
                        <td>${role.role_code}</td>
                        <td>${role.role_name}</td>
                        <td  id="${role.id}">
                            <a href="${ctx}/role/toupdate?id=${role.id}" title="点击编辑角色相关数据"  class="edit_link">编辑</a>
                            <a href="#user_edit" title="点击删除角色相关数据" name="${role.id}" data-toggle="modal" class="remove_link">删除</a>
                            <a href="javascript:void(-1);" title="点击给该角色赋权限"  name="${role.id}" class="auth_link">权限设置</a>
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
                <input type="hidden" id="roleId"/>
                <button type="button" class="btn btn-default arrow_left" data-dismiss="modal">取消</button>
                <a id="remove_confirm" class="btn btn-success" data-dismiss="modal">确定</a>
            </div>
        </div>
    </div>
</div>
<!--删除对话框-->

<!--菜单列表-->
<div class="menu_list">
    <h4><img src="${ctx}/resources/static/images/stylfo_03.png">权限设置<span id="dex_m"></span></h4>
    <div class="check_for">
        <div class="check_head">
            <h4><span>菜单列表</span></h4>
        </div>
        <div class="check_body" id="tree_form">
            <input type="hidden" id="roleId_hidden"/>
            <!--树形菜单-->
            <ul id="tree" class="ztree" style="width:260px; margin-left:10px; overflow:auto;"></ul>
            <!--树形菜单-->
        </div>
        <div class="check_foot">
            <p>
                <button id="all_check">全选</button>
                <button id="reset">重置</button>
                <button id="confirm_save">保存</button>
            </p>
        </div>
    </div>
</div>
<!--菜单列表-->

</html>