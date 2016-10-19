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
    <script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/static/sea-modules/sea.js"></script>

    <script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
    <script src="${ctx}/resources/static/js/jquery.nicescroll.js"></script>
    <script src="${ctx}/resources/static/js/comming.js"></script>

    <style>
        @import url("${ctx}/resources/static/css/media.css");
    </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> <![endif]-->


<body>

<div class="cont_txt"><!--嵌套-->
    <p class="MUsers" >吊塔报警数据系统</p>


</div>


<!--柱状图-->
<div class="chart_main">

    <div id="main" style="height:550px; margin:0px auto;"></div>
    <script>



            seajs.use('${ctx}/resources/static/sea-modules/Fold.js', function (ex) {
                ex.area(${earlyMap},${alarmMap},${dateMap});
            })


    </script>




       <div style="width: 100%; height: 50px"></div>
    <div class="list_warning" style="text-align: center;
    line-height: 60px;
    font-size: 16px;">
        <p>塔吊预警列表</p>
    </div>
        <iframe src="${ctx}/tower/towerAlarmList"  width="100%" height="400"  ></iframe>

</div>


</body>

</html>

















