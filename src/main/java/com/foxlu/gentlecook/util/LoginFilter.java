package com.foxlu.gentlecook.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(LoginFilter.class);

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		HttpSession s =request.getSession();
		
		if(s==null||s.getAttribute("currentuser")==null){
			logger.debug("请求被拦截（未登入）" + "---" +  (s==null?"null":s.getId()));
			response.setStatus(403);
			response.sendRedirect(Constant.appBase+"/index");
			//chain.doFilter(request, response);
			return;
		}else{
			logger.debug("已经登入了。" + "---" +s.getId());
			chain.doFilter(arg0, arg1);
		}
		

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
