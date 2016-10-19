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
        $(function() {
            //表单验证
            $("#add_form").validate({
                rules: {
                    constructionname: {
                        required: true,
                        minlength: 2
                    }
                },
                messages: {
                    constructionname: {
                        required: "<span class='red'>施工单位必填</span>",
                        minlength: "<span class='red'>至少2个字符</span>"
                    }

                }
            });
        });

    </script>
</head>
<body>
<div class="cont_txt">
    <p class="MUsers">系统设置-施工单位</p>

    <div class="tab_head">
        <ul>
        </ul>
    </div>
    <!--嵌套-->
    <div class="container col-sm-8" style="margin-top:20px;">

        <form   id="add_form" class="form-horizontal" id="add_form" action="${ctx}/construction/insert?id=${constructionEntity.id}"  method="post"  role="form" >
            <div class="form-group">
                <label class="col-sm-2 control-label"><span class="red">* </span>施工单位:</label>
                <div class="col-sm-5">
                    <input type="text" name="constructionname" id="constructionname" class="form-control" value="${constructionEntity.constructionname}"  placeholder=""/>
                </div>
            </div>


            <div class="form-group">
                <label for="inputPassword2"  class="col-sm-2 control-label">描&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp述:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="description" name="description" value="${constructionEntity.description}" placeholder=""  id="inputPassword2" >
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
