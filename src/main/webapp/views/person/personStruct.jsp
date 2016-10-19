<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/sea-modules/sea.js"></script>
    <script src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
    <!--<script src="js/echarts.min.js"></script>
-->    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>

</script>
<body>
<div class="cont_txt">

    <p class="MUsers">人员管理->人员结构</p>
    <jsp:include page="graph.jsp"/>

</div>
   <%--<jsp:include page="table.jsp"/>--%>
<iframe src="${ctx}/person/personlist" id="tableId" name="tableName" width="100%" height="600"></iframe>
</body>


</html>

