package kr.co.coduck.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.coduck.dao.UrlDao;
import kr.co.coduck.vo.UrlInfo;
import kr.co.coduck.vo.User;


public class GradeCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private UrlDao urlDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String path = request.getRequestURI();
		UrlInfo urlInfo =  urlDao.getUrlInfo(path);
		System.out.println("===========================");
		System.out.println("path : " + path);
		System.out.println("===========================");
		System.out.println("urlInfo : " + urlInfo);
		
		if("All".equals(urlInfo.getRequiredGrade())) {
			System.out.println("누구나 접근 가능");
			return true;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("LU");
		System.out.println("++++++++++++++++");
		System.out.println("user : "+ user);
		if(!urlInfo.getRequiredGrade().equals(user.getRole())) {
			System.out.println("등급이 안맞음");
			if(urlInfo.getRequiredGrade().equals("U")) {
	          response.sendRedirect("/home.hta?error=deny");
	          //false면 컨트롤러로 요청이 안된다.
	          return false;
	          
			} else if (urlInfo.getRequiredGrade().equals("A")) {
				response.sendRedirect("/admin/login.hta?error=deny");
				return false;
			}
        }
		
		return true;
	}
}
