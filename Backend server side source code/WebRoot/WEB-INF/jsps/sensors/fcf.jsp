<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="JavaScript"
	src="${pageContext.request.contextPath }/js/FusionCharts.js"></script>
<script language="javascript" type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<title>图</title>
</head>
<body>

	<table align='center' border="1">
		<!-- <caption style="font: 40px;">智能小车 数据分析 （温度）</caption>   -->

		<div style="margin: 50px auto 20px 200px;">
			<font"15">智能小车数据分析 ${sqe.msg} ${sqe.day} 的记录</font>
		</div>
		
		
		<form action="${pageContext.request.contextPath}/sensors_chartFCF.action?sqe.msg=temp" method="post" > 
	
	
		
		
			查找记录：<input type="text" class="Wdate" id="d412" name="sqe.day"
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'${mintime}',maxDate:'${maxtime}'})"
				value="${time}" />
				
				
				<!-- <input type="text" class="Wdate" id="d414" onfocus="WdatePicker({dateFmt:'H:mm:ss',minDate:'00:00:00',maxDate:'11:59:00'})"/> -->
				<input id="d4311" name = "sqe.time1" class="Wdate" type="text" onFocus="WdatePicker({ dateFmt:'H:mm:ss', qsEnabled:false, maxDate:'#F{$dp.$D(\'d4312\')||\'23:599:59\'}'})"/> 
				<input id="d4312" class="Wdate" name="sqe.time2"  type="text" onFocus="WdatePicker({ dateFmt:'H:mm:ss',qsEnabled:false, minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'23:599:59'})"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">提交查询</button>
		</form>
		<tr>
			<td>
				<div id='Pie' align="center">

					<script type="text/javascript">
						/* 	var xhr = createXMLHttpRequest();
							var dataXML = xhr.responseText; */

						var chart = new FusionCharts(
								'${pageContext.request.contextPath }/fusionCharts/FCF_Line.swf',
								"ChartId", "600", "400");
						chart.setDataXML("${chartqwe}");    

						//chart.setDataXML("<graph baseFont='SunSim' baseFontSize='12' caption='The Car Data ICon' subcaption='' yAxisMinValue='30' yAxisMaxValue='45' xaxisname='Time' yaxisname='Angle' hovercapbg='FFECAA' hovercapborder='F47E00' formatNumberScale='0' decimalPrecision='0' showvalues='1' numdivlines='20' numVdivlines='0' shownames='1' rotateNames='1'><set name='2017-05-06 12:02:53' value='90' color='AFD8F8'/><set name='2017-05-06 12:02:53' value='91' color='AFD8F8'/><set name='2017-05-06 12:02:53' value='92' color='AFD8F8'/><set name='2017-05-06 12:03:03' value='90' color='AFD8F8'/><set name='2017-05-06 12:03:03' value='91' color='AFD8F8'/><set name='2017-05-06 12:03:03' value='92' color='AFD8F8'/><set name='2017-05-06 12:03:13' value='90' color='AFD8F8'/><set name='2017-05-06 12:03:13' value='91' color='AFD8F8'/><set name='2017-05-06 12:03:13' value='92' color='FF8E46'/></graph>");
						/*  chart.setDataXML("${chartqwe}");*/
						/* !!! 这个不能删！！！！！！！！*/
						/*  chart.setDataURL('/EBL/sensors/Data.xml')  ; */
						chart.render('Pie');
					</script>
				</div>
			</td>
		</tr>

	</table>
 </body>

</html>

 
