package limit.beyond.explore.auth.root.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import limit.beyond.explore.auth.root.business.ebi.EmpEbi;
import limit.beyond.explore.auth.root.dao.impl.EmpImpl;
import limit.beyond.explore.auth.root.vo.EmpModel;
import limit.beyond.explore.auth.root.vo.EmpQueryModel;
import limit.beyond.explore.util.base.BaseAction;


public class EmpAction extends BaseAction{
	public EmpModel em = new EmpModel();
	public EmpQueryModel eqm = new EmpQueryModel();

	private EmpEbi empEbi;

	public void setEmpEbi(EmpEbi empEbi) {
		this.empEbi = empEbi;
	}

	public String findUser(){
		EmpModel q = (EmpModel) getSession(EmpModel.EMP_LOGIN_USER_OBJECT_NAME);
		EmpModel User = empEbi.getByUserNameAndPwd(q.getUuid());
		putSession("user", User);
		em = empEbi.get(q.getUuid());
		return "UserMessage";
	}

	//添加
	public String save(){
		if(em.getUuid() == null){
			empEbi.save(em);
		}else{
			empEbi.update(em);
		}
		return TO_LIST;
	}

	//删除
	public String delete(){
		empEbi.delete(em);
		return TO_LIST;
	}

	//登录
	public String login(){
		
		HttpServletRequest request = getRequest();
		String loginIp = request.getHeader("x-forwarded-for"); 
		if(loginIp == null || loginIp.length() == 0 || "unknown".equalsIgnoreCase(loginIp)) { 
			loginIp = request.getHeader("Proxy-Client-IP"); 
		} 
		if(loginIp == null || loginIp.length() == 0 || "unknown".equalsIgnoreCase(loginIp)) { 
			loginIp = request.getHeader("WL-Proxy-Client-IP"); 
		} 
		if(loginIp == null || loginIp.length() == 0 || "unknown".equalsIgnoreCase(loginIp)) { 
			loginIp = request.getRemoteAddr(); 
		}
		EmpModel loginEm = empEbi.login(em.getUserName(),em.getPwd(),loginIp);
		
		
		if(loginEm == null){
			this.addActionError("对不起，用户名密码错误！");
			return "loginFail";
		}else{
			System.out.println(loginEm.getUserName()+loginEm.getPwd());
			putSession(EmpModel.EMP_LOGIN_USER_OBJECT_NAME, loginEm);
			return "loginSuccess";
		}
	}
	
	//登出/注销
	public String logout(){
		
		putSession(EmpModel.EMP_LOGIN_USER_OBJECT_NAME, null);
		return "noLogin";
	}
	
	//跳转到修改密码
	public String toChangePwd(){
		return "toChangePwd";
	}
	
	public String newPwd;
	//修改密码
	public String changePwd(){
	
		boolean flag = empEbi.changePwd(getLogin().getUserName(),em.getPwd(),newPwd);
		if(flag){
			
			putSession(EmpModel.EMP_LOGIN_USER_OBJECT_NAME, null);
			return "noLogin";
		}else{
			
			return "toChangePwd";
		}
	}
	
	
}
