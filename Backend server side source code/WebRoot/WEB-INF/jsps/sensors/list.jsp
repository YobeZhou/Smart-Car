<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="zh-cn">
<link rel="stylesheet" type="text/css"
	href="css/style-projects-jquery.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/jquery.lightbox-0.5.css" media="screen" />

<!-- 192.168.1.107 -->
<script type="text/javascript">
	function addimg() {
		window.location.href = "${pageContext.request.contextPath}/img_addPage.action";
	}
</script>
<script type="text/javascript">
	$(function() {
		$('#gallery div a').lightBox();
	});
	function showMsg(msg,id){
		//显示遮罩层
		top.lock.show();
		//显示数据区
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML = msg;
		top.$('hid-action').value = "img_delete.action?.id="+id;   //  就是把这个值传给遮罩层页面，然后遮罩层点确定就可以发这个请求
	}
</script>
<style type="text/css">
/* jQuery lightBox plugin - Gallery style */
#gallery {
/* 	background-color: #444;
 	 padding: 10px; 
	width: 520px;  */
}

#gallery ul {
	list-style: none;
}

#gallery ul li {
	display: inline;
}

</style>
</HEAD>
<body>

	<div class="content-right">
	
		<div class="content-text">



			<form id="Form1" name="Form1"
				action="${pageContext.request.contextPath}/user/list.jsp"
				method="post">
				<table cellSpacing="1" cellPadding="0" width="100%" align="center"
					bgColor="#f5fafe" border="0">
					<TBODY id="gallery">
						<tr>
							<td class="ta_01" align="center" bgColor="#afd1f3"><strong>截
									图 列 表</strong>
							</TD>
						</tr>

						<tr>
							<td class="ta_01" align="center" bgColor="#f5fafe">
								<table cellspacing="0" cellpadding="1" rules="all"
									bordercolor="gray" border="1" id="DataGrid1"
									style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
									<tr
										style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

										<td align="center" width="5%">序号</td>
										<td align="center" width="8%">图片</td>
										<td align="center" width="10%">名称</td>
										<td align="center" width="8%">记录时间</td>

										<td width="7%" align="center">删除</td>
									</tr>

									<s:iterator var="p" value="pageBean.list" status="status" >
									
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">

											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="5%"><s:property value="#status.count" />
											</td>


											<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%" >
													<div style="width: 50px;">
            												<a href="<s:property value="#p.path"/>" title="查看图片<s:property value="#p.name"/>">
               													 <img width="45" height="50" src="${pageContext.request.contextPath}/<s:property value="#p.path"/>"/>
           													</a>
       												</div>
       													
											</td>
											
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%"><s:property value="#p.name" />
											</td>

											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="8%"><s:property value="#p.time" />
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="8%"> 
												<a href="${pageContext.request.contextPath}/img_delete.action?id=<s:property value="#p.id"/>">删除</a>
											</td>
										</tr>
									</s:iterator>
									
									<%@ include file="/WEB-INF/jsps/tools/paging.jsp" %>
									
									
								
									
									
									
									
									<tr
										style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

										<td align="center" width="18%" colspan="8">第 <input
											name="page" Style="width: 30px"
											value="<s:property value="pageBean.page"/>" />/<s:property
												value="pageBean.totalPage" />页 <s:if
												test="pageBean.page != 1">
												<a
													href="${ pageContext.request.contextPath }/img_adminFindAll.action?page=1">首页</a> |
											<a
													href="${ pageContext.request.contextPath }/img_adminFindAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a> |
										</s:if> <s:if test="pageBean.page != pageBean.totalPage">
												<a
													href="${ pageContext.request.contextPath }/img_adminFindAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a> |
											<a
													href="${ pageContext.request.contextPath }/img_adminFindAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
											</s:if>
										</td>

									</tr>
								</table>
							</td>
						</tr>
					</TBODY>
				</table>
			</form>




		</div>
		<!--"content-text"end-->
		<div class="content-bbg">
			<img src="images/content_bbg.jpg" />
		</div>
	</div>

</body>
</HTML>

