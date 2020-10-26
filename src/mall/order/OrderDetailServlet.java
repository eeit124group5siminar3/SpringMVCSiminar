package mall.order;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.productModel.ProductOrderBean;
import mall.productModel.ProductOrderItemBean;
import mall.service.OrderService;
import util.HibernateUtil;


/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/OrderDetailServlet")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderId = request.getParameter("orderId");
		int no = Integer.parseInt(orderId.trim());
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hibernateSession = factory.getCurrentSession();
		OrderService orderService = new OrderService(hibernateSession);


		ProductOrderBean ob = orderService.getOrder(no);
		request.setAttribute("OrderBean", ob);   // 將OrderBean物件暫存到請求物件內
		RequestDispatcher rd = request.getRequestDispatcher("/mall/ShowOrderDetail.jsp");
		rd.forward(request, response);
		return;
	}

//	public void displayOrderBean(ProductOrderBean ob) {
//		System.out.println("ob.getOrderNo()=" + ob.getOrderNo());
//		System.out.println("ob.getMemberId()=" + ob.getMemberId());
//		System.out.println("ob.getOrderDate=" + ob.getOrderDate());
//		System.out.println("ob.getTotalAmount=" + ob.getTotalAmount());
//		System.out.println("ob.getInvoiceTitle=" + ob.getInvoiceTitle());
//		System.out.println("ob.getBNO=" + ob.getBno());
//		System.out.println("ob.getShippingAddress=" + ob.getShippingAddress());
//		System.out.println("ob.getCancelTag=" + ob.getCancelTag());
//		System.out.println("==============訂單明細=================");
//		Set<ProductOrderItemBean> items = ob.getItems();
//		for (ProductOrderItemBean oib : items) {
//			System.out.println("---------------一筆明細---------------");
//			System.out.println("   oib.getSeqno()=" + oib.getSeqno());
//			System.out.println("   oib.getOrderNo()=" + oib.getOrderNo());
//			System.out.println("   oib.getBookId()=" + oib.getBookId());
//			System.out.println("   oib.getDescription()=" + oib.getDescription());
//			System.out.println("   oib.getQuantity()=" + oib.getQuantity());
//			System.out.println("   oib.getUnitPrice()=" + oib.getUnitPrice());
//			System.out.println("   oib.getDiscount()=" + oib.getDiscount());
//		}
//	}

}
