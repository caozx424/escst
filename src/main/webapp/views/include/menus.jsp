<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div style="background:#000;overflow:hidden; z-index:10;position:fixed;left:0px;top:67px;"id="menu_cont">
	<div class="leftsidebar_box">
		<div class="line"></div>

		<%--根据登录用户权限，显示菜单项目--%>
		<c:forEach items="${hmMainList}" var="mainList">
			<dl >
			<dt style="background-image: url(${ctx}/${mainList.iconPath}">
				<%--<点击首页，右侧显示地图>--%>
				<c:if test="${mainList.id eq '1'}">
					<a href="javascript:void(-1)" class="openMenu" name="${ctx}/${mainList.menuUrl}">
						${mainList.menuName }
						<img src="${ctx}/resources/static/images/select_xl01.png"/>
					</a>
				</c:if>
				<%--<点击非首页大标题，右侧无变化>--%>
				<c:if test="${mainList.id ne '1'}">
					${mainList.menuName }
					<img src="${ctx}/resources/static/images/select_xl01.png"/>
				</c:if>
			</dt>
				<c:forEach items="${hmSubList}" var="subList">
					<c:if test="${mainList.id eq subList.parentMenuId}">
						<dd>
							<a href="javascript:void(-1)" class="openMenu" name="${ctx}/${subList.menuUrl }">
								${subList.menuName }
							</a>
						</dd>
					</c:if>
				</c:forEach>
			</dl>
		</c:forEach>

		<%--<dl class="system_log">--%>
			<%--<dt><a href="javascript:void(-1)" class="openMenu" name="${ctx}/home/main">主页</a></dt>--%>
		<%--</dl>--%>
		<%--<dl class="system_mov">--%>
			<%--<dt onClick="changeImage()">视频管理<img src="${ctx}/resources/static/images/select_xl01.png"/></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu">视频显示</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">视频信息</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="custom">--%>
			<%--<dt onClick="changeImage()">设备监控<img src="${ctx}/resources/static/images/select_xl01.png"/></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu">塔吊实时监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">塔吊监测</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">塔吊管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">塔吊报警统计</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">升降机实时监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">升降机监测</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">升降机管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">升降机报警统计</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="channel">--%>
			<%--<dt>环境监测<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="#">噪音监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">粉尘PM10监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">粉尘PM2.5监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">温度监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">湿度监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">有毒气体监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">可燃气体监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">环境报警统计</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">传感器管理</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="app">--%>
			<%--<dt onClick="changeImage()">基坑监测<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu">基坑实时监控</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">基坑监测</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">基坑管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">基坑报警统计</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="cloud">--%>
			<%--<dt>项目管理<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu">项目进度</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">项目维护</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">项目文件</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">材料消耗</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">质量管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">质检日志</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="syetem_management">--%>
			<%--<dt>人员管理<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu"  name="${ctx}/person/list">人员结构</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">人员管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/attendanceEquipment/list">门禁设备</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu"  name="${ctx}/deviceTask/list">设备任务</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">人员工时记录</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/userWorkHours/list">人员工时统计</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="source">--%>
			<%--<dt>综合统计<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu">环境报警统计</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">设备报警统计</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">基坑报警统计</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="statistics">--%>
			<%--<dt>在线办公<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu">待办事项</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">待办事项审批</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">公告管理</a></dd>--%>
		<%--</dl>--%>
		<%--<dl class="stat">--%>
			<%--<dt>系统设置<img src="${ctx}/resources/static/images/select_xl01.png"></dt>--%>
			<%--<dd class="first_dd"><a href="javascript:void(-1)" class="openMenu" name="${ctx}/development/list">建设单位</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/construction/list" >施工单位</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/supervision/list">监理单位</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/user/list">用户管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/role/list">角色管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">部门管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/menu/menuList">菜单管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/icon/iconList">图标管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/area/view">地域管理</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu">系统日志</a></dd>--%>
			<%--<dd><a href="javascript:void(-1)" class="openMenu" name="${ctx}/type/list">数据字典</a></dd>--%>
		<%--</dl>--%>
	</div>
</div>





