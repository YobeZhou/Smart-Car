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


<div style="margin-left: 80px;margin-right: 80px; margin-top: 10px">

	<nav class="nav">
		<div class="row">
			<div class="col" id="turnup_led" name="turnup_led" >
				<a>舵机左转</a>
			</div>
			<div class="col" id="turnoff_led" name="turnoff_led" >
				<a>舵机右转</a>
			</div>
		</div>



	</nav>


<section class="banner">
		<!--  高度        ; 颜色          ; -->
		<div class="focus" style="height:auto; width:auto;  background:#666;">
			  <img id="img" src="http://100.100.100.4:8080/?action=stream" /> <!-- snapshot -->
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
		  imgsrc.src = "http://100.100.100.4:8080/?action=stream";  
	}
</script>
</html>
