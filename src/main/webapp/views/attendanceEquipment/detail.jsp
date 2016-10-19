<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="pager" uri="/pager-tags" %>
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


</head>
<body>
<div class="cont_txt">
    <p class="MUsers">人员管理-门禁设备详情</p>
    <div class="tab_head">
        <ul>
        </ul>
    </div>
    <!--嵌套-->
    <div class="container col-sm-8" style="margin-top:20px;">

        <form id="add_form" class="form-horizontal" id="add_form"
              action="${ctx}/attendanceEquipment/save?id=${attendanceEquipmentEntity.id}" method="post" role="form">
            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red"></span>设备名称:</label>
                <div class="col-sm-5">
                    <input type="text" name="name" id="name" class="form-control"
                           value="${attendanceEquipmentEntity.name}" placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">设备类型:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="kind" name="kind"
                           value="${attendanceEquipmentEntity.kind}" placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">ip:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="ip" name="ip" value="${attendanceEquipmentEntity.ip}"
                           placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">sn序列号:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="sn" name="sn" value="${attendanceEquipmentEntity.sn}"
                           placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">设备功能:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="func" name="func"
                           value="${attendanceEquipmentEntity.func}" placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">网关:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="gateway" name="gateway"
                           value="${attendanceEquipmentEntity.gateway}" placeholder="" disabled/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">子网掩码:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="mask" name="mask"
                           value="${attendanceEquipmentEntity.mask}" placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">是否启用dhcp:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="dhcp" name="dhcp"
                           value="${attendanceEquipmentEntity.dhcp}" placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">版本:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="version" name="version"
                           value="${attendanceEquipmentEntity.version}" placeholder="" disabled/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">连接状态:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="state" name="state"
                           value="${attendanceEquipmentEntity.state}" placeholder="" disabled/>
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">

                    <button type="button" class="btn btn-primary" onclick="history.back()">返回</button>
                </div>
            </div>

        </form>
    </div>
</div>


</body>
