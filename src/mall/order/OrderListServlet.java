package mall.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.productModel.ProductOrderBean;
import mall.service.OrderService;
import member_SignUp.model.Member_SignUp;
import util.HibernateUtil;



/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/OrderListServlet")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
//		HttpSession session = request.getSession(true);
		
		if (session == null) {      // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
//		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
//		if(mb==null) {
//			mb=(Member_SignUp)session.getAttribute("login_guest");
//		}
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hibernateSession = factory.getCurrentSession();
		OrderService orderService = new OrderService(hibernateSession);

//		OrderService os = new OrderService();
		List<ProductOrderBean> memberOrders = orderService.getMemberOrders("a1");
//		List<ProductOrderBean> memberOrders = orderService.getMemberOrders(mb.getMember_no().toString());
		request.setAttribute("memberOrders", memberOrders);
		RequestDispatcher rd = request.getRequestDispatcher("/mall/OrderList.jsp");
		rd.forward(request, response);
		return;
		
	}
}
