package tw.group5.member_SignUp.model;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.group5.member_SignUp.util.SignUp_Function;
import tw.group5.util.HibernateUtil;

@WebServlet("/Member_ResetPassword_Servler")
public class Member_ResetPassword_Servler extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public Member_ResetPassword_Servler() {
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

		if (request.getParameter("submit") != null)
			gotoSubmitProcess(request, response);
		else if (request.getParameter("confirm") != null)
			gotoConfirmProcess(request, response);
	}

	// 取Buyer_SignUp資料
	public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();

		String member_email;
		String member_id;
		String member_name;
		String member_cellphone;

		Member_DAO member_dao = new Member_DAO(session);

		member_email = request.getParameter("member_email").trim(); // trim() 把頭尾去掉空白
		member_id = request.getParameter("member_id").trim();
		String id_upper = member_id.toUpperCase();
		member_name = request.getParameter("member_name").trim();
		member_cellphone = request.getParameter("member_cellphone").trim();
		String sel_email = member_dao.reset_password(member_email, id_upper, member_name, member_cellphone);
		System.out.println(sel_email);

		if (sel_email != "NO DATA") {
			member_dao.updata_member_password(member_email, sel_email);
			// 建立Buyer_Object Bean
			Member_SignUp reg_buyer = new Member_SignUp(member_email,sel_email);
			// 建立getSession(true) 若沒有Session則會建立Session
			request.getSession(true).setAttribute("reg_buyer", reg_buyer);
			// 把工作交給Buyer_SignUp_Check.jsp
			request.getRequestDispatcher("Member_SignUp/Member_ResetPassword.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("Member_SignUp/Member_ForgotPassword_Alert.jsp").forward(request, response);
		}
	}
	

	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			SessionFactory factory = HibernateUtil.getSessionFactory();
			Session session = factory.getCurrentSession();

			String member_password;
			String member_password1;
			
			Member_SignUp a=(Member_SignUp) request.getSession(true).getAttribute("reg_buyer");
			String member_email=a.getMember_email();
			
			member_password = request.getParameter("member_password").trim();
			member_password1 = request.getParameter("member_password1").trim();

			Member_DAO member_dao = new Member_DAO(session);
			SignUp_Function signup_function = new SignUp_Function();
			
			if (signup_function.check_password(member_password, member_password1)) {
				System.out.println("123");
				boolean check = member_dao.updata_member_password(member_email, member_password);
				System.out.println("321");
				if (check) {
					request.getSession(true).invalidate();
					String contextPath = request.getContextPath();
					response.sendRedirect(contextPath + "/Member_SignUp/Member_ResetPassword_OK.jsp");
				}
			}else {
				request.getRequestDispatcher("Member_SignUp/Member_ResetPassword_Alert.jsp").forward(request, response);
			}
			
		} catch (Exception ne) {
			System.out.println("Naming Service Lookup Exception");
		}

	}

}
