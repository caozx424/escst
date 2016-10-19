<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body,html,#allmap {
			width: 100%;
			height: 100%;
			overflow: hidden;
			margin: 0;
			font-family: "微软雅黑";
		}
		#r-result,#r-result table{width:100%;}
		li:hover{background-color:#888;color:#fff;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3bb801b79151585f9534ed9ed7ff280d"></script>
<title>BaiduMap</title>
</head>
<body>
  <div id="showbd"
    style="position: absolute;
                margin-top:1px; 
                width: 80%; 
                height: 100%; 
                top: 10; 
                overflow:hidden;">
   </div>   
</body> 
</html>

<script type="text/javascript">
	// 百度地图API功能
	var slt = document.getElementById("aa");
	var map = new BMap.Map("showbd");
	
	map.setCurrentCity("武汉市");
	map.enableScrollWheelZoom(true); //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom(true); //启用地图惯性拖拽，默认禁用
	map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, offset: new BMap.Size(10, 50)})); //初始化地图控件              
	map.addControl(new BMap.ScaleControl());
	//map.addControl(new BMap.OverviewMapControl());
	map.addControl(new BMap.MapTypeControl());        //添加地图类型控件
	map.centerAndZoom(new BMap.Point(114.29435000000001 , 30.57863), 11);
	
	
	// 定义一个控件类,即function
	function ZoomControl(){
	  // 默认停靠位置和偏移量
	  this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
	  this.defaultOffset = new BMap.Size(10, 10);
	}

	// 通过JavaScript的prototype属性继承于BMap.Control
	ZoomControl.prototype = new BMap.Control();
	
	// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
	// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
	ZoomControl.prototype.initialize = function(map){
	  // 创建一个DOM元素
	  var div = document.createElement("div");
	  var input = document.createElement("input");
	  input.type = "text";
	  // 添加文字说明
	  //div.appendChild(document.createTextNode("<input type='text' name='searchMsg'/>"));
	  // 设置样式
	  input.style.cursor = "pointer";
	  input.style.width = "200px";
	  input.style.height = "25px";
	  input.style.border = "1px solid gray";
	  //input.style.backgroundColor = "transparent";
	  input.style.opacity = "0.5";
	  
	  var ul = document.createElement("ul");
	  ul.style.width = "200px";
	  ul.style.border = "1px solid gray";
	  ul.style.backgroundColor = "#FFFFFF";
	  ul.style.opacity = "0.8";
	  //给搜索框添加事件
	  input.onkeyup = function(){
	  	var inputValue = $(this).val();
	  	
	  	while (ul.hasChildNodes()) {
		    ul.removeChild(ul.lastChild);
		}

		//模糊查询工地信息
		$.ajax({
			type : "post",
			url : "tblArchitecturalController.do?checkByName",
			data : {
				"architecturalname" : inputValue
			},
			success : function(data) {
				var dataJson = JSON.parse(data);
				for(var i=0;i<dataJson.length;i++){
				  	var li = document.createElement("li");
				  	li.style.width = "200px";
					li.style.height = "35px";
					var latlng = dataJson[i].longitude + "," + dataJson[i].latitude;
					var inputHidden = document.createElement("input");
					inputHidden.type = "hidden";
					inputHidden.value = latlng;
					li.appendChild(inputHidden);
				  	li.appendChild(document.createTextNode(dataJson[i].architecturalname));
				  	ul.appendChild(li);
			  	}

			}
		});

	  	var inputHidden = document.createElement("input");
	  	inputHidden.type = "hidden";
	  	div.appendChild(ul);
	  	div.appendChild(inputHidden);
	  	$("li").click(function(){
	  		deletePoint();
	  		var latlng = $(this).find("input").val();
	  		var textValue = $(this).text();
	  		input.value = textValue;
	  		inputHidden.value = latlng;
	  		var arr = latlng.split(",");
	  		point = new BMap.Point(arr[0],arr[1]);
		    marker = new BMap.Marker(point); // 创建点
		    map.addOverlay(marker);
		    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	  		map.centerAndZoom(point, 16);
	  		
			while (ul.hasChildNodes()) {
			    ul.removeChild(ul.lastChild);
			}
	  		div.removeChild(ul);
  		});
	  	
	  };
            
	  var button = document.createElement("input");
	  button.type = "button";
	  button.style.cursor = "pointer";
	  button.style.width = "40px";
	  button.style.height = "29px";
	  button.style.border = "0px solid gray";
	  //button.style.opacity = "0.5";
	  button.style.backgroundColor = "#8DB6CD";
	  button.value = "搜索";
	  // 添加DOM元素到地图中
	  div.appendChild(input);
	  div.appendChild(button);
	  $("input[type='button']").click(function(){
	  		deletePoint();
	  		var inputValue = $("input[type='text']").val();
	  		if(inputValue != "" && inputValue != null){
		  		//模糊查询工地信息
				$.ajax({
					type : "post",
					url : "tblArchitecturalController.do?checkByName",
					data : {
						"architecturalname" : inputValue
					},
					success : function(data) {
						var dataJson = JSON.parse(data);
						for(var i=0;i<dataJson.length;i++){
							point = new BMap.Point(dataJson[i].longitude,dataJson[i].latitude);
						    marker = new BMap.Marker(point); // 创建点
						    map.addOverlay(marker);
						    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
					  	}
					  	map.centerAndZoom(new BMap.Point(dataJson[0].longitude,dataJson[0].latitude), 16);
					}
				});
				
				while (ul.hasChildNodes()) {
			    	ul.removeChild(ul.lastChild);
				}
		  		div.removeChild(ul);
	  		}
	  		
	  });
	  
	  
	  map.getContainer().appendChild(div);
	  // 将DOM元素返回
	  return div;
	};
	// 创建控件
	var myZoomCtrl = new ZoomControl();
	// 添加到地图当中
	map.addControl(myZoomCtrl);
	
	 <c:if test="${not empty architectures}">
	 	var json_data = [
			<c:forEach items="${architectures}" var="item">
		 		["${item.longitude }", "${item.latitude}",
		 		 "${item.architecturalname }", "${item.id}","${item.condition}",
		 		 "${ctx}/resources/static/images/main/b1.png","${ctx}/resources/static/images/main/b2.png","${item.developmentname }",
		 		 "${item.constructionname }","${item.supervisionname }","${item.range}","${item.isonline}"],
	   	  	</c:forEach>  
   	  	];
   	  
       	var pointArray = new Array();
            var a = 0;
            var b = 0;
	       	for ( var i = 0; i < json_data.length; i++) {
	       		//这里是定位点和显示图片的位置
	       		var point = null;
	       		var marker = null;
	       		if(json_data[i][11]==1){
		       		point = new BMap.Point(json_data[i][0],json_data[i][1]);
		       		marker = new BMap.Marker(point,{icon:new BMap.Icon(json_data[i][5],new BMap.Size(31,40))}); // 创建点
		       		a++;
	       		} else {
		       		point = new BMap.Point(json_data[i][0],json_data[i][1]);
		       		marker = new BMap.Marker(point,{icon:new BMap.Icon(json_data[i][6],new BMap.Size(31,40))});
		       		b++;
	       		}
	       		
				marker.disableMassClear();
	       		map.addOverlay(marker); //增加点
	       		
				var message = "<div><table>"+
									"<tr><td>项目名称：</td><td>"+json_data[i][2]+"</td></tr>"+
									"<tr><td>建设单位：</td><td>"+json_data[i][7]+"</td></tr>"+
									"<tr><td>施工单位：</td><td>"+json_data[i][8]+"</td></tr>"+
									"<tr><td>监理单位：</td><td>"+json_data[i][9]+"</td></tr></table></div>";
				addClickHandler(message,marker);
				
				pointArray[i] = point;
	       		marker.addEventListener("click", attribute);
	       		
	       		//绘制多边形
	       		var latlngStr = json_data[i][10];
	       		if(latlngStr != null && latlngStr != ""){
		  			var arr = latlngStr.split("|");
			    	var lagArr = new Array();
			    	for(var j=0;j<arr.length - 1;j++){
			    	   var sss = arr[j].split(",");
			    	   lagArr[j] = new BMap.Point(sss[0],sss[1]);
			    	}
			    	var polygon = new BMap.Polygon(lagArr, {strokeColor:"red", strokeWeight:3, strokeOpacity:0.8});
			    	map.addOverlay(polygon);   //增加多边形
	       		}
	       	}
	       	
	       	$("#in1").html(a);
	       	$("#in2").html(b);
	       	
	       	var opts = {
				  width : 300,     // 信息窗口宽度
				  height: 120,   // 信息窗口高度
				  title : "项目信息" // 信息窗口标题
				  //enableMessage:true,//设置允许信息窗发送短息
				};
					
	       	function addClickHandler(content, marker) {
		        marker.addEventListener("mouseover", function (e) {
		            openInfo(content, e);
		        });
		    }
		    function openInfo(content, e) {
		        var p = e.target;
		        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		        var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象 
		        map.openInfoWindow(infoWindow, point); //开启信息窗口
		    }
	       	//让所有点在视野范围内
	     //  	map.setViewport(pointArray);
	 </c:if>
	
	function deletePoint(){
		map.clearOverlays();
	}
	
	//获取覆盖物位置
	function attribute(e) {
		var p = e.target;
		for ( var i = 0; i < json_data.length; i++) {
			if(json_data[i][0] == p.getPosition().lng && json_data[i][1] == p.getPosition().lat) {
		
			dochangeproject(json_data[i][3]);
			}
		}
	}

	function dochangeproject(id) {
      var url = "userController.do?dochangeproject";
      url += "&id=" + id;
  	   
      $.dialog.setting.zIndex = 16777271;
      $.dialog.confirm("是否确认更换项目?", function() {
	        $.ajax({
	          async : false,
	          cache : false,
	          type : 'POST',
	          url : url,// 请求的action路径
	          error : function() {// 请求失败处理函数
	        	  alert("error");
	          },
	          success : function(data) {
	            var d = $.parseJSON(data);
	        
	            if (d.success) {
	            
					window.top.location.reload();
	            }
	          }
	        });
	      }, function() {
      	});
      }
</script>
  

