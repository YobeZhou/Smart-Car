package limit.beyond.explore.util.interceptor;


import limit.beyond.explore.auth.root.vo.EmpModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	public String intercept(ActionInvocation invocation) throws Exception {
		String actionName = invocation.getProxy().getAction().getClass().getName();
		String methodName = invocation.getProxy().getMethod();
		String allName = actionName+"."+methodName;
		
		if("limit.beyond.explore.auth.root.web.EmpAction.login".equals(allName)||"limit.beyond.explore.auth.sensors.web.SensorsAction.save".equals(allName)){
			return invocation.invoke();
		}
		
		//获取当前登录人信息
		EmpModel loginEm = (EmpModel) ActionContext.getContext().getSession().get(EmpModel.EMP_LOGIN_USER_OBJECT_NAME);
		//如果当前没有登录，跳转到登录页面
		if(loginEm == null){
			//跳转到登录
			return "noLogin";
		}
		
		//执行原始操作
		return invocation.invoke();
	}

	
}
