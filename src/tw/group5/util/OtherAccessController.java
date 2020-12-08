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

import tw.group5.member_SignUp.model.Member_SignUp;

@WebFilter(urlPatterns = {"/mall_order","/mall_management","/mall_manageOrder","/Mall_checkout","/Mall_WishListContent"}, initParams = @WebInitParam(name = "LOGIN_PATH", value = "goFbMemberSignUp.controller"))
public class OtherAccessController extends HttpFilter implements Filter {
	private String LOGIN_PATH;

	public OtherAccessController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Member_SignUp mb=(Member_SignUp) request.getSession().getAttribute("login_ok");
		if (mb.getMember_password()==null||mb.getMember_password().equals("")) {
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
