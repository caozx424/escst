<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目录入</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">

    <%--<link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <script type="text/javascript">

        function sureSuc() {
            $("#area_delSuc").css("display", "none");
            window.location.href = "${ctx}/architectural/list";
        }
        $(function () {
            //删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
            $(".remove_link").click(function () {
                var id = $(this).attr("name");
                $("#remove_id").val(id);
            });

            //删除确认
            $("#remove_confirm").click(function () {
                var id = $("#remove_id").val();
                //  alert(id);
                var url = "${ctx}/architectural/delete?id=" + id;
//				alert(url);
                $.post(url, function (msg) {
                    if (msg == "success") {
                        $("#area_delSuc").css("display", "block");
                    }
                });
            });


        });
    </script>


</head>

<body>
<div class="cont_txt">
    <p class="MUsers">项目管理->项目维护</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/architectural/addList"><img
                        src="/resources/static/images/plus_03.png"/><span>项目录入</span></a>
            <li>
        </ul>
    </div>

    <div style="margin-top:25px; border-bottom:1px solid #d2d2d2;">
        <form class="form-horizontal" role="form" id="query_form" action="${ctx}/architectural/list" method="post">
            <fieldset>

                <div class="form-group">

                    <label class="col-md-1 control-label">项目名称:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="architecturalname"
                               value="${architecturalEntity.architecturalname}" name="architecturalname" type="text"
                               placeholder="项目名称"/>
                    </div>


                    <label class="col-md-2 control-label">建设单位:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="developmentname"
                               value="${architecturalEntity.developmentname}" name="developmentname" type="text"
                               placeholder="建设单位名称"/>
                    </div>

                </div>

                <div class="form-group">
                    <label class="col-md-1 control-label">施工单位:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="constructionname"
                               value="${architecturalEntity.constructionname}" name="constructionname" type="text"
                               placeholder="施工单位名称"/>

                    </div>
                    <label class="col-md-2 control-label">监理单位:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="supervisionname" name="supervisionname"
                               value="${architecturalEntity.supervisionname}" type="text" placeholder="监理单位名称"/>
                    </div>

                </div>


                <div class="form-group">
                    <label class="col-md-1 control-label">地区:</label>
                    <div class="col-md-2">
                        <select class="form-control" id="pro" name="belongProvince">
                            <option value="0">请选择</option>
                            <c:forEach items="${areaCodeEntities}" var="areaCode">
                                <option value=${areaCode.id}>${areaCode.areaName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <select class="form-control" id="city" name="belongCity">
                            <option value="0">请选择</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <select class="form-control" id="area" name="belongArea">
                            <option value="0">请选择</option>
                        </select>
                    </div>

                    <div class="col-md-2 text-right">
                        <button type="submit" class="btn btn-info">查询</button>
                        <button type="button" class="btn btn-info" onclick="res()">重置</button>
                    </div>

                </div>


            </fieldset>

        </form>
    </div>


    <div class="mtab">
        <table class="table table-bordered table-striped">
            <tr class="th_color">
                <td class="th_color">序号</td>
                <td class="th_color">项目名称</td>
                <td class="th_color">市</td>
                <td class="th_color">区</td>
                <td class="th_color">开始时间</td>
                <td class="th_color">结束时间</td>
                <td class="th_color">建设单位</td>
                <td class="th_color">施工单位</td>
                <td class="th_color">监理单位</td>
                <td class="th_color">操作</td>
            </tr>
            <tr>
                <c:forEach items="${page.vos}" var="architectural" varStatus="status">
            <tr>
                <td>${(page.currentPage-1) * 10 + status.count}</td>
                <td>${architectural.architecturalname }</td>
                <td>${architectural.belongCityName}</td>
                <td>${architectural.belongAreaName}</td>
                <td><fmt:formatDate value="${architectural.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${architectural.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${architectural.developmentname}</td>
                <td>${architectural.constructionname}</td>
                <td>${architectural.supervisionname}</td>
                <td>
                    <a href="#" title="点击编辑数据字典相关数据"
                       class="edit_link">编辑</a>
                    <a href="#item_list" data-toggle="modal" name="${architectural.id}" class="remove_link">删除</a>
                </td>
            </tr>
            </c:forEach>
        </table>

        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}"
                     formId="query_form"/>
    </div>
</div>

<!--删除成功对话框-->
<div class="modal " id="area_delSuc" style="display:none;">
    <div>
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title mark_info">提示信息</h4>
            </div>

            <div class="modal-suc">
                <p>删除成功！</p>
            </div>

            <div class="modal-footer foot_md">
                <input type="hidden" id="url"/>
                <a class="btn btn-success" onclick="sureSuc()">确定</a>
            </div>

        </div>
    </div>
</div>
<!--删除对话框-->
<div class="modal fade container" id="item_list" style="display:none;">
    <div>
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x</span></button>
                <h4 class="modal-title mark_info">确认</h4>
            </div>

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
</body>
</html>
<script>
    function res() {
        $("#query_form")[0].reset();
        $("input[name=architecturalname]").attr("value", "");
        $("input[name=developmentname]").attr("value", "");
        $("input[name=constructionname]").attr("value", "");
        $("input[name=supervisionname]").attr("value", "");
    }
    $(function () {


        $("#pro").change(function () {
            var id = $(this).children('option:selected').attr("value");

            $.ajax({
                url: "${ctx}/architectural/findCity",
                data: {"id": id},
                dataType: "json",
                type: "post",
                success: function (data) {
                    $("#city").children().remove();
                    $("#city").append("<option value='0'>请选择</option>");
                    for (var i = 0; i < data.length; i++) {

                        $("#city").append("<option value=" + data[i].id + ">" + data[i].areaName + "</option>");
                    }
                }

            })
        })


        $("#city").change(function () {
            var id = $(this).children('option:selected').attr("value");

            $.ajax({
                url: "${ctx}/architectural/findCity",
                data: {"id": id},
                dataType: "json",
                type: "post",
                success: function (data) {
                    $("#area").children().remove();
                    $("#area").append("<option value='0' >请选择</option>");
                    for (var i = 0; i < data.length; i++) {

                        $("#area").append("<option value=" + data[i].id + ">" + data[i].areaName + "</option>");
                    }
                }

            })
        })


    })
</script>

