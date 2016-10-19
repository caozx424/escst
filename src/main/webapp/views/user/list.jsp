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

	<script type="text/javascript">
		$(function(){
			//删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
			$(".remove_link").click(function(){
				var id = $(this).attr("name");
				$("#remove_id").val(id);
			});

			//删除确认
			$("#remove_confirm").click(function(){
				var id = $("#remove_id").val();
				//alert(id);
				var url = "${ctx}/user/delete?id="+id;
//				alert(url);
				$.post(url,function(msg){
					if(msg=="success"){
						$("#del_succ_div").css("display","block");
					}
				});
			});

			$("#del_succ_confirm").click(function(){
				$("#del_succ_div").css("display","none");
				window.location.href = "${ctx}/user/list";
			});

			//重置密码
			$(".resetpwd_link").click(function(){
				var id = $(this).attr("name");
				$("#resetpwd_id").val(id);
			});

			//重置密码确认
			$("#resetpwd_confirm").click(function(){
				var id = $("#resetpwd_id").val();
				//alert(id);
				var url = "${ctx}/user/resetPwd?id="+id;
//				alert(url);
				$.post(url,function(msg){
					if(msg=="success"){
						alert("重置密码成功！");
						window.location.href = "${ctx}/user/list";
					}
				});
			});

		});
	</script>

	<style>
		tr td:nth-of-type(1){width:5%;}
		tr td:nth-of-type(2){width:15%;}
		tr td:nth-of-type(3){width:15%;}
		tr td:nth-of-type(4){width:15%;}
		tr td:nth-of-type(5){width:15%;}
		tr td:nth-of-type(6){width:15%;}
		tr td:nth-of-type(7){width:20%;}
	</style>

</head>


<body>

<div class="cont_txt">
	<p class="MUsers">系统管理-用户管理</p>

	<div class="tab_head">
		<ul>
			<li>
				<a href="${ctx}/user/toAddOrUpdate"><img src="${ctx}/resources/static/images/plus_03.png" /><span>用户录入</span></a>
			<li>
		</ul>
	</div>

	<div class="form_message">
		<form method="post" action="${ctx}/user/list" id="query_form">
			<p>
				<span>用户名</span>&nbsp;:&nbsp;<input type="text" name="username" value="${user.username}"/>
				<span>真实姓名</span>&nbsp;:&nbsp;<input type="text" name="realname" value="${user.realname}"/>
				<input class="btn-col" type="submit" value="查询" />
				<input class="btn-col" type="reset" value="重置" />
			</p>
		</form>
	</div>

    <div class="mtab">
	<table class="table" id="tab">
		<tr class="th_color">
			<th>序号</th>
			<th>用户名</th>
			<th>用户职能</th>
			<th>用户角色</th>
			<th>真实姓名</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${page.vos}" var="user" varStatus="status">
			<tr>
				<td>${(page.currentPage-1) * 10 + status.count}</td>
				<td>${user.username }</td>
				<td>${user.userDuty }</td>
				<td>${user.rolename}</td>
				<td>${user.realname}</td>
				<td>
					<c:if test="${user.locked == false}">正常</c:if>
					<c:if test="${user.locked == true}">锁定</c:if>
				</td>
				<td>
					<a href="#resetPwdModel" name="${user.id}"  data-toggle="modal" class="resetpwd_link">重置密码</a>
					<a href="${ctx}/user/toAddOrUpdate?id=${user.id}"  class="edit_link">编辑</a>
					<a href="#delcfmModel" name="${user.id}" data-toggle="modal" class="remove_link">删除</a>
					<a href="${ctx}/user/projects?userId=${user.id}" class="project_link">所属项目</a>
				</td>
			</tr>
		</c:forEach>
	</table>

		<pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>

   </div>
</div>

	<!--删除对话框-->
	<div class="modal fade container" id="delcfmModel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span></button>
					<h4 class="modal-title mark_info">确认</h4></div>
				<div class="modal-body">
					<p>确认删除该条记录？</p>
				</div>
				<div class="modal-footer foot_md">
					<input type="hidden" id="remove_id" value=""/>
					<button type="button" class="btn btn-default arrow_left" data-dismiss="modal">取消</button>
					<a id="remove_confirm" class="btn btn-success" data-dismiss="modal">确定</a></div>
			</div>
		</div>
	</div>

	<!--删除成功对话框-->
	<div class="modal" id="del_succ_div" style="display:none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title mark_info">提示信息</h4>
				</div>
				<div class="modal-suc">
					<p>删除成功！</p>
				</div>
				<div class="modal-footer foot_md">
					<input type="hidden" id="url"/>
					<a class="btn btn-success" id="del_succ_confirm">确定</a>
				</div>
			</div>
		</div>
	</div>

	<!--重置密码对话框-->
	<div class="modal fade container" id="resetPwdModel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span></button>
					<h4 class="modal-title mark_info">确认</h4></div>
				<div class="modal-body">
					<p>您确定要重置密码为123456吗？</p>
				</div>
				<div class="modal-footer foot_md">
					<input type="hidden" id="resetpwd_id" value=""/>
					<button type="button" class="btn btn-default arrow_left" data-dismiss="modal">取消</button>
					<a id="resetpwd_confirm" class="btn btn-success" data-dismiss="modal">确定</a></div>
			</div>
		</div>
	</div>

</body>
</html>

