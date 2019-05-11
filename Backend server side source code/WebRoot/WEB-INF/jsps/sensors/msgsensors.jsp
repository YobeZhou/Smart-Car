<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style.css"
	type="text/css" rel="stylesheet">


</HEAD>
<body>
 	<form action="${pageContext.request.contextPath}/sensors_find.action" name="Form1" enctype="multipart/form-data" >
		&nbsp;


		
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

			<br>

			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>查看数据</STRONG> </strong>
				</td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					当前温度：</td>
				<td class="ta_01" bgColor="#ffffff"">
					 <s:property value="#session.temp" /> 
				
				</td>

			
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>查看监控</STRONG> </strong>
				</td>
			</tr>
		</table>
		
		
		<!-- <img id="imgStatic" src="http://100.100.100.3:8080/?action=snapshot" style=" margin-left: 150px;"/> -->
		<img id="img" src="http://100.100.100.4:8080/?action=stream" style="height: 70%;"/> 
			</br>
			</br>
		<!-- <input type="button" value="点击刷新数据"  onclick="javascrtpt:window.location.href='/img_p.action'"> -->
		<input    type="button" value="保存视频截图"  onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/img_p.action'">
		<button type="submit">点击刷新数据</button>
	</form> 
	
	
</body>
</HTML>