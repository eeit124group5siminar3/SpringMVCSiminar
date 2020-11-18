package tw.group5.mall.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import tw.group5.mall.ShoppingCart;
import tw.group5.mall.model.OrderItem;
import tw.group5.mall.model.ProductOrderBean;
import tw.group5.mall.model.ProductOrderItemBean;
import tw.group5.mall.service.OrderService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = { "login_ok", "login_guest", "ShoppingCart" })
public class MallOrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = "/ProcessOrderServlet", method = { RequestMethod.GET, RequestMethod.POST })
	public String processOrderServlet(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			@RequestParam(value = "ShippingAddress", required = false) String shippingAddress,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "BNO", required = false) String bNO,
			@RequestParam(value = "InvoiceTitle", required = false) String invoiceTitle, Model model) {

		if (mb == null) {
			mb = (Member_SignUp) model.getAttribute("login_guest");
		}
		if (cart == null) {
			return "index";
		}
		Integer memberId = mb.getMember_no();
		double totalAmount = Math.round(cart.getSubtotal() * 1.05);
		Date today = new Date();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		ProductOrderBean ob = (ProductOrderBean) context.getBean("productOrderBean");
		ob.setBuyerId(memberId);
		ob.setBuyerName(invoiceTitle);
		ob.setAddress(shippingAddress);
		ob.setTel(tel);
		ob.setBNo(bNO);
		ob.setTotal(totalAmount);
		ob.setOrderDate(today);
		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
		System.err.println(cart);
		Map<Integer, OrderItem> carts = cart.getContent();
		Set<Integer> set = carts.keySet();
		System.err.println(set);
		for (Integer k : set) {
			OrderItem oi = carts.get(k);
			String description = oi.getProduct() + " " + oi.getContent() + oi.getUnit();
			ProductOrderItemBean oib = (ProductOrderItemBean) context.getBean("productOrderItemBean");
			oib.setProductId(oi.getProductId());
			System.err.println(oi.getProductId());
			oib.setProducterId(oi.getProducterId());
			oib.setDescription(description);
			oib.setDiscount(oi.getDiscount());
			oib.setUnitPrice(oi.getPrice());
			oib.setAmount(oi.getQty());
			oib.setOrderId(null);
			oib.setProductOrderBean(ob);
			items.add(oib);
		}
		ob.setItems(items);
		try {
			orderService.persistOrder(ob);
			cart.deleteAllOrders();
			return "/mall/ThanksForOrdering";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "/mall/ProductShowCart";
		}
	}

	@RequestMapping(value = "/DeleteOrderServlet", method = RequestMethod.POST)
	public String deleteOrderServlet(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart) {
		cart.deleteAllOrders();
		return "redirect:/RetrievePageProducts";

	}

	

	@PostMapping(value = "/UpdateProductServlet")
	public String updateProductServlet(@RequestParam(value = "cmd", required = false) String cmd,
			@RequestParam(value = "ProductId", required = false) Integer productId,
			@RequestParam(value = "newQty", required = false) Integer newQty, Model model) {
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (cart == null) {
			return "/index";
		}
		if (cmd.equalsIgnoreCase("DEL")) {
			cart.deleteOrder(productId);
			return "/mall/ProductShowCart";
		} else if (cmd.equalsIgnoreCase("MOD")) {
			cart.modifyQty(productId, newQty);
			return "/mall/ProductShowCart";
		}
		return "/mall/ProductShowCart";
	}

	@GetMapping(value = "/CheckoutServlet")
	public String checkoutServlet(Model model) {

		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (cart == null) {
			return "/index";
		}

		return "/mall/OrderConfirm";
	}

	@GetMapping("/AbortServlet")
	public String abortServlet(Model model) {
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (cart != null) {
			cart.deleteAllOrders();
			cart = null;
		}
		return "redirect:/RetrievePageProducts";
	}

	@GetMapping(value = "/OrderListServlet")
	public String orderListServlet(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			Model model) {
		if (mb == null) {
			mb = (Member_SignUp) model.getAttribute("login_guest");
		}
		List<ProductOrderBean> memberOrders = orderService.getMemberOrders(mb.getMember_no());
		model.addAttribute("memberOrders", memberOrders);
		return "/mall/OrderList";
	}

	@GetMapping(value = "/OrderDetailServlet")
	public String orderDetailServlet(@RequestParam(value = "orderId") int no, Model model) {
		ProductOrderBean ob = orderService.getOrder(no);
		model.addAttribute("OrderBean", ob);
		return "/mall/ShowOrderDetail";
	}
}
