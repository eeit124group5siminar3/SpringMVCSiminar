package tw.group5.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = {"/mall_order","/mall_management","/mall_manageOrder","/Mall_checkout"}, initParams = @WebInitParam(name = "LOGIN_PATH", value = "Member_Login"))
public class AccessController extends HttpFilter implements Filter {
	private String LOGIN_PATH;

	public AccessController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request.getSession().getAttribute("login_ok") == null) {
//			response.sendRedirect(request.getContextPath()+LOGIN_PATH);
			response.sendRedirect(LOGIN_PATH);
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init() throws ServletException {
//		System.out.println(getInitParameter("LOGIN_PATH"));
		this.LOGIN_PATH = getInitParameter("LOGIN_PATH");
	}

}
