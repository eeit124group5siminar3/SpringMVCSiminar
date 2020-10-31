package tw.group5.seller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SellerServlet")
public class SellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SET_CHAR = "UTF-8";
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";


//    public SellerServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see Servlet#init(ServletConfig)
//	 */
//	public void init(ServletConfig config) throws ServletException {
//	
//	}
//
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding(SET_CHAR);
//		response.setContentType(CONTENT_TYPE);
//		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
//		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
//		response.setDateHeader("Expires", -1);
//		if (request.getAttribute("register") != null) {
//			register(request, response);
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(SET_CHAR);
		response.setContentType(CONTENT_TYPE);
		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1);
		if (request.getParameter("register") != null) {
			register(request, response);
		}
		else if (request.getParameter("login") != null) {
			login(request, response);
		}
	}

//註冊
	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SellerDAO sellerDAO = new SellerOracleDAO();
		if (sellerDAO.checkAccount(request.getParameter("email").trim())
				|| !request.getParameter("sellerPassword").equals(request.getParameter("checkPassword"))) {
			request.getRequestDispatcher("SellerRegister.html").forward(request, response);
			return;
		} else {
			sellerDAO.sellerRegister(request, response);
			request.getRequestDispatcher("SellerLogIn.html").forward(request, response);
		}
	}
	
//登入
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SellerDAO sellerDAO = new SellerOracleDAO();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		if(sellerDAO.loginCheck(email,password)) {
			HttpSession session=request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			request.getRequestDispatcher("SellerHomePage.jsp").forward(request, response);
		};
	}

}
