<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="U-XA-Compatible" content="IE=9"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>数据字典</title>
	<link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
	<script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
</head>

<body>
<div class="cont_txt">
	<p class="MUsers">系统设置-菜单管理</p>

	<div class="tab_head">
		<ul>
			<li><a href="javascript:void(-1);"><img src="${ctx}/resources/static/images/plus_03.png" /></a><span>字典项录入</span></li>
		</ul>
	</div>

		<div class="form_message">
			<form method="post" id="query_form" action="${ctx}/type/list">
				<p>
					<span>字典名称</span>&nbsp;:&nbsp;<input type="text" name="typename" id="typename" value="${typeEntity.typename}"/>
					<span>字典编码</span>&nbsp;:&nbsp;<input type="text" name="typecode" id="typecode" value="${typeEntity.typecode}"/>
					<input class="btn-col" type="submit" value="查询" />
					<input class="btn-col" type="reset" id="reset" value="重置" />
				</p>
			</form>
		</div>

		<c:if test="${empty page.vos}">
			<div>没有相关的数据</div>
		</c:if>
		<c:if test="${!empty page.vos}">
			<table class="table table-striped table-fixed-head" id="tab">
				<tr class="th_color">
					<th class="th_color">序号</th>
					<th class="th_color">字典名称</th>
					<th class="th_color">字典编码</th>
					<th class="th_color">操作</th>
				</tr>
				<c:forEach items="${page.vos}" var="type" varStatus="status">
					<tr>
						<td>${(page.currentPage-1) * 10 + status.count}</td>
						<td>${type.typecode }</td>
						<td>${type.typecode }</td>
						<td>
							<a href="javascript:void(-1);" title="点击编辑数据字典相关数据" name="${type._id}" class="edit_link">编辑</a>
							<a href="javascript:void(-1);" title="点击删除数据字典相关数据" name="${type._id}" class="remove_link">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

	<c:if test="${!empty page.vos}">
		<pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
	</c:if>

	</div>
</div>

</body>
</html>