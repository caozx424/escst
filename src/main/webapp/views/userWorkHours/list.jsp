<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<p class="MUsers">人员管理->人员工时统计</p>

	<div class="tab_head">
		<ul>
			<li>
				人员工时统计
			<li>
		</ul>
	</div>

	<%--<div class="form_message">--%>
		<%--<form method="post" action="${ctx}/userWorkHours/list" id="query_form">--%>
			<%--<p>--%>
			<%--</p>--%>
		<%--</form>--%>
	<%--</div>--%>
	<form method="post" action="${ctx}/userWorkHours/list" id="query_form">
    <div class="mtab">
	<table class="table" id="tab">
		<tr class="th_color">
			<th>序号</th>
			<th>姓名</th>
			<th>职位</th>
			<th>日正常工时</th>
			<th>日加班工时</th>
			<th>日外出工时</th>
			<th>周正常工时</th>
			<th>周加班工时</th>
			<th>周外出工时</th>
			<th>月正常工时</th>
			<th>月加班工时</th>
			<th>月外出工时</th>
			<th>日期</th>
		</tr>
		<c:forEach items="${page.vos}" var="userWorkHoursStaticEntity" varStatus="status">
			<tr>
				<td>${userWorkHoursStaticEntity.rownum}</td>
				<td>${userWorkHoursStaticEntity.name }</td>
				<td>${userWorkHoursStaticEntity.duty }</td>
				<td>${userWorkHoursStaticEntity.workdate}</td>
				<td>${userWorkHoursStaticEntity.overdate}</td>
				<td>${userWorkHoursStaticEntity.outdate}</td>
				<td>${userWorkHoursStaticEntity.weekworkdate}</td>
				<td>${userWorkHoursStaticEntity.weekoverdate}</td>
				<td>${userWorkHoursStaticEntity.weekoutdate}</td>
				<td>${userWorkHoursStaticEntity.monthworkdate}</td>
				<td>${userWorkHoursStaticEntity.monthoverdate}</td>
				<td>${userWorkHoursStaticEntity.monthoutdate}</td>
				<td>${userWorkHoursStaticEntity.time}</td>
			</tr>
		</c:forEach>
	</table>

		<pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>

   </div>
</div>

</body>
</html>

