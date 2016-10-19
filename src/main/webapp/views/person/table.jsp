<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/sea-modules/sea.js"></script>
    <script src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<div class="sel_form">
    <form class="form-horizontal" role="form" method="post" id="query_form" action="${ctx}/person/personlist">
        <fieldset>
            <div class="form-group">
                <label   class="control-label">工种：</label>
                <div>
                    <select class="form-control"  id="select">
                        <c:forEach items="${gongzhong}" var="gz">
                            <option value="${gz.code}">${gz.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<div class="mtab">
    <table class="table table-striped" border="1" bordercolor="#CCCCCC">
        <thead>
        <tr class="th_color">
            <th>&nbsp;</th>
            <th>工种</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>手机</th>
        </tr>
        </thead>
        <c:forEach items="${page.vos}" var="person" varStatus="status">
            <tr>
                <td>${(page.currentPage-1) * 10 + status.count}</td>
                <td>${person.gongzhong }</td>
                <td>${person.name }</td>
                <td>${person.male}</td>
                <td>${person.age}</td>
                <td>${person.mobile}</td>
            </tr>
        </c:forEach>

    </table>
    <div class="nav_page">
        <c:if test="${!empty page.vos}">
            <pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}"
                         formId="query_form"/>
        </c:if>

    </div>
</body>
</html>
<script>
    $(function () {

        $("#select  option[value=${selected}] ").attr("selected",true);

        $("#select").change(function(){
            var gongzhong=$(this).children('option:selected').val();
            window.location.href="${ctx}/person/personlist?gongzhong="+gongzhong;

        })

    })

</script>

