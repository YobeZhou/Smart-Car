<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<title>智能小车管理系统登录页</title>
<script>
	$(function() {
		$("#login_ok").click(function() {
			$("form:first").submit();
		});
	});
	
</script>
</head>
<body>
				<s:actionerror/>
	<div class="container-login">
		<div class="login-pic">
			<div class="login-text">
				<s:form action="emp_login" method="post" target="_parent">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<!-- <td width="19%" height="28">用户名：</td> -->
							<td width="21%" height="31"></td>
							<td colspan="2">
								<s:textfield name="em.userName" size="26" value="admin"/>
							</td>
						</tr>
						<tr>
							<!-- <td height="31">密&nbsp;&nbsp;码：</td> -->
							<td  height="42"></td>
							<td colspan="2">
								<s:password name="em.pwd" size="26" value="admin"/>
							</td>
						</tr>
						<!-- <tr>
							<td height="30">验证码：</td>
							<td width="43%">
								<input type="text" size="9" />
							</td>
							<td width="32%"><img src="images/test.gif" />
							</td>
						</tr> -->
						<tr>
							<td height="69">&nbsp;</td>
							<td colspan="2">
								<a href="javascript:void(0)" id="login_ok" style="margin-left: 20px;">   <!-- images/head-m.gif -->
									<img src=" images/head-m.gif " 
										 name="Image1" width="100"	
										 height="30" border="0"
										 onmouseover="MM_swapImage(this,'images/giveup_h_03.gif')" 
										 onmouseout="MM_swapImage(this,'images/giveup_bg_03.gif')"
										  /></a>
								
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>
