package member_SignUp.model;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

@WebServlet("/LoginTestServlet")
public class LoginTestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public LoginTestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		// 設定緩存
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);

		if (request.getParameter("login") != null)
			gotoSubmitProcess(request, response);
	}

	// 取Member_Login資料
	public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRemember = null;
		String rm = request.getParameter("remember");
		String member_email;
		String member_password;
		
		SessionFactory factory=HibernateUtil.getSessionFactory();
		Session session=factory.getCurrentSession();

		Member_DAO login_check = new Member_DAO(session);

		member_email = request.getParameter("email"); // trim() 把頭尾去掉空白
		if (member_email != null)
			member_email = member_email.trim();
		member_password = request.getParameter("password");
		if (member_password != null)
			member_password = member_password.trim();
		boolean sel = login_check.login_check(member_email, member_password);
		if (sel) {
			
			Member_SignUp login_bean = login_check.login_bean(member_email);
			System.out.println(login_bean.getMember_no());
		}
//		System.out.println(request.getParameter("remember"));
//		if (sel) {
//			if (rm != null) {
//				cookieUser = new Cookie("user", member_email);
//				cookieUser.setMaxAge(60 * 60 * 24 * 7);
//				cookieUser.setPath(request.getContextPath());
//				
//				cookiePassword = new Cookie("password", member_password);
//				cookiePassword.setMaxAge(60 * 60 * 24 * 7);
//				cookiePassword.setPath(request.getContextPath());
//
//				cookieRemember = new Cookie("rm", "true");
//				cookieRemember.setMaxAge(7 * 24 * 60 * 60);
//				cookieRemember.setPath(request.getContextPath());
//			} else {
//				cookieUser = new Cookie("user", member_email);
//				cookieUser.setMaxAge(0);
//				cookieUser.setPath(request.getContextPath());
//				
//				cookiePassword = new Cookie("password", member_password);
//				cookiePassword.setMaxAge(0);
//				cookiePassword.setPath(request.getContextPath());
//
//				cookieRemember = new Cookie("rm", "true");
//				cookieRemember.setMaxAge(0);
//				cookieRemember.setPath(request.getContextPath());
//			}
//
//			response.addCookie(cookieUser);
//			response.addCookie(cookiePassword);			
//			response.addCookie(cookieRemember);
//
//			request.getSession().setAttribute("login_ok", login_bean);
//
//			request.getRequestDispatcher("Member_SignUp/Member_Login_OK.jsp").forward(request, response);
//		} else {
//			request.getRequestDispatcher("Member_SignUp/Member_Login_Alert.jsp").forward(request, response);
//		}
	}
}