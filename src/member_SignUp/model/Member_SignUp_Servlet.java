package member_SignUp.model;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import member_SignUp.util.SignUp_Function;
import util.HibernateUtil;

@WebServlet("/Member_SignUp_Servlet")
public class Member_SignUp_Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public Member_SignUp_Servlet() {
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
		
		String member_permissions;
		String member_email;
		String member_password;
		String member_name;
		String member_birthday1;
		String member_cellphone;
		String member_id;
		String member_address;
		String member_gui_number;
		

		Member_DAO member_dao = new Member_DAO(session);
		SignUp_Function signup_function = new SignUp_Function();

		member_permissions = request.getParameter("member_permissions");
		member_email = request.getParameter("member_email").trim(); // trim() 把頭尾去掉空白
		member_password = request.getParameter("member_password").trim();
		member_id = request.getParameter("member_id").trim();
		String id_upper = member_id.toUpperCase();
		member_name = request.getParameter("member_name").trim();
		member_birthday1 = request.getParameter("member_birthday").trim();
		Date member_birthday = Date.valueOf(member_birthday1);
		member_cellphone = request.getParameter("member_cellphone").trim();
		member_address = request.getParameter("member_address").trim();
		member_gui_number = request.getParameter("member_gui_number").trim();
		boolean sel_email = member_dao.check_signup_email(member_email); // email驗證
		boolean sel_id = member_dao.check_signup_id(id_upper); // ID驗證
		boolean check_id = signup_function.check_id(id_upper); // ID檢查碼驗證
		boolean check_date = signup_function.check_date(member_birthday);

		if (member_permissions.equals("0")) {
			if (sel_email) {
				if (sel_id) {
					if (check_id) {
						if (check_date) {

							// 建立Buyer_Object Bean
							Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
									member_name, member_birthday, member_cellphone, id_upper, member_address,
									member_gui_number);
							// 建立getSession(true) 若沒有Session則會建立Session
							request.getSession(true).setAttribute("reg_buyer", reg_buyer);
							// 把工作交給Buyer_SignUp_Check.jsp
							request.getRequestDispatcher("Member_SignUp/Member_SignUp_Check0.jsp").forward(request,
									response);
						} else {
							request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Birthday.jsp")
									.forward(request, response);
						}
					} else {
						request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Id.jsp").forward(request,
								response);
					}
				} else {
					request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Id1.jsp").forward(request,
							response);
				}
			} else {
				request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Email.jsp").forward(request, response);
			}
		} else if (member_permissions.equals("1")) {
			if (sel_email) {
				if (sel_id) {
					if (check_id) {
						if (check_date) {

							// 建立Buyer_Object Bean
							Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
									member_name, member_birthday, member_cellphone, member_id, member_address,
									member_gui_number);
							// 建立getSession(true) 若沒有Session則會建立Session
							request.getSession(true).setAttribute("reg_buyer", reg_buyer);
							// 把工作交給Buyer_SignUp_Check.jsp
							request.getRequestDispatcher("Member_SignUp/Member_SignUp_Check1.jsp").forward(request,
									response);
						} else {
							request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Birthday.jsp")
									.forward(request, response);
						}
					} else {
						request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Id.jsp").forward(request,
								response);
					}
				} else {
					request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Id1.jsp").forward(request,
							response);
				}
			} else {
				request.getRequestDispatcher("Member_SignUp/Member_SignUp_Alert_Email.jsp").forward(request, response);
			}
		}
	}

	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			SessionFactory factory = HibernateUtil.getSessionFactory();
			Session session = factory.getCurrentSession();

			// 建立Database Access Object,負責Table的Access
			Member_DAO MemberDAO = new Member_DAO(session);
			Member_SignUp seller_data = (Member_SignUp) request.getSession(true).getAttribute("reg_buyer");
			if (MemberDAO.insert_member_sing_up(seller_data)) {
				request.getSession().setAttribute("login_ok", seller_data);
				// F5不會重複寫入
				String contextPath = request.getContextPath();
				response.sendRedirect(contextPath + "/Member_SignUp/Member_SignUp_OK.jsp");
			}
		} catch (Exception ne) {
			System.out.println("Naming Service Lookup Exception");
		}

	}

}
