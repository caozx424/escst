<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="pager" uri="/pager-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="U-XA-Compatible" content="IE=9"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>智慧工地大数据云服务平台</title>
	<link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
	<link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
	<link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/resources/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/static/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/static/js/validation/user.js"></script>
	<script type="text/javascript" src="${ctx}/resources/static/js/bootstrap.min.js"></script>

	<style>
		.red{color: red;}
		.validform_checktip {
			margin-left: 8px;
			line-height: 20px;
			height: 20px;
			overflow: hidden;
			color: #999;
			font-size: 12px;
		}
		a.l-btn span span.l-btn-icon-left {
			padding: 0 0 0 20px;
			background-position: left center;
		}
		a.l-btn-plain, a.l-btn-plain span.l-btn-left {
			background: transparent;
			border: 0;
			filter: none;
		}
	</style>

	<script>
		$(function(){
			//表单验证
			userAddValidation.init("${ctx}");

			//隐藏角色div
			$("#roleDiv").css("display","none");

			//根据省份查询城市
			$("#belong_Province").change(function(){
				var id = $(this).val();
				var url = "${ctx}/area/queryCity";
				var data = {"id":id};
				$.ajax({
					url:url,
					type:"POST",
					dataType:"json",
					data:data,
					success:function(data){
						$("#belong_City").empty();
						var html = "<option value=\"0\">--请选择--</option>";

						$(data).each(function(index){
							html += "<option value=\""+data[index].id+"\">"+data[index].name+"</option>";
						});
						$("#belong_City").append(html);
					}
				})
			});

			//根据城市id获取区县
			$("#belong_City").change(function(){
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
						$("#belong_Area").empty();
						var html = "<option value=\"0\">--请选择--</option>";

						$(data).each(function(index){
							html += "<option value=\""+data[index].id+"\">"+data[index].name+"</option>";
						});
						$("#belong_Area").append(html);
					}
				});
			});

			//选择弹出角色
			$("#link_roleid").click(function(){
				$("#roleDiv").css("display","block");
				$("#zhezhao_div").css("display","block");
			});


			//清空事件
			$("#clear").click(function(){
				//清空角色文本框
				$("#role_names").val("");
				//清空隐藏域
				$("#role_ids_hidden").val("");
			});

			//全选按钮事件
			$("#chk_all").click(function(evt){
				$(".check").prop("checked",$(this).prop("checked")||false);
			});

			//角色列表取消按钮事件
			$('#qx').on('click',function(){
				$('#roleDiv').css('display','none');
				$("#zhezhao_div").css("display","none");
			});

			$("#del_x").on('click',function(){
				$('#roleDiv').css('display','none');
				$("#zhezhao_div").css("display","none");
			});

			//角色列表确定按钮事件
			$("#confirm").click(function(){
				getChecked(function(chks){
					//给角色文本框和隐藏域赋值
					//var ids = chks.serialize();
					var ids = [];
					var names = [];
					$("input[name='ids']:checked").each(function(){
						ids.push($(this).val());
						var name = $(this).parent().next().html();
						names.push(name);
					});
//					alert(ids);
//					alert(names);
					$("#role_names").val(names);
					$("#role_ids_hidden").val(ids);
				});
				$("#roleDiv").css("display","none");
				$("#zhezhao_div").css("display","none");
			});

			function getChecked(callback){
				var chks = $(".check:checked");
				if(!chks.size()){
					alert("请至少选择一条记录！");
				}else{
					if($.isFunction(callback)){
						callback(chks);
					}
				}
			}

			//取消
			$("#cancel").click(function(){
				window.location.href="${ctx}/user/list";
			});

		});

	</script>
</head>

<body>

<div class="zhezhao" id="zhezhao_div"></div>
<div class="cont_txt">
	<p class="MUsers">系统管理-用户管理</p>

	<div class="tab_head">
		<ul>
			<li>
				<a href="${ctx}/user/list">
					<span>
						<c:if test="${userEntity.id==null}">
						    新增用户
						</c:if>
						<c:if test="${userEntity.id!=null}">
							编辑用户
						</c:if>
					</span>
				</a>
			</li>
			<li>
		</ul>
	</div>
			<!--嵌套-->
			<div class="container col-sm-8" style="margin-top:20px;">

					<form class="form-horizontal" id="add_form" method="post" action="${ctx}/user/save">

						<input type="hidden" name="id" value="${userEntity.id}"/>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>用户名:</label>
						<div class="col-sm-5">
							<c:if test="${empty userEntity.id}">
								<input type="text" class="form-control" id="username" name="username" value="" placeholder="用户名">
								<span class="help-inline"></span>
							</c:if>
							<c:if test="${!empty userEntity.id}">
								<span>${userEntity.username}</span>
							</c:if>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>真实姓名:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="realname" name="realname" value="${userEntity.realname}" placeholder="真实姓名">
							<span class="help-inline"></span>
						</div>
					</div>


					<c:if test="${empty userEntity.id}">
						<div class="form-group">
							<label class="col-sm-2 control-label"><span class="red">* </span>密码:</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="password" name="password" value="${userEntity.password}" placeholder="密码">
								<span class="help-inline"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"><span class="red">* </span>重复密码:</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="repassword" name="repassword" value="${userEntity.password}" placeholder="重复密码">
								<span class="help-inline"></span>
							</div>
						</div>
					</c:if>


					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>用户职能:</label>
						<div class="col-sm-5">
							<select class="form-control" name="zhengfuid" id="zhengfuid">
								<c:forEach items="${typeList}" var="type">
									<c:if test="${userEntity.zhengfuid eq type.code}">
										<option id="${type.id}" value="${type.code}" selected>${type.name}</option>
									</c:if>
									<c:if test="${userEntity.zhengfuid ne type.code}"></c:if>
										<option id="${type.id}" value="${type.code}">${type.name}</option>
								</c:forEach>
							</select>
							<span class="help-inline"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>手机号码:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="mobile" name="mobile" value="${userEntity.mobile}" placeholder="手机号码">
							<span class="help-inline"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>省份:</label>
						<div class="col-sm-5">
							<select class="form-control" name="belong_Province" id="belong_Province">
								<option id="0">请选择</option>
								<c:forEach items="${provinceList}" var="area">
									<c:if test="${userEntity.belong_Province eq area.id}">
										<option id="${area.id}" value="${area.id}" selected>${area.name}</option>
									</c:if>
									<c:if test="${userEntity.belong_Province ne area.id}">
										<option id="${area.id}" value="${area.id}">${area.name}</option>
									</c:if>
								</c:forEach>
							</select>
							<span class="help-inline"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>城市:</label>
						<div class="col-sm-5">
							<select class="form-control" name="belong_City" id="belong_City">
                                 <c:forEach items="${cityList}" var="city">
									 <c:if test="${userEntity.belong_City eq city.id}">
										 <option value="${city.id}" selected>${city.name}</option>
									 </c:if>
									 <c:if test="${userEntity.belong_City ne city.id}">
										 <option value="${city.id}">${city.name}</option>
									 </c:if>
								 </c:forEach>
							</select>
							<span class="help-inline"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>区县:</label>
						<div class="col-sm-5">
							<select class="form-control" name="belong_Area" id="belong_Area">
								<c:forEach items="${areaList}" var="area">
									<c:if test="${userEntity.belong_Area eq area.id}">
										<option value="${area.id}" selected>${area.name}</option>
									</c:if>
									<c:if test="${userEntity.belong_Area ne area.id}">
										<option value="${area.id}">${area.name}</option>
									</c:if>
								</c:forEach>
							</select>
							<span class="help-inline"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>角色:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="role_names" value="${roleNames}" placeholder="" disabled="disabled">
							<input type="hidden" class="form-control" id="role_ids_hidden" name="role_ids" value="${userEntity.role_ids}" placeholder="">
						</div>
						<a href="javascript:void(-1);" id="link_roleid">
							<span class="l-btn-text icon-search l-btn-icon-left">选择</span>
						</a>
						<a href="javascript:void(-1);" id="clear">
							<span class="l-btn-text icon-search l-btn-icon-left">清空</span>
						</a>
						<span class="validform_checktip">角色可多选</span>
						<span class="help-inline"></span>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="red">* </span>常用邮箱:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="email" name="email" value="${userEntity.email}" placeholder="常用邮箱">
							<span class="help-inline"></span>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">保存</button>
							<button type="button" class="btn btn-primary" id="cancel">取消</button>
						</div>
					</div>

			       </form>
		         </div>
				</div>
			</div>
		</div>
	</div>

<div class="mode-select" id="roleDiv">
	<h4>角色列表<span id="del_x"></span></h4>
	<div class="table_main">
			<table border="1" align="center" width="100%" bordercolor="#d3d3d3">
					<tr>
						<th style="width:8%;"></th>
						<th style="width: 8%; text-align: center"><input type="checkbox" id="chk_all"/></th>
						<th style="text-align: center;">角色名称</th>
					</tr>
					<c:forEach items="${roleEntityList}" var="role" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><input type="checkbox" name="ids" class="check" value="${role.id}"/></td>
							<td>${role.role_name }</td>
						</tr>
					</c:forEach>
			</table>
	</div>

	<div class="foot_bt">
		<p>
			<input type="submit" id="confirm" value="确定" />
			<input type="button" id="qx" value="取消" />
		</p>
	</div>
</div>

</body>
</html>
