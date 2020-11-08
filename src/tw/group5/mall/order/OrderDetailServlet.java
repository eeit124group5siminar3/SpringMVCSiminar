package tw.group5.mall.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.mall.model.ProductOrderBean;
import tw.group5.mall.service.OrderService;



@Controller
public class OrderDetailServlet{
	@Autowired
	private OrderService orderService;
       
	@GetMapping(value = "/OrderDetailServlet")
	public String orderDetailServlet(@RequestParam(value = "orderId") int no, Model model){
		ProductOrderBean ob = orderService.getOrder(no);
		model.addAttribute("OrderBean", ob); 
		return "/mall/ShowOrderDetail";
		}
}
//		String orderId = request.getParameter("orderId");
//		int no = Integer.parseInt(orderId.trim());
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session hibernateSession = factory.getCurrentSession();
//		OrderService orderService = new OrderService(hibernateSession);

//
//		ProductOrderBean ob = orderService.getOrder(no);
//		request.setAttribute("OrderBean", ob);   // 將OrderBean物件暫存到請求物件內
//		RequestDispatcher rd = request.getRequestDispatcher("/mall/ShowOrderDetail.jsp");
//		rd.forward(request, response);
//		return;
//	}

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

//}
