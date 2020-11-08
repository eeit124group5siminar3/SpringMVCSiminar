package tw.group5.mall.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.mall.model.ProductOrderBean;
import tw.group5.mall.service.OrderService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = { "login_ok", "login_guest"})

public class OrderListServlet {
	@Autowired
	private OrderService orderService;
	@GetMapping(value = "/OrderListServlet")
	public String orderListServlet(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			 Model model) {
//		if (mb == null) {
//			mb = (Member_SignUp) model.getAttribute("login_guest");
//		}
//		List<ProductOrderBean> memberOrders = orderService.getMemberOrders(mb.getMember_no());
		
		List<ProductOrderBean> memberOrders = orderService.getMemberOrders(1);
		model.addAttribute("memberOrders", memberOrders);
		return "/mall/OrderList";
	}
}
//		HttpSession session = request.getSession(false);
//		HttpSession session = request.getSession(true);

//		if (session == null) { // 使用逾時
//			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
//			return;
//		}
//		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
//		if (mb == null) {
//			mb = (Member_SignUp) session.getAttribute("login_guest");
//		}
//
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session hibernateSession = factory.getCurrentSession();
//		OrderService orderService = new OrderService(hibernateSession);
//
//		List<ProductOrderBean> memberOrders = orderService.getMemberOrders(mb.getMember_no());
//		request.setAttribute("memberOrders", memberOrders);
//		RequestDispatcher rd = request.getRequestDispatcher("/mall/OrderList.jsp");
//		rd.forward(request, response);
//		return;
//
//	}
//}
