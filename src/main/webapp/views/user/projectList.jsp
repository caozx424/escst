<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>添加所属项目</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">

    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(function () {
            //增加
            $(".add_link").click(function(){
                var id = $(this).attr("name");
                var projectname = $(this).attr("projectname");
                var userId = $("#userId").val();
                var url = "${ctx}/user/userprojectsadd"
                var data = {"isDefault":"no","userId":userId,"architecturalEntity.id":id}
                $.post(url,data,function(data){
                   if(data=="success"){
                       alert("添加项目：" + projectname + "成功！");
                       var url = "${ctx}/user/allprojects?userId="+userId;
//                       $("#add_perg #projectframe",parent.document).attr("src",url);
                       window.location.href = url;
                   }
                });
            });

            //增加默认
            $(".addDe_link").click(function(){
                var id = $(this).attr("name");
                var projectname = $(this).attr("projectname");
                var userId = $("#userId").val();
                var url = "${ctx}/user/userprojectsadd"
                var data = {"isDefault":"yes","userId":userId,"architecturalEntity.id":id}
                $.post(url,data,function(data){
                    if(data=="success"){
                        alert("添加项目：" + projectname + "成功！");
                        var url = "${ctx}/user/allprojects?userId="+userId;
                        window.location.href = url;
                    }
                });
            });

        });
    </script>
    <style>
        tr td:nth-of-type(1){width:5%;}
        tr td:nth-of-type(2){width:10%;}
        tr td:nth-of-type(3){width:6%;}
        tr td:nth-of-type(4){width:6%;}
        tr td:nth-of-type(5){width:6%;}
        tr td:nth-of-type(6){width:10%;}
        tr td:nth-of-type(7){width:10%;}
        tr td:nth-of-type(8){width:10%;}
        tr td:nth-of-type(9){width:10%;}
        tr td:nth-of-type(10){width:10%;}
        tr td:nth-of-type(11){width:10%;}
    </style>
</head>

<body>
<div class="cont_txt">
    <div class="tab_head">
        <ul>
            <li>
                <span>选择项目</span>
            <li>
        </ul>
    </div>

    <div style="margin-top:50px; border-bottom:1px solid #d2d2d2;">
        <form class="form-horizontal" role="form" id="query_form"  action="${ctx}/user/allprojects"  method="post">
            <input type="hidden" id="userId" name="userId" value="${userId}"/>

                <div class="form-group">

                    <label class="col-md-1 control-label" for="architecturalname">项目名称:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="architecturalname"  name="architecturalname" type="text" placeholder="项目名称"/>
                    </div>

                    <label class="col-md-2 control-label">建设单位:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="developmentname"  name="developmentname" type="text" placeholder="建设单位"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 control-label">施工单位:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="constructionname"  name="constructionname" type="text" placeholder="施工单位"/>
                    </div>
                    <label class="col-md-2 control-label" >监理单位:</label>
                    <div class="col-md-2">
                        <input class="form-control auto" id="supervisionname"  name="supervisionname" type="text" placeholder="监理单位"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 control-label">地区:</label>
                    <div class="col-md-2">
                        <select class="form-control" name="architecturalEntity.belongProvince" id="belongProvince">
                            <option value="0">-请选择-</option>
                            <c:forEach items="${provinceList}" var="province">
                                <option value="${province.id}">${province.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-2"  >
                        <select class="form-control" name="architecturalEntity.belongCity" id="belongCity">
                        </select>
                    </div>

                    <div class="col-md-2">
                        <select class="form-control" name="architecturalEntity.belongArea" id="belongArea">
                        </select>
                    </div>

                    <div class="col-md-2 text-right">
                        <button type="submit" class="btn btn-info">查询</button>
                        <button type="reset" class="btn btn-info">重置</button>
                    </div>
                </div>

        </form>
    </div>


    <div class="mtab">
        <table class="table table-bordered table-striped">
            <tr class="th_color">
                <td class="th_color">序号</td>
                <td class="th_color">项目名称</td>
                <td class="th_color">省</td>
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
                <td>${architectural.belongProvinceName }</td>
                <td>${architectural.belongCityName}</td>
                <td>${architectural.belongAreaName}</td>
                <td><fmt:formatDate value="${architectural.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${architectural.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${architectural.developmentname}</td>
                <td>${architectural.constructionname}</td>
                <td>${architectural.supervisionname}</td>

                <td>
                    <a href="#" title="点击添加该用户所属项目中" name="${architectural.id}" projectname="${architectural.architecturalname }" class="add_link">增加</a><br/>
                    <a href="#" title="点击添加到该用户默认项目中" name="${architectural.id}" projectname="${architectural.architecturalname }" class="addDefault_link">增加为默认</a>
                </td>
            </tr>
            </c:forEach>

        </table>
        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
    </div>
</div>
</body>
</html>

