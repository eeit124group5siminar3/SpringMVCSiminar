package member_SignUp.model;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import member_SignUp.model.Member_SignUp;

import util.HibernateUtil;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	
	
    public TestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		// 設定緩存
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);		
		
		if (request.getParameter("submit") != null)
			gotoSubmitProcess(request, response);
//		Member_SignUp db=session.get(Member_SignUp.class, 1);
		
//		System.out.println(db);
//		System.out.println(db.getMember_address());
//		System.out.println(db.getMember_email());
//		System.out.println(db.getMember_id());
//		System.out.println(db.getMember_name());	
		
	}

	private void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_permissions;
		String member_email;
		String member_password;
		String member_name;
		String member_birthday1;
		String member_cellphone;
		String member_id;
		String member_address;
		String member_gui_number;
		
		SessionFactory factory=HibernateUtil.getSessionFactory();
		Session session=factory.getCurrentSession();
		
		Member_DAO select = new Member_DAO(session);

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
				
		Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
				member_name, member_birthday, member_cellphone, member_id, member_address,
				member_gui_number);
		String email = reg_buyer.getMember_email();
		System.out.println("EEEEE"+email);
		
		if (select.check_signup_email(member_email) ) {
			if (select.check_signup_id(member_id)) {
				select.insert_member_sing_up(reg_buyer);
				// 建立getSession(true) 若沒有Session則會建立Session
				request.getSession(true).setAttribute("reg_buyer", reg_buyer);
				// 把工作交給Buyer_SignUp_Check.jsp
				request.getRequestDispatcher("Member_SignUp/test1.jsp").forward(request,
						response);
			}else {
				System.out.println("身分證字號重複");
			}
		}else {
			System.out.println("EMAIL重複");
		}
	}

}
