<%--
  Created by IntelliJ IDEA.
  User: zcf
  Date: 2016/9/8
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>升降机监测</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">

    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <style>
        .th_color{background-color: #4092e8}
    </style>

</head>
<body>
<div class="cont_txt">
    <p class="MUsers">设备监控->升降机监测</p>
    <div class="tab_head">
        <ul>
   <li><span>升降机历史数据</span></li>
        </ul>
    </div>
</div>
<div class="form_message">
    <form method="post" id="query_form" action="${ctx}/lift/list">
    </form>
</div>
<div class="mtab">
    <table  class="table table-striped table-fixed-head" id="tab">
        <tr class="th_color">
            <th class="th_color">序号</th>
            <th class="th_color">升降机编号</th>
            <th class="th_color">载重</th>
            <th class="th_color">人数</th>
            <th class="th_color">识别方式</th>
            <th class="th_color">司机ID</th>
            <th class="th_color">风速</th>
            <th class="th_color">运行高度</th>
            <th class="th_color">运行速度</th>
            <th class="th_color">倾斜角度</th>
            <th class="th_color">呼叫楼层</th>
            <th class="th_color">当前楼层</th>
            <th class="th_color">采集时间</th>


        </tr>
        <c:if test="${!empty page.vos}">
            <c:forEach items="${page.vos}" var="lift" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${lift.liftNo}</td>
                    <td>${lift.load}</td>
                    <td>${lift.people_num}</td>
                    <td>${lift.recognize_mode}</td>
                    <td>${lift.driverId}</td>
                    <td>${lift.wind}</td>
                    <td>${lift.elevator_heighi}</td>
                    <td>${lift.elevator_Speed}</td>
                    <td>${lift.angle}</td>
                    <td>${lift.call_floor}</td>
                    <td>${lift.relfloor}</td>
                    <td><fmt:formatDate value="${lift.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                </tr>
            </c:forEach>
        </c:if>
    </table>
    <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
</div>

</body>
</html>
