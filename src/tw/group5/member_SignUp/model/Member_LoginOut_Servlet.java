//package tw.group5.member_SignUp.model;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebServlet("/Member_LoginOut_Servlet")
//public class Member_LoginOut_Servlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
//	private static final String CHARSET_CODE = "UTF-8";
//
//
//    public Member_LoginOut_Servlet() {
//        super();
//    }
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		doPost(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		request.setCharacterEncoding(CHARSET_CODE);
//		response.setContentType(CONTENT_TYPE);
//		
//		HttpSession session=request.getSession();
//		session.invalidate();
//		String contextPath = request.getContextPath();
//		response.sendRedirect(contextPath + "/index.jsp");
//		
//		
//	}
//
//}
