<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>智慧工地大数据云服务平台</title>
	<link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
	<link href="${ctx}/resources/static/css/main.css" rel="stylesheet">

	<script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
	<script src="${ctx}/resources/static/js/calendar.js"></script>

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
				var url = "${ctx}/todo/delete?id="+id;
//				alert(url);
				$.post(url,function(msg){
					if(msg=="success"){
						$("#del_succ_div").css("display","block");
					}
				});
			});

			$("#del_succ_confirm").click(function(){
				$("#del_succ_div").css("display","none");
				window.location.href = "${ctx}/todo/list";
			});

		});
	</script>

	<style>
		tr td:nth-of-type(1){width: 5%;}
		tr td:nth-of-type(2){width: 10%;}
		tr td:nth-of-type(3){width: 15%;}
		tr td:nth-of-type(4){width: 15%;}
		tr td:nth-of-type(5){width: 10%;}
		tr td:nth-of-type(6){width: 10%;}
		tr td:nth-of-type(7){width: 10%;}
		tr td:nth-of-type(8){width: 20%}
	</style>

</head>


<body>

<div class="cont_txt">
	<p class="MUsers">在线办公->待办事项</p>

	<div class="tab_head">
		<ul>
			<li>
				<a href="${ctx}/todo/toAddOrUpdate"><img src="${ctx}/resources/static/images/plus_03.png" /><span>用户录入</span></a>
			<li>
		</ul>
	</div>

	<form method="post" action="${ctx}/todo/list" id="query_form">
	<div style="margin:10px 0px;" style="border:1px solid #000;">

		<div class="width_input">
			<p>
				<label>发布时间:</label>
				<input type="text" id="beginDate" name="beginDate" value="${beginDate}" maxlength="10" onClick="new Calendar().show(this);" readonly />
				<input type="text" id="endDate" name="endDate" value="${endDate}" maxlength="10" onClick="new Calendar().show(this);" readonly />
			</p>
		</div>

		<div class="width_input">
			<p>
				<label>审批状态:</label>
				<select name="approveStatus">
					<option value="">-请选择-</option>
					<option value="todostate1" <c:if test="${todoEntity.approveStatus eq 'todostate1'}">selected</c:if>>待审</option>
					<option value="todostate2" <c:if test="${todoEntity.approveStatus eq 'todostate2'}">selected</c:if>>已审</option>
				</select>
			</p>
		</div>

		<div class="width_input cos_padd">
			<p>
				<button type="submit">查询</button>
				<button type="reset" id="reset">重置</button>
			</p>
		</div>
		<div class="clear"></div>
	</div>
	</form>

    <div class="the_project">
	<table class="table" id="tab">
		<tr class="th_color">
			<th>序号</th>
			<th>待办事项标题</th>
			<th>待办事项内容</th>
			<th>发布时间</th>
			<th>批复状态</th>
			<th>批复人</th>
			<th>批复政府部门</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${page.vos}" var="todo" varStatus="status">
			<tr>
				<td>${(page.currentPage-1) * 10 + status.count}</td>
				<td>${todo.todoTitle }</td>
				<td>${todo.todoContent }</td>
				<td><fmt:formatDate value="${todo.createDate}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${todo.approveStatus eq 'todostate1'}">
						待审
					</c:if>
					<c:if test="${todo.approveStatus eq 'todostate2'}">
						已审
					</c:if>
				</td>
				<td>${todo.approveLeader}</td>
				<td>
				 <c:forEach items="${typeEntityList}" var="type">
                    <c:if test="${type.code eq todo.zhengfubumenid}">
						${type.name}
					</c:if>
				 </c:forEach>
				<td>
					<c:if test="${todo.approveStatus == 'todostate1'}">
						<a href="#delcfmModel" data-toggle="modal" name="${todo.id}" class="remove_link">[删除]</a>
						<a href="javascript:void(-1)" name="${todo.id}">[编辑]</a>
						<a href="javascript:void(-1)" name="${todo.id}">[查看详情]</a>
					</c:if>
					<c:if test="${todo.approveStatus == 'todostate2'}">
						<a href="javascript:void(-1)" name="${todo.id}">[查看详情]</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>

		<pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>

   </div>
</div>

	<!--删除对话框-->
	<div class="modal fade container" id="delcfmModel" style="display:none;">
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

</body>
</html>



