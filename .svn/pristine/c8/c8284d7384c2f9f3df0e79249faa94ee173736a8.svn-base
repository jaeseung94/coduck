package kr.co.coduck.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.coduck.dao.UrlDao;
import kr.co.coduck.vo.UrlInfo;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private UrlDao urlDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		System.out.println("요청 URI " + uri);
		UrlInfo urlInfo = urlDao.getUrlInfo(uri);
		System.out.println("urlInfo : " + urlInfo);
		//로그인이 필요 없으면
		if("N".equals(urlInfo.getRequiredLogin())) {
			return true;
		}
		
		//로그인이 필요하면
		HttpSession session = request.getSession();
		if(session.getAttribute("LU") == null) {
			response.sendRedirect("/user/login.hta?error=required");
			return false;
		}
		
		return true;
	}
}
