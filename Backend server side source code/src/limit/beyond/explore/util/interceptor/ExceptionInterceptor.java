package limit.beyond.explore.util.interceptor;

import limit.beyond.explore.util.exception.AppException;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ExceptionInterceptor extends AbstractInterceptor{

	public String intercept(ActionInvocation invocation) throws Exception {
		try {
			return invocation.invoke();
		} catch (AppException e) {					// 这是我们的自定义异常
			ActionSupport as = (ActionSupport) invocation.getAction();
			as.addActionError(as.getText(e.getMessage()));
			return "error";
		} catch (Exception e) {									// 这是我们的全局异常
			e.printStackTrace();        
			return invocation.invoke();
		}
	}
	
}
