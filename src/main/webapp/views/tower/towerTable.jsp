<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/sea-modules/sea.js"></script>
    <style>
        @import url("${ctx}/resources/static/css/media.css");
    </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]> <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> <![endif]-->


<body>

<form action="${ctx}/tower/towerAlarmList"  method="post"  id="query_form"></form>

<div class="the_project">
    <table class="table table-bordered table-striped">
        <tr class="th_color">
            <td>序号</td>
            <td>工程项目</td>
            <td>运行时长</td>
            <td>回转角度</td>
            <td>幅度</td>
            <td>吊钩高度</td>
            <td>吊重</td>
            <td>力矩百分百</td>
            <td>安全吊重</td>
            <td>风速</td>
            <td>倾角</td>
            <td>掉绳倍率</td>
            <td>采集时间</td>
            <td>防护报警状态描述</td>
            <td>系统预警状态描述</td>
            <td>系统报警状态描述</td>
        </tr>
        <c:if test="${!empty page.vos}">
            <c:forEach items="${page.vos}" var="towerAlarm" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${towerAlarm.architecturalname}</td>
                    <td>${towerAlarm.runsecond}</td>
                    <td>${towerAlarm.angle}</td>
                    <td>${towerAlarm.radius}</td>
                    <td>${towerAlarm.height}</td>
                    <td>${towerAlarm.tdload}</td>
                    <td>${towerAlarm.tdpercent}</td>
                    <td>${towerAlarm.safeload}</td>
                    <td>${towerAlarm.windspeed}</td>
                    <td>${towerAlarm.obliquity}</td>
                    <td>${towerAlarm.fall}</td>
                    <td>
                        <fmt:formatDate value="${towerAlarm.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>${towerAlarm.relayalarm}</td>
                    <td>${towerAlarm.earlyalarm}</td>
                    <td>${towerAlarm.alarm}</td>


                </tr>
            </c:forEach>
        </c:if>
    </table>
    <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
</div>






</body>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/comming.js"></script>

</html>

















