package limit.beyond.explore.auth.sensors.vo;

import limit.beyond.explore.util.base.BaseQueryModel;

public class SensorsQueryModel extends SensorsModel implements BaseQueryModel{

	public String day;
	public String t1 =null;
	public String t2;
	public String getT1() {
		return t1;
	}
	public void setT1(String t1) {
		this.t1 = t1;
	}
	public String getT2() {
		return t2;
	}
	public void setT2(String t2) {
		this.t2 = t2;
	}
	public String time1 ;
	public String time2 ;
	public String mintime ;
	
	public String maxtime;
	public String msg = null;

	public String a;
	public String x;
	public String y;
	public String Ult;
	
	public String getMintime() {
		return mintime;
	}
	public void setMintime(String mintime) {
		this.mintime = mintime;
	}
	public String getMaxtime() {
		return maxtime;
	}
	public void setMaxtime(String maxtime) {
		this.maxtime = maxtime;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getUlt() {
		return Ult;
	}
	public void setUlt(String ult) {
		Ult = ult;
	}
	
	
}
