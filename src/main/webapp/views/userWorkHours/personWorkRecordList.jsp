<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>智慧工地大数据云服务平台</title>
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">

    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>


    <style>
        tr td:nth-of-type(1){width:2%;}
        tr td:nth-of-type(2){width:8%;}
        tr td:nth-of-type(3){width:8%;}
        tr td:nth-of-type(4){width:8%;}
        tr td:nth-of-type(5){width:8%;}
        tr td:nth-of-type(6){width:8%;}
        tr td:nth-of-type(7){width:8%;}
        tr td:nth-of-type(8){width:8%}
        tr td:nth-of-type(9){width:8%}
        tr td:nth-of-type(10){width:8%}
        tr td:nth-of-type(11){width:8%}
        tr td:nth-of-type(12){width:8%}
        tr td:nth-of-type(13){width:10%}
    </style>
</head>

<body>

<div class="cont_txt">
    <p class="MUsers">人员管理->人员工时记录</p>

    <div class="tab_head">
        <ul>
            <li>
            <li><a href="${ctx}/userWorkHours/exportXls"><img src="/resources/static/images/plus_03.png" /><span>导出EXCEL</span></a></li>
            </li>
        </ul>
    </div>

    <div class="form_message">
        <form method="post" action="${ctx}/userWorkHours/personWorkRecord" id="query_form">
            <p>
            </p>
        </form>
    </div>

    <div class="mtab">
        <table class="table" id="tab">
            <tr class="th_color">
                <th>序号</th>
                <th>姓名</th>
                <th>职位</th>
                <th>上午签到时间</th>
                <th>上午签退时间</th>
                <th>日期</th>
                <th>正常工作时长</th>
                <th>加班签到记录</th>
                <th>加班签退记录</th>
                <th>加班时长</th>
                <th>外出时长</th>
                <th>下午签到时间</th>
                <th>下午签退时间</th>
            </tr>
            <c:forEach items="${page.vos}" var="personWorkRecord" varStatus="status">
                <tr>
                    <td>${(page.currentPage-1) * 10 + status.count}</td>
                    <td>${personWorkRecord.name}</td>
                    <td>${personWorkRecord.duty}</td>
                    <td><fmt:formatDate value="${personWorkRecord.amStartTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td><fmt:formatDate value="${personWorkRecord.amEndTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td>${personWorkRecord.time}</td>
                    <td>${personWorkRecord.workdate}</td>
                    <td><fmt:formatDate value="${personWorkRecord.overStartTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td><fmt:formatDate value="${personWorkRecord.overEndTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td>${personWorkRecord.overDate}</td>
                    <td>${personWorkRecord.outDate}</td>
                    <td><fmt:formatDate value="${personWorkRecord.pmStartTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                    <td><fmt:formatDate value="${personWorkRecord.pmEndTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>

                </tr>
            </c:forEach>
        </table>

        <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>

    </div>
</div>

</body>
</html>

