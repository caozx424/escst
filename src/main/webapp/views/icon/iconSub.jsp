<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>图标管理录入/编辑页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/static/js/validation/menuSub.js"></script>

    <style>
        .red{color: red;}
        .validform_checktip {
            margin-left: 8px;
            line-height: 20px;
            height: 20px;
            overflow: hidden;
            color: #999;
            font-size: 12px;
        }
        a.l-btn span span.l-btn-icon-left {
            padding: 0 0 0 20px;
            background-position: left center;
        }
        a.l-btn-plain, a.l-btn-plain span.l-btn-left {
            background: transparent;
            border: 0;
            filter: none;
        }
    </style>

    <script>
        $(function(){
            //表单验证
            $("#add_form").validate({
                rules:{
                    iconName:{
                        required:true,
                        minlength:2
                    },
                },
                messages: {
                    iconName: {
                        required:"<span class='red'>图标名称必填</span>",
                        minlength:"<span class='red'>至少2个字符</span>"
                    },
                }
            });
            //给图标名称文本框注册失去焦点事件
            $("#iconName").blur(function(){
                var iconName = $(this).val();
                if(iconName==""){
                    alert("图标名称不能为空！");
                    return;
                }
            });
        });
        // 返回到图标管理主页面
        function pageBack(){
            location.href = "${ctx}/icon/iconList";
        }
    </script>
</head>
<body>
<div class="cont_txt">
    <p class="MUsers">系统管理-图标管理</p>

    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/icon/iconSub">
					<span>${titleName}</span>
                </a>
            </li>
        </ul>
    </div>
    <!--嵌套-->
    <div class="container col-sm-8" style="margin-top:20px;">
        <form class="form-horizontal" id="add_form" role="form" action="${ctx}/icon/save" method="post" enctype="multipart/form-data">
            <input type="hidden" id="id" name="id" value="${iconEntity.id}"/>
            <%--图标样式--%>
            <input type="hidden" id="iconclas" name="iconclas" value="${iconEntity.iconclas }"/>
            <%--图标Path--%>
            <input type="hidden" id="path" name="path" value="${iconEntity.path}"/>
            <%--类型  png--%>
            <input type="hidden" id="extend" name="extend" value="${iconEntity.extend}"/>
            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>图标名称：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="iconName" name="name" value="${iconEntity.name}" placeholder="图标名称">
                    <label>名称范围2~10位字符,且不为空</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>图标类型：</label>
                <div class="col-sm-5">
                    <select class="form-control" name="type" id="typeId">
                        <c:forEach items="${typeList}" var="type">
                            <c:if test="${iconEntity.type eq type.code}">
                                <option id="${type.code}" value="${type.code}" selected>${type.name}</option>
                            </c:if>
                            <c:if test="${iconEntity.type ne type.code}">
                                <option id="${type.code}" value="${type.code}">${type.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input class="btn" style="background-color: whitesmoke;" type="file" name="file">
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
</div>
</div>
</div>
</body>
