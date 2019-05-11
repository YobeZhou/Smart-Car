<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8" />
<!-- <metahttp-equiv="Pragma"content="no-cache">  -->


<!-- 视口标签 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- 删除苹果默认的工具栏和菜单栏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 设置苹果工具栏颜色 -->
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!-- 忽略页面中的数字识别为电话，忽略email识别 -->
<meta name="format-detection" content="telphone=no, email=no" />
<!-- 启用360浏览器的极速模式(webkit) -->
<meta name="renderer" content="webkit">
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
<meta name="HandheldFriendly" content="true">
<!-- 微软的老式浏览器 -->
<meta name="MobileOptimized" content="320">
<!-- uc强制竖屏 -->
<meta name="screen-orientation" content="portrait">
<!-- QQ强制竖屏 -->
<meta name="x5-orientation" content="portrait">
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes">
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true">
<!-- UC应用模式 -->
<meta name="browsermode" content="application">
<!-- QQ应用模式 -->
<meta name="x5-page-mode" content="app">
<!-- windows phone 点击无高光 -->
<meta name="msapplication-tap-highlight" content="no">
<!-- 适应移动端end -->
<title>biubiu</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index_CL.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>


<script type="text/javascript">

	$(function() {
		var c = document.getElementById("cav_dir");
		var cxt = c.getContext("2d");

		var r = 150
		var a = 9

		cxt.beginPath();
		cxt.fillStyle = "rgba(0, 255, 0, 0.5)";
		cxt.arc(r, r, r, 0, Math.PI * 2, false);
		cxt.closePath();

		cxt.lineWidth = 2
		cxt.strokeStyle = "rgba(255,0,0,0.5)";
		cxt.moveTo(0, r - 1)
		cxt.lineTo(2 * r, r - 1)
		cxt.moveTo(r - 1, 0)
		cxt.lineTo(r - 1, 2 * r)
		cxt.stroke()

		cxt.fill();

		function run(event) {
			event = event || window.event
			event.preventDefault()
			var x = event.touches[0].clientX - r
			var y = event.touches[0].clientY - r
			var oInp = document.getElementById("spn");
			oInp.innerHTML = '(' + x + ',' + y + ')'
			if (x * x + y * y < r * r) {
				$.post('/?sqe.x=' + x + '&sqe.y=' + y + '&sqe.a=' + a)
			}
		}

		function stop(event) {
			event = event || window.event
			event.preventDefault()
		}
		setTimeout(function() {
		}, 500);

		c.addEventListener('touchstart', run, false);
		c.addEventListener('touchmove', run, false);
		c.addEventListener('touchend', stop, false);

	})
	$(document).ready(function() {

		$("#turnup_led").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 7,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#turnoff_led").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 8,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#acceleration").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 5,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#deceleration").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 6,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#stop").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 0,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#sensor").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 9,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#auto_run").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 233,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
		$("#stop_auto_run").click(function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/sensors_msg.action",
				data : {
					"sqe.a" : 23,
					"sqe.x" : 0,
					"sqe.y" : 0
				},
				dataType : "json",
				cache : "false",
				success : function(data) {
				},
				error : function(data) {
				}
			});
		});
	});
	$(document).ready(function() {
		setInterval("mydata()", 1000);
	});
	function mydata() {
		$.ajax({
			type : "get",
			cache : false,
			async : false,
			url : "${pageContext.request.contextPath}/sensors_msg.action?sqe.Ult=1",
			success : function(data) {
				var o = $("#ajaxData");
				var temp = "<li>" + data + "</li>";
				if (o.find("li").size() > 0) {
					o.find("li").remove();
				}
				o.find("ul").append(temp);
			},
			error : function(http) {
			},
			complete : function(http) {
			}
		});
	}
</script>
</head>

<body>


<div style="margin-left: 80px;margin-right: 80px; margin-top: 30px">
	  <footer class="footer">
		<div class="row">
			<!-- <div class="circle"> -->
				<canvas id="cav_dir" width ="0" height="0">
      			  您的浏览器不支持。
 		   </canvas>

			<!-- </div> -->
		</div>
		<div id="spn" style="text-align:center">xyz</div>
	</footer> 


	<nav class="nav">
	
		
			<div class="row">
			<div class="col" id="acceleration" name="acceleration">
				<a>加速</a>
			</div>
			<div class="col" id="deceleration" name="deceleration">
				<a>减速</a>
			</div>
		</div>
			<div class="row">
			<div class="col" id="sensor" name="sensor">
				<a>显示温度</a>
			</div>
			<div class="col" id="stop" name="stop">
				<a>停止</a>
			</div>
		</div>
		
		<div class="row">
			<div class="col" id="auto_run" name="auto_run">
				<a>自动驾驶</a>
			</div>
			<div class="col" id="stop_auto_run" name="stop_auto_run">
				<a>手动驾驶</a>
			</div>
		</div>
	
		<div class="row">
			<div class="col" id="turnup_led" name="turnup_led">
				<a>摄像头左转</a>
			</div>
			<div class="col" id="turnoff_led" name="turnoff_led">
				<a>摄像头右转</a>
			</div>
		</div>

	
		<div class="row">
			<div class="col" id="butnhide" name="butnhide">
				<a>上锁</a>
			</div>
			<div class="col" id="butn" name="butn">
				<a>解锁</a>
			</div>
		</div>



	</nav>



	<div id="ajaxData" style="width: 100px; text-align: center;">
		<ul>
			This is a message
		</ul>
	</div>


<section class="banner">
		<!--  高度        ; 颜色          ; -->
		<div class="focus" style="height:auto; width:auto;  background:#666;">
			<!--   <img id="img" src="http://100.100.100.3:8080/?action=stream" />  -->
		</div>
	</section>
</div>	
</body>
<script type="text/javascript">
	var btn = document.getElementById("butnhide");
	var btn2 = document.getElementById("butn");
	var imgsrc = document.getElementById("img");
	btn.onclick = function() {
		imgsrc.src = "";
	}
	btn2.onclick = function() {
		 /* imgsrc.src = "http://100.100.100.1:8080/?action=stream";  */
	}
</script>
</html>



<%-- 
	<section class="banner"> <!--  高度        ; 颜色          ; -->
	<div id="forms" class="focus" style="height:auto; width:auto;  background:#666;">
		<!-- <img id="img" src="http://192.168.0.134:8080/?action=stream "/> -->
	</div>
	</section>
	
<form id="pctiure" action="${pageContext.request.contextPath}/img_picture.action">
		<img id="imgStatic" src="http://192.168.0.101:8080/?action=snapshot"/>
</form>
	
	
</body>
<script type="text/javascript">
	var btn = document.getElementById("butnhide");
	var btn2 = document.getElementById("butn");
	var imgsrc = document.getElementById("img");
	btn.onclick = function() {
		imgsrc.src = "";
	}
	btn2.onclick = function() {
		/*  imgsrc.src = "http://192.168.42.1:8080/?action=stream";  */
		  imgsrc.src = "http://192.168.0.101/?action=stream"; 
	}
	
	
	var imgStatic = document.getElementById("imgStatic");
	imgStatic.onclick = function() {
		  document.getElementById("pctiure").submit();
		  alert("保存成功");
	}
	
</script>
</html> --%>