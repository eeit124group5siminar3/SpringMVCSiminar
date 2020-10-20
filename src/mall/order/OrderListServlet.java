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

import mall.productModel.ProductOrderBean;
import mall.service.OrderService;
import member_SignUp.Member_Bean;



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
		Member_Bean mb = (Member_Bean) session.getAttribute("login_ok");
		if(mb==null) {
			mb=(Member_Bean)session.getAttribute("login_guest");
		}
		OrderService os = new OrderService();
		List<ProductOrderBean> memberOrders = os.getMemberOrders(mb.getMember_no());
		request.setAttribute("memberOrders", memberOrders);
		RequestDispatcher rd = request.getRequestDispatcher("/mall/OrderList.jsp");
		rd.forward(request, response);
		return;
		
	}
}
