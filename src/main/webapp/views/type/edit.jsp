<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>数据字典</title>
	<link href="${ctx}/resources/static/css/edit.css" rel="stylesheet">
</head>

<body>
	<form action="${ctx}/type/edit" method="post" id="update_form" >
		<table class="edit_table">
			<tr>
				<td class="td_text">字典名称：</td>
				<td><input type="text" name="typename" id="typename" value="${typeEntity.typename}"/></td>
			</tr>
			<tr>
				<td class="td_text">字典编码：</td>
				<td>
					<input type="text" name="typecode" id="typecode" value="${typeEntity.typecode}" class="search_input"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>