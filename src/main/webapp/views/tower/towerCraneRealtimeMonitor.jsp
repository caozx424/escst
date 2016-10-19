<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/sea-modules/sea.js"></script>
    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <style>
        @import url("${ctx}/resources/static/css/media.css");
    </style>

<body>

<div class="cont_txt">
    <p class="MUsers" >塔吊实时监测</p>
</div>

<div class="Cranes_title">
    <form action="${ctx}/towerCraneRealtime/monitor" method="post">
        <p>
            <label>吊塔编号:</label>
            <select id="towerno" name="towercraneno">
                <option value="">-请选择-</option>
                <c:forEach items="${towerNoList}" var="item">
                    <option value="${item}">${item}</option>
                </c:forEach>
            </select>
        </p>
    </form>
</div>

<!--折线图-->
<div class="chart_main">
    <div id="main" style="min-height:600px; margin:0px auto;"></div>
    <script>
        seajs.use('${ctx}/resources/static/sea-modules/Cranes.js',function(ex){
            ex.Crane(${towerCraneRealtimeData});
        });

        $("#towerno").change(function(){
            $("form").submit();
        })
    </script>
</div>
<!--折线图-->

</body>
</html>

















