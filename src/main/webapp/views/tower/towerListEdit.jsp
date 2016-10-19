<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="U-XA-Compatible" content="IE=9"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>智慧工地大数据云服务平台</title>
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>--%>
    <script src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript"
            src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script src="${ctx}/resources/static/js/Calendar.js"></script>
    <style>
        .red {
            color: red;
        }

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
        $(function () {
            //表单验证
            $("#add_form").validate({
                rules: {
                    towercraneno: {
                        required: true

                    },
                    location: {
                        required: true
                    },
                    maintenance: {
                        required: true
                    },
                    brand: {
                        required: true
                    },
                    modelversion: {
                        required: true
                    }, factorydate: {
                        required: true
                    }, checkdate: {
                        required: true
                    }


                },
                messages: {
                    towercraneno: {
                        required: "<span class='red'>请填写塔吊编号</span>",

                    }, location: {
                        required: "<span class='red'>请填写安装位置</span>",
                    }, maintenance: {
                        required: "<span class='red'>请填写维护人</span>",
                    },
                    brand: {
                        required: "<span class='red'>请填写品牌</span>",
                    },
                    modelversion: {
                        required: "<span class='red'>请填写型号</span>",
                    }, factorydate: {
                        required: "<span class='red'>请填写出厂日期</span>",
                    }, checkdate: {
                        required: "<span class='red'>请填写审核日期</span>",
                    }

                }
            });
        });

    </script>
</head>
<body>
<div class="cont_txt">
    <p class="MUsers">设备监控-塔吊管理</p>

    <div class="tab_head">
        <ul>
        </ul>
    </div>
    <!--嵌套-->
    <div class="container col-sm-8" style="margin-top:20px;">

        <form id="add_form" class="form-horizontal" id="add_form"
              action="${ctx}/towerList/save" method="post" role="form">
            <input type="hidden" name="id" value="${towerListEntity.id}"/>
            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>塔吊编号:</label>
                <div class="col-sm-5">
                    <input type="text" name="towercraneno" id="towercraneno" class="form-control"
                           value="${towerListEntity.towercraneno}" placeholder=""/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>安装位置:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="location" name="location"
                           value="${towerListEntity.location}" placeholder="">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>维护人&nbsp:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="maintenance" name="maintenance"
                           value="${towerListEntity.maintenance}" placeholder=""/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>品&nbsp&nbsp牌:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="brand" name="brand" value="${towerListEntity.brand}"
                           placeholder=""/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>型&nbsp&nbsp号:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="modelversion" name="modelversion"
                           value="${towerListEntity.modelversion}" placeholder=""/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>出厂日期:</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" id="factorydate" name="factorydate"
                           value="<fmt:formatDate  value="${towerListEntity.factorydate}" pattern="yyyy-MM-dd"/>"
                           onClick="new Calendar().show(this);" readonly/>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>审核日期:</label>
                <div class="col-sm-5">

                    <input class="form-control" type="text" id="checkdate" name="checkdate"
                           value="<fmt:formatDate  value="${towerListEntity.checkdate}" pattern="yyyy-MM-dd"/>"
                           onClick="new Calendar().show(this);" readonly/>

                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">保存</button>
                    <button type="button" class="btn btn-primary" onclick="history.back()">取消</button>
                </div>
            </div>

        </form>
    </div>
</div>


</body>
