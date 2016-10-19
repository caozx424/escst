<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="U-XA-Compatible" content="IE=9"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>智慧工地大数据云服务平台</title>
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>--%>
    <script src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script src="${ctx}/resources/static/js/My97DatePicker/WdatePicker.js"></script>
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
        function back(){
            window.location.href="${ctx}/peopletime/list";
        }
        $(function() {
            //表单验证
            $("#add_form").validate({
                rules: {
                    warnTime: {
                        required: true,
                        number:true

                    }
                },
                messages: {
                    warnTime: {
                        required: "<span class='red'>请输入合法的数字</span>",
                        number: "请输入合法的数字",
                    }

                },
                rules: {
                    noontimeRest: {
                        required: true,
                        number:true

                    }
                },
                messages: {
                    noontimeRest: {
                        required: "<span class='red'>请输入合法的数字</span>",
                        number: "请输入合法的数字",
                    }

                },

            });

        });

    </script>
</head>
<body>
<div class="cont_txt">
    <p class="MUsers">人员管理-上下班时间</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/peopletime/list">
					<span>
                            新增用户
					</span>
                </a>
            </li>
            <li>
        </ul>
    </div>
    <div class="container col-sm-8" style="margin-top:20px;">
        <form class="form-horizontal" id="add_form" action="${ctx}/peopletime/dosave"  method="post">

            <div class="form-group">
                <label  class="col-sm-2 control-label"><span class="red">* </span>上午上班时间:</label>
                <div class="col-sm-5">
                    <input type="text" name="amup" id="amup" class="form-control" onClick="WdatePicker({dateFmt:'HH:mm:ss',maxDate:$('#amdown').val()})"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><span class="red">* </span>上午下班时间:</label>
                <div class="col-sm-5">
                    <input type="text" name="amdown" id="amdown" class="form-control" onClick="WdatePicker({dateFmt:'HH:mm:ss',minDate:$('#amup').val()})"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><span class="red">* </span>下午上班时间:</label>
                <div class="col-sm-5">
                    <input type="text" name="pmup" id="pmup" class="form-control" onClick="WdatePicker({dateFmt:'HH:mm:ss',maxDate:$('#pmdown').val()})"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><span class="red">* </span>下午下班时间:</label>
                <div class="col-sm-5">
                    <input type="text" name="pmdown" id="pmdown" class="form-control" onClick="WdatePicker({dateFmt:'HH:mm:ss',minDate:$('#pmup').val()})"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><span class="red">* </span>加班开始时间:</label>
                <div class="col-sm-5">
                    <input type="text" name="overStartTime" id="overStartTime" class="form-control" onClick="WdatePicker({dateFmt:'HH:mm:ss'})"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><span class="red">* </span>到场提醒(小时):</label>
                <div class="col-sm-5">
                    <input type="text" name="warnTime" id="warnTime" class="form-control" /><span class="form-group">例如：到场时间为0.5，迟到半个小时就给该人员提醒到场</span>
                </div>
            </div>


            <div class="form-group">
                <label   class="col-sm-2 control-label"><span class="red">* </span>午休时间(小时):</label>
                <div class="col-sm-5">
                    <input type="text" name="noontimeRest" id="noontimeRest" class="form-control"/><span class="form-group">例如：午休时间为1.5</span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="保存"/>   `
                    <input type="button" class="btn btn-primary"  value="取消" onclick="back();">
                </div>
            </div>
        </form>
    </div>
</body>
</html>
