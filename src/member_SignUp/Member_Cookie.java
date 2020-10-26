//package member_SignUp;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebFilter("/Member_SignUp/Member_Login.jsp")
//public class Member_Cookie implements Filter {
//	public Member_Cookie() {
//
//	}	
//	public void doFilter(ServletRequest request, ServletResponse response,
//			FilterChain chain) throws IOException, ServletException {
//		if (request instanceof HttpServletRequest
//				&& response instanceof HttpServletResponse) {
//			HttpServletRequest req = (HttpServletRequest) request;
//			String cookieName = "";
//			String user = "";
//			String password = "";
//			String rememberMe = "";
//			
//			// 取出瀏覽器送來的Cookie
//			Cookie[] cookies = req.getCookies();
//			if (cookies != null) {
//				for (int i = 0; i < cookies.length; i++) {
//					cookieName = cookies[i].getName();
//					//找Cookie的user
//					if (cookieName.equals("user")) {
//						user = cookies[i].getValue();
//						//找Cookie的password						
//					} else if (cookieName.equals("password")) {
//						password  = cookies[i].getValue();						
//					} 
//					//找Cookie的rm
//					else if (cookieName.equals("rm")) {
//						rememberMe = cookies[i].getValue();
//					}
//				}
//			} else {
//				// 找不到Cookie，就讓使用者輸入資料。
//			}
//			// 將這三項資料存入request物件
//			request.setAttribute("remember", rememberMe);
//			request.setAttribute("user", user);
//			request.setAttribute("password", password);
//		}
//		chain.doFilter(request, response);
//	}
//	public void init(FilterConfig fConfig) throws ServletException {
//	}
//	@Override
//	public void destroy() {
//	}
//	
//}
