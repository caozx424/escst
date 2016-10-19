<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="U-XA-Compatible" content="IE=9"/>
	<title>智慧工地大数据云服务平台</title>
	<link href="${ctx}/resources/static/css/main/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/static/js/jquery-ui-1.9.2.custom.min.js"></script>
</head>

<body>
<div class="content">
	<div class="left">
		<div class="gdss">
			<div class="head">当前工地信息</div>
			<div class="ss1"><label class="archilabel">工地名称：</label>${architectural.architecturalname }</div>
			<div class="ss1"><label class="archilabel">工地地址：</label>${architectural.area }</div>
			<div class="ss1"><label class="archilabel">项目时间：</label><fmt:formatDate value='${architectural.startDate}' type="date" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value='${architectural.endDate}' type="date" pattern="yyyy-MM-dd"/></div>
			<div class="ss1"><label class="archilabel">所属集团公司：</label>${architectural.jituan}</div>
			<div class="ss1"><label class="archilabel">建筑面积：</label>${architectural.builtuparea}平米</div>
			<div class="ss1"><label class="archilabel">总预算：</label>${architectural.totalinvestment}万元</div>
			<div class="ss1"><label class="archilabel">项目经理：</label>${architectural.xiangmujingli}</div>
			<div class="ss1"><label class="archilabel">总工程师：</label>${architectural.zonggong}</div>
			<div class="ss1"><label class="archilabel">建设单位：</label>${architectural.developmentname}</div>
			<div class="ss1"><label class="archilabel">施工单位：</label>${architectural.constructionname}</div>
			<div class="ss1"><label class="archilabel">监理单位：</label>${architectural.supervisionname}</div>
		</div>
		在线：<span id="in1"></span>&nbsp&nbsp&nbsp&nbsp<img src="${ctx}/resources/static/images/main/b1.png"/>
		离线：<span id="in2"></span>&nbsp&nbsp&nbsp&nbsp<img src="${ctx}/resources/static/images/main/b2.png"/>
	</div>
	<div class="left">
		<div class="dqwz"></div>
		<c:import url="../main/gongdimap.jsp"/>
	</div>
</div>
</body>
</html>
