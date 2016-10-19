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
	<link href="${ctx}/resources/static/css/animate.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
	<link href="${ctx}/resources/static/css/style.css" rel="stylesheet">

	<script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
        var ctx = "${ctx}";
		$(function(){
			//根据省份查询城市
			$("#belongProvince").change(function(){
				var id = $(this).val();
				var url = "${ctx}/area/queryCity";
				var data = {"id":id};
				$.ajax({
					url:url,
					type:"POST",
					dataType:"json",
					data:data,
					success:function(data){
						$("#belongCity").empty();
						var html = "<option value=\"0\">--请选择--</option>";

						$(data).each(function(index){
							html += "<option value=\""+data[index].id+"\">"+data[index].name+"</option>";
						});
						$("#belongCity").append(html);
					}
				})
			});

			//根据城市id获取区县
			$("#belongCity").change(function(){
				var id = $(this).val();
				if(id==0){
					return;
				}
				var url = "${ctx}/area/queryCity";
				var data = {"id":id};
				$.ajax({
					url:url,
					type:"POST",
					dataType:"json",
					data:data,
					success:function(data){
						$("#belongArea").empty();
						var html = "<option value=\"0\">--请选择--</option>";

						$(data).each(function(index){
							html += "<option value=\""+data[index].id+"\">"+data[index].name+"</option>";
						});
						$("#belongArea").append(html);
					}
				});
			});

			//删除链接给将id值传到模态窗口的id隐藏字段中，以便删除确认之用
			$(".remove_link").click(function(){
				var id = $(this).attr("name");
				$("#remove_id").val(id);
			});

			//删除确认
			$("#remove_confirm").click(function(){
				var id = $("#remove_id").val();
				//alert(id);
				var url = "${ctx}/user/deleteUserArchitevture?id="+id;
//				alert(url);
				$.post(url,function(msg){
					if(msg=="success"){
//						$("#del_succ_div").css("display","block");
						alert("删除成功！")
						window.location.reload();
					}
				});
			});

			// 设置为默认项目
			$(".set_default_link").click(function(){
				var id = $(this).attr("name");
				var userId = $("#userId").val();
				var url = "${ctx}/user/setdefault?id="+id+"&userId="+userId;
				$.post(url,function(msg){
					if(msg=="success"){
//						$("#setdefault_succ_div").css("display","block");
						alert("设置默认项目成功！");
						window.location.reload();
					}
				})
			});

			$("#item_click").click(function(){
				$('#zhezao').css('display','block');
				$("#add_perg").css('display','block');
				var userId = $("#userId").val();
				var url = "${ctx}/user/allprojects?userId="+userId;
				$("#add_perg #projectframe").attr("src",url);
			});

			$(".icon_dex").on('click',function(){
				$('#zhezao').css('display','none');
				$("#add_perg").css('display','none');
			})
			$("#delect_btn").on('click',function(){
				$('#zhezao').css('display','none');
				$("#add_perg").css('display','none');
				//查询页面
				window.location.reload();
			})

			$('#add_perg').drag();


			$("#del_succ_confirm").click(function(){
				$("#del_succ_div").css("display","none");
				window.location.reload();
			});

			$("#setdefault_succ_confirm").click(function(){
				$("#setdefault_succ_div").css("display","none");
				window.location.reload();
			});

	});
	</script>

	<style>
		tr td:nth-of-type(1){width:5%;}
		tr td:nth-of-type(2){width:10%;}
		tr td:nth-of-type(3){width:6%;}
		tr td:nth-of-type(4){width:6%;}
		tr td:nth-of-type(5){width:6%;}
		tr td:nth-of-type(6){width:10%;}
		tr td:nth-of-type(7){width:10%;}
		tr td:nth-of-type(8){width:10%;}
		tr td:nth-of-type(9){width:10%;}
		tr td:nth-of-type(10){width:10%;}
		tr td:nth-of-type(11){width:10%;}
	</style>
</head>

<body>
	<div class="zhezhao" id="zhezao"></div>
	<div class="cont_txt">
		<!--嵌套-->
		<p class="MUsers">所属项目</p>
		<div class="tab_head">
			<ul>
				<li>
					<a href="${ctx}/user/list">
						<img src="${ctx}/resources/static/images/back_03.png" /><span>返回页面</span>
					</a>
				</li>
				<li>
			</ul>
		</div>
	</div>

	<div style="margin-top:20px; border-bottom:1px solid #d2d2d2;">
	<form class="form-horizontal" method="post" action="${ctx}/user/projects" id="query_form">
		<input type="hidden" id="userId" name="userId" value="${userArchitectureEntity.userId}"/>
		<fieldset>
			<div class="form-group">
				<label class="col-md-1 control-label" for="">项目名称:</label>
				<div class="col-md-2">
					<input type="text" class="form-control auto" id="architecturalname" name="architecturalEntity.architecturalname" placeholder="项目名称"/>
				</div>

				<label class="col-md-2 control-label" for="">建设单位:</label>
				<div class="col-md-2">
					<input type="text" class="form-control auto" name="architecturalEntity.developmentname" placeholder="建设单位"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-1 control-label" for="">施工单位:</label>
				<div class="col-md-2">
					<input type="text" class="form-control auto" name="architecturalEntity.constructionname" placeholder="施工单位"/>
				</div>
				<label class="col-md-2 control-label" for="">监理单位:</label>
				<div class="col-md-2">
					<input type="text" class="form-control auto"name="architecturalEntity.supervisionname" placeholder="监理单位"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-1 control-label" for="">地区:</label>
				<div class="col-md-2">
					<select class="form-control" name="architecturalEntity.belongProvince" id="belongProvince">
						<option value="0">-请选择-</option>
						<c:forEach items="${provinceList}" var="province">
							<option value="${province.id}">${province.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="col-md-2">
					<select class="form-control" name="architecturalEntity.belongCity" id="belongCity">
					</select>
				</div>

				<div class="col-md-2">
					<select class="form-control" name="architecturalEntity.belongArea" id="belongArea">
					</select>
				</div>

				<div class="col-md-2 text-right">
					<button type="submit" class="btn btn-info">查询</button>
					<button type="reset" class="btn btn-info">重置</button>
				</div>

			</div>

		</fieldset>
	</form>
	</div>

	<div class="the_project">
		<h4><a href="#" id="item_click"><span><img src="${ctx}/resources/static/images/plus_03.png" />添加所属项目</span></a></h4>
		<table class="table table-bordered table-striped">
			<tr class="th_color">
				<td>序号</td>
				<td>项目名称</td>
				<td>省</td>
				<td>市</td>
				<td>区县</td>
				<td>开始时间</td>
				<td>结束时间</td>
				<td>建设单位</td>
				<td>施工单位</td>
				<td>监理单位</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${page.vos}" var="userArchitectureEntity" varStatus="status">
				<tr>
					<td>${(page.currentPage-1) * 10 + status.count}</td>
					<td>${userArchitectureEntity.architecturalEntity.architecturalname}</td>
					<td>${userArchitectureEntity.architecturalEntity.belongProvinceName}</td>
					<td>${userArchitectureEntity.architecturalEntity.belongCityName}</td>
					<td>${userArchitectureEntity.architecturalEntity.belongAreaName}</td>
					<td><fmt:formatDate value="${userArchitectureEntity.architecturalEntity.startDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${userArchitectureEntity.architecturalEntity.endDate}" pattern="yyyy-MM-dd"/></td>
					<td>${userArchitectureEntity.architecturalEntity.developmentname}</td>
					<td>${userArchitectureEntity.architecturalEntity.constructionname}</td>
					<td>${userArchitectureEntity.architecturalEntity.supervisionname}</td>
					<td>
						<c:if test="${userArchitectureEntity.isDefault eq 'no'}">
							<a href="javascript:void(-1)" name="${userArchitectureEntity.id}" class="set_default_link">设为默认</a>&nbsp;&nbsp;
						</c:if>
						<a href="#item_list" data-toggle="modal" name="${userArchitectureEntity.id}" class="remove_link">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="pagelist">
		<pager:pager totalPage="${page.totalPage}" totalCount="${page.totalCount}" curPage="${page.currentPage}" formId="query_form"/>
	</div>

	<!--删除对话框-->
	<div class="modal fade container" id="item_list" style="display:none;">
		<div>
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span></button>
					<h4 class="modal-title mark_info">确认</h4></div>
				<div class="modal-body">
					<p>确认删除该条记录？</p>
				</div>
				<div class="modal-footer foot_md">
					<input type="hidden" id="remove_id" />
					<button type="button" class="btn btn-default arrow_left" data-dismiss="modal">取消</button>
					<a id="remove_confirm" class="btn btn-success" data-dismiss="modal">确定</a></div>
			</div>
		</div>
	</div>
	<!--删除对话框-->

	<!--删除成功对话框-->
	<div class="modal fade container" id="del_succ_div" style="display:none;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title mark_info">提示信息</h4>
				</div>
				<div class="modal-suc">
					<p>删除成功！</p>
				</div>
				<div class="modal-footer foot_md">
					<a class="btn btn-success" id="del_succ_confirm">确定</a>
				</div>
			</div>
	</div>

	<!--设置默认项目成功对话框-->
	<div class="modal fade container" id="setdefault_succ_div" style="display:none;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title mark_info">提示信息</h4>
				</div>
				<div class="modal-suc">
					<p>设置默认项目成功！</p>
				</div>
				<div class="modal-footer foot_md">
					<a class="btn btn-success" id="setdefault_succ_confirm">确定</a>
				</div>
			</div>
	</div>


	<!--添加所属项目-->
	<div id="add_perg" style="display: none;">
		<h4>添加所属项目<span class="icon_dex"></span></h4>
		<div style="height:450px;">
			<iframe id="projectframe" src="" scrolling="yes" width="100%" height="100%" frameborder="0"></iframe>
		</div>
		<div class="dex_foot">
			<button id="delect_btn">关闭</button>
		</div>
	</div>
	<!--添加所属项目-->

</body>
</html>

<script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/static/js/calendar.js"></script>

