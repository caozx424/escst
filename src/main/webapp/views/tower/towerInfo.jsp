<%--
  Created by IntelliJ IDEA.
  User: zcf
  Date: 2016/9/21
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>区域管理</title>
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
        <p class="MUsers">塔吊历史信息</p>
        <div class="tab_head">
            <ul>
                <%--<li><a style="color:white" href="${ctx}/area/create"><img src="${ctx}/resources/static/images/plus_03.png" /><span>新增区域</span></a></li>--%>
            </ul>
        </div>
    </div>
    <div class="form_message">
        <form method="post" id="query_form" action="${ctx}/tower/towerList">
        </form>
    </div>
    <div class="mtab">
        <table  class="table table-striped table-fixed-head" id="tab">
            <tr class="th_color">
                <th class="th_color">序号</th>
                <th class="th_color">塔吊编号</th>
                <th class="th_color">运行时长</th>
                <th class="th_color">回转角度</th>
                <th class="th_color">幅度</th>
                <th class="th_color">吊钩高度</th>
                <th class="th_color">吊重</th>
                <th class="th_color">安全吊重</th>
                <th class="th_color">风速</th>
                <th class="th_color">倾角</th>
                <th class="th_color">吊绳倍率</th>
                <th class="th_color">采集时间</th>
            </tr>
            <c:if test="${!empty page.vos}">
                <c:forEach items="${page.vos}" var="towerInfo" varStatus="status">
                    <tr>
                        <td>${(page.currentPage-1) * 10 + status.count}</td>
                        <td>${towerInfo.towercraneno}</td>
                        <td>${towerInfo.runsecond}</td>
                        <td>${towerInfo.angle}</td>
                        <td>${towerInfo.radius}</td>
                        <td>${towerInfo.height}</td>
                        <td>${towerInfo.tdload}</td>
                        <td>${towerInfo.safeload}</td>
                        <td>${towerInfo.windspeed}</td>
                        <td>${towerInfo.obliquity}</td>
                        <td>${towerInfo.fall}</td>
                        <td>
                            <fmt:formatDate value="${towerInfo.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
    </div>
</body>
</html>
