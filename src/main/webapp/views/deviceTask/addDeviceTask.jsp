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
    <title>图标管理录入/编辑页面</title>
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
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



    <script type="text/javascript">
        $(function() {
            $("#cmd").change(function(){
                var obj = document.getElementById("cmd"); //定位id
                var index = obj.selectedIndex; // 选中索引
                var value = obj.options[index].value;
                if(value == "0x1E"){
                    document.getElementById("trState").style.display = "";
                }else{
                    document.getElementById("trState").style.display = "none";
                }
            });
        });
    </script>
</head>
<body>
<div class="cont_txt">
    <p class="MUsers">人员管理-设备任务录入</p>

    <div class="tab_head">
        <ul>
            <li>

            </li>
        </ul>
    </div>
    <!--嵌套-->
    <div class="container col-sm-8" style="margin-top:20px;">
        <form class="form-horizontal" id="add_form" role="form" action="${ctx}/deviceTask/save" method="post"
              enctype="multipart/form-data">

            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red"> </span>设备任务:</label>
                <div class="col-sm-5">
                    <select class="form-control"  name="sn" id="sn" >
                        <c:forEach items="${bkAttendanceEquipment}" var="device">

                            <option value="${device.sn}">
                                    ${device.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red"> </span>任务选择:</label>
                <div class="col-sm-5">
                    <select  class="form-control" name="cmd" id="cmd">
                        <option value="">---请选择---</option>
                        <option value="0x1E">设置设备状态</option>
                        <option value="0x12">设置设备时间</option>
                        <option value="0x15">下发人员信息</option>
                        <option value="0x1B">设备重启</option>
                    </select>
                </div>
            </div>



            <div class="form-group"  id = "trState"  style="display: none" >
                <label class="col-sm-2 control-label"><span class="red"> </span>设备状态:</label>
                <div class="col-sm-5">
                    <select  class="form-control" name="state"  id="state">
                        <option value="0">---请选择---</option>
                        <option value="0x01">识别状态</option>
                        <option value="0x02">停止状态</option>
                        <option value="0x03">注册中</option>
                        <option value="0x04">注册成功</option>
                        <option value="0x05">注册失败</option>
                        <option value="0x06">正在加载数据</option>
                        <option value="0x07">设备正在手动操作中</option>
                        <option value="0x08">正在测试中</option>
                        <option value="0x09">设备故障中</option>
                        <option value="0x00">未知状态</option>
                    </select>
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
</div>
</div>
</div>
</body>
