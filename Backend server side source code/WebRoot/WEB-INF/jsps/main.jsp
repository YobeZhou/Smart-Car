<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/left.css" rel="stylesheet" type="text/css" />
<title>智能小车管理系统主页</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/dtree.js"></script>
<script type="text/javascript">

	function showMsg(msg){
		confirm(msg);
	}
</script>
</head>
<body>
<!-- 

什么时候存到   em

 -->
	<div class="container">
		<div class="head">
		 <span style="font-weight:bold; color:#1f4906;position:relative;left:40px; top:15px">欢迎您-</span><br /> 
			<div class="head-left">
				 <span
					style="font-weight:bold;color:#4a940d ; top:0px;" > ${session['loginEm'].name} </span>
			</div>
			<div class="head-right">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="32%"><a href="emp_toChangePwd.action"
							target="main"> <img src="images/head-l.gif" border="0" /> </a>
						</td>
						<td width="26%"><a href="emp_logout.action"> <img
								src="images/head-m.gif" border="0" /> </a>
						</td>
						<td width="7%">&nbsp;</td>
						<td width="35%"><a href="#"><img src="images/head-r.gif"
								border="0" /> </a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!--"head"end-->

		<div class="content">
			<div class="left" style="height: 650px;">
				<div style="margin-left:2px;">
					<img src="images/left-top.gif" width="162" height="25" />
				</div>
				<div class="left-bottom">
				
					<table width="100%" border="0">
						<tr>
							<td>
								<div class="dtree">

									<a href="javascript: d.openAll();">展开所有</a> | <a
										href="javascript: d.closeAll();">关闭所有</a>
									<link rel="StyleSheet"
										href="${pageContext.request.contextPath}/css/dtree.css"
										type="text/css" />
									<script type="text/javascript"
										src="${pageContext.request.contextPath}/js/dtree.js"></script>
									<script type="text/javascript">
										//<!--
										var findByuid = "";
										d = new dTree('d');
										d.add('01', -1, '系统菜单树');
										d.add('0101', '01', '用户管理', '', '',
												'main');
										d
												.add(
														'010101',
														'0101',
														'用户管理',
														/* "${pageContext.request.contextPath}/user_findByuid.action?uid=<s:property value="#session.existUser.uid"/>" */     
														"emp_findUser.action?uuid=<s:property value="#session['loginEm'].uuid"/>"             
																+ "&t="
																+ new Date()
																		.getTime(),
														'', 'main');
														
											d
												.add(
														'010103',
														'0101',
														'上锁解锁',
														"page_camera.action",             
														'', 'main');
														

										d.add('0103', '01', '设备状态', '', '',
												'main');
										d
												.add(
														'010301',
														'0103',
														'查询所有设备',
														'${pageContext.request.contextPath}/sensors_find.action',
														'', 'main');

										d
												.add(
														'010303',
														'0103',
														'温度',
														'${pageContext.request.contextPath}/sensors_chartFCF.action?sqe.msg=temp',
														'', 'main');
/* 
										d
												.add(
														'010305',
														'0103',
														'人体监测',
														'${pageContext.request.contextPath}/img_p.action',
														'', 'main');
														 */
										d
												.add(
														'010307',
														'0103',
														'监控信息',
														'${pageContext.request.contextPath}/img_adminFindAll.action?page=1',
														'', 'main');
											d
												.add(
														'010309',
														'0103',
														'查看监控',
														'${pageContext.request.contextPath}/img_toVideo.action',
														'', 'main');
											
														
										d.add('0104', '01', '控制中心', '', '',
												'mainFrame');
										d
												.add(
														'010401',
														'0104',
														'控制小车',
														'${pageContext.request.contextPath}/sensors_control.action',
														'', 'main');

										document.write(d);
									</script>
								</div></td>
						</tr>
					</table>
 


				</div>
				<!--"left-bottom"end-->
			</div>
			<!--"left"end-->

			<iframe id="frame-contect" src="page_context.action"
				style="width:848px;float:right;height:650px" scrolling="no"
				name="main" frameborder="0"></iframe>
			<!--"content-right"end-->
		</div>
		<!--"content"end-->
		<div class="footer">
			<div style="margin-top:5px;">
				<table width="98%" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td width="82%"><img src="images/icon_1.gif" />&nbsp; <a
							class="lanyo" href="#">Explorer_Beyond_Limit 2017</a></td>
						<td width="18%" valign="middle"><img src="images/icon_2.gif" />&nbsp;
							<a class="lanyo" href="javascript:void(0)" onclick="showMsg('请致电技术人员：\n 李工：17724272754')">如有疑问请与技术人员联系</a></td>
					</tr>
				</table>
			</div>

		</div>
		<!--"footer"end-->
	</div>
	<!--"container"end-->
	<%@include file="/WEB-INF/jsps/tools/mask.jsp"%>
</body>
</html>
