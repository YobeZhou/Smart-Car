package limit.beyond.explore.auth.sensors.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import limit.beyond.explore.auth.sensors.business.ebi.SensorsEbi;
import limit.beyond.explore.auth.sensors.vo.SensorsModel;
import limit.beyond.explore.auth.sensors.vo.SensorsQueryModel;
import limit.beyond.explore.util.base.BaseAction;
import limit.beyond.explore.util.utils.senPost;

import org.apache.struts2.ServletActionContext;

public class SensorsAction extends BaseAction{

	public SensorsModel se = new SensorsModel(); 
	public SensorsQueryModel sqe = new SensorsQueryModel();
	
	private SensorsEbi sensorsEbi;

	public void setSensorsEbi(SensorsEbi sensorsEbi) {
		this.sensorsEbi = sensorsEbi;
	} 
	
	
	public String save(){
		se.setUser("6");
		se.setTemp(se.getTemp());
		sensorsEbi.save(se);
		return "save";
	}
	
	public String chartFCF() {
		String t1;
		String t2;
		if (sqe.day == null) {
			List<SensorsQueryModel> daylist = sensorsEbi.checkTime("temp");
			String daychek = daylist.toString();
			sqe.day = daychek.substring(12, 22);
		}
		if (sqe.time1 == null || sqe.time1.equals("")) {
			t1 = sqe.day + " 9:00:00";
		} else {
			t1 = sqe.day + " " + sqe.time1;
		}
		if (sqe.time2 == null || sqe.time2.equals("")) {
			t2 = sqe.day + " 22:00:00";
		} else {
			t2 = sqe.day + " " + sqe.time2;
		}
		
		List<SensorsQueryModel> timelist = sensorsEbi.checkTime("temp");
		
		String timechek = timelist.toString();
		
		List<SensorsQueryModel> list = sensorsEbi.chartTime("temp", t1, t2);

		int size = list.size();
		
		if (size == 0) {
			return "error";
		}

		
		StringBuilder builder = new StringBuilder();
		
		for (int i = 0; i < size; i++) {
			String getlist = String.valueOf(list.get(i));
			String xvalue = getlist.substring(25, getlist.indexOf("}")-2);
			String yvalue = getlist.substring(6,
					getlist.indexOf(",")); 
			if (i == 0) {// 组织第一个值
				String x = "已经记录的数据";
				String y = "unit";
				builder.append("<graph baseFont='SunSim' baseFontSize='12' caption='The Car Data ICon' subcaption='' yAxisMinValue='0' yAxisMaxValue='2' xaxisname='Time' yaxisname='' hovercapbg='FFECAA' hovercapborder='F47E00' formatNumberScale='0' decimalPrecision='0' showvalues='1' numdivlines='20' numVdivlines='0' shownames='1' rotateNames='1'  lineThickness='0.1' anchorRadius='2' >");
				builder.append("<set name='" + xvalue + "' value='" + yvalue
						+ "' color='AFD8F8'/>");
			} else if (i == size - 1) {// 组织最后一个值
				builder.append("<set name='" + xvalue + "' value='" + yvalue
						+ "' color='FF8E46'/>");
				builder.append("</graph>");
			} else {
				if (size > 30) {
					if (i % 5 != 0) {
						builder.append("<set name='' value='" + yvalue
								+ "' color='AFD8F8'/>");
					} else {
						builder.append("<set name='" + xvalue + "-' value='"
								+ yvalue + "' color='AFD8F8'/>");
					}
				}else{
					builder.append("<set name='" + xvalue + "-' value='"
							+ yvalue + "' color='AFD8F8'/>");
				}
			}

		}
		ServletActionContext.getRequest().getSession()
		.setAttribute("maxtime", maxtime);
		ServletActionContext.getRequest().getSession()
		.setAttribute("mintime", mintime);
		
		ServletActionContext.getRequest().getSession()
				.setAttribute("chartqwe", builder);// request中存放XML格式的数据
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd");
		String retStrFormatNowDate = sdFormatter.format(time);
		ServletActionContext.getRequest().getSession()
				.setAttribute("time", retStrFormatNowDate);
	
		return "chartFCF";
	}
	
	public String find(){
		
		List<SensorsModel> lSensors =  sensorsEbi.getNew();

		String msg1 = lSensors.toString();
		String temp = msg1.substring(7, msg1.indexOf(","));
		
		ServletActionContext.getRequest().getSession()
		.setAttribute("temp", temp);
		
		return "find";
	}
	
	public String msg() {

		 String parm = "a="+sqe.a+"&x="+sqe.x+"&y="+sqe.y;
		 System.out.println(parm);
		 String sr=senPost.sendPost("http://100.100.100.4/?", parm);

		
		return null;
	}
	
	public String control(){
		
		return "toConrol";
	}
}

