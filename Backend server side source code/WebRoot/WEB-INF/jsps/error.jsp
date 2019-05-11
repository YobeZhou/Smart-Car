<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<style>
	.errorMessage{
		color:red;
	}
</style>
<s:actionerror/> --%>
<%@ page language="java"  pageEncoding="UTF-8"%>

</HEAD>
<BODY bgcolor="#FFFFFF" onload = "showTimer()" "> 
<Form name="form1" method="POST">
<table border="0" width="100%" id="table1" height="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center">
		<table border="0" width="60%" id="table2" cellspacing="0" cellpadding="0">
			<tr>
				<td style="word-break:break-all" align="center">
					<font face="黑体" size="4" color="red">
						<b>非法操作！系统将在5秒中内跳转到登录页面</b>
                	</font>
                </td>
			</tr>
			<tr>
				<td width="39" height="34"></td>
				<td style="word-break:break-all" align="center">
					<font face="黑体" size="3" color="red">
						<div id ="timer" style="color:#999;font-size:20pt;text-align:center"></div>
                	</font>
                </td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</Form>
</BODY>
<script>
var i=6;
var t;
function showTimer(){
 if(i==0){
  window.parent.frames.location.href="page_main.action";

  }else{
  i = i - 1 ;
  document.getElementById("timer").innerHTML= i+"秒";
  }
}
t = window.setInterval(showTimer,1000);
</script>