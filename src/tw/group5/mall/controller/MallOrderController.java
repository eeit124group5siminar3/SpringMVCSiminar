package tw.group5.mall.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import tw.group5.mall.ShoppingCart;
import tw.group5.mall.model.OrderItem;
import tw.group5.mall.model.ProductOrderBean;
import tw.group5.mall.model.ProductOrderItemBean;
import tw.group5.mall.model.ProducterBean;
import tw.group5.mall.service.OrderService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = { "pob", "login_ok", "login_guest", "ShoppingCart" })
public class MallOrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ServletContext servletContext;

// 刪除購物車內物件
	@PostMapping(value = "/DeleteOrder")
	public ModelAndView deleteOrderItem(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			@RequestParam(value = "productId") Integer productId) {
		cart.deleteOrder(productId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/shoppingcartContent");
		mav.addObject("ShoppingCart", cart);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 修改購買商品數量
	@PostMapping(value = "/ChangeQty")
	public ModelAndView changeItemQty(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			@RequestParam(value = "productId") Integer productId,
			@RequestParam(value = "qty", required = false) Integer qty) {
		if (qty != null) {
			cart.modifyQty(productId, qty);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/shoppingcartContent");
		mav.addObject("ShoppingCart", cart);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 結帳畫面內容
//	@PostMapping(value = "/CheckoutContent")
//	public ModelAndView showCheckoutContent(
//			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/mall/checkoutContent");
//		mav.addObject("ShoppingCart", cart);
//		mav.setStatus(HttpStatus.OK);
//		return mav;
//	}

// 建立新訂單
	@GetMapping(value = "/Mall_checkout")
	public String preCheckout(Model model) {
		ProductOrderBean pob = new ProductOrderBean();
		model.addAttribute("pob", pob);
		return "/mall/mall_checkout";
	}

// 送出訂單
	@RequestMapping(value = "/ProcessOrder",method = {RequestMethod.GET,RequestMethod.POST})
	public String processOrderServlet(@ModelAttribute(value = "pob") ProductOrderBean pob,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart, Model model) {
		if (cart == null || cart.getContent().isEmpty()) {
			String errmsg = "尚未選購商品";
			model.addAttribute("errmsg", errmsg);
			return "/mall/mall_checkout";
		}
		Date today = new Date();
		pob.setOrderDate(today);
		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
		Map<Integer, OrderItem> carts = cart.getContent();
		Set<Integer> set = carts.keySet();
		for (Integer k : set) {
			ProductOrderItemBean oib = new ProductOrderItemBean();
			OrderItem oi = carts.get(k);
			System.err.println(oi.getProducterId());
			ProducterBean producterBean=orderService.getProducterId(oi.getProducterId());
//			producterBean.setMember_no(oi.getProducterId());
//			producterBean.setMember_name(oi.getProducterName());
			oib.setProducterBean(producterBean);
			String description = oi.getProduct() + " " + oi.getContent() + oi.getUnit();
			oib.setProductId(oi.getProductId());
//			oib.setProducterId(oi.getProducterId());
			oib.setDescription(description);
			oib.setDiscount(oi.getDiscount());
			oib.setUnitPrice(oi.getPrice());
			oib.setAmount(oi.getQty());
			oib.setOrderId(null);
			oib.setProductOrderBean(pob);
			
			items.add(oib);
		}
		
		pob.setItems(items);
		try {
			orderService.persistOrder(pob);
			cart.deleteAllOrders();
			return "/mall/mall_thankForOrder";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "/mall/mall_shoppingcart";
		}
	}

// 顯示訂單內容
	@PostMapping(value = "/OrderContent")
	public ModelAndView showOrderContent(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			@RequestParam(value = "order_pageNo", required = false) Integer pageNoP, HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession(false);
		Integer pageNo = (Integer) session.getAttribute("order_pageNo");
		if (pageNoP != null) {
			pageNo = pageNoP;
			session.setAttribute("order_pageNo", pageNo);
			orderService.setPageNo(pageNo);
		}
		Integer buyerId = mb.getMember_no();
		int totalPages = orderService.getTotalPages(buyerId);
		List<ProductOrderBean> memberOrders = orderService.getMemberOrders(buyerId);
		session.setAttribute("memberOrders", memberOrders);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/orderContent");
		mav.addObject("order_totalPages", totalPages);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 訂單詳細內容
	@PostMapping(value = "/OrderDetail")
	public ModelAndView showOrderDetail(@RequestParam(value = "orderId", required = false) Integer orderId,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		List<ProductOrderBean> memberOrders = (List<ProductOrderBean>) session.getAttribute("memberOrders");
		ProductOrderBean order = null;
		for (ProductOrderBean pob : memberOrders) {
			if (pob.getOrderId() == orderId) {
				order = pob;
				break;
			}
		}
		Set<ProductOrderItemBean> items = order.getItems();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/orderDetailContent");
		mav.addObject("items", items);
		mav.addObject("orderId",orderId);
		mav.setStatus(HttpStatus.OK);
		return mav;
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

//	@PostMapping(value = "/UpdateProductServlet")
//	public String updateProductServlet(@RequestParam(value = "cmd", required = false) String cmd,
//			@RequestParam(value = "ProductId", required = false) Integer productId,
//			@RequestParam(value = "newQty", required = false) Integer newQty, Model model) {
//		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
//		if (cart == null) {
//			return "/index";
//		}
//		if (cmd.equalsIgnoreCase("DEL")) {
//			cart.deleteOrder(productId);
//			return "/mall/ProductShowCart";
//		} else if (cmd.equalsIgnoreCase("MOD")) {
//			cart.modifyQty(productId, newQty);
//			return "/mall/ProductShowCart";
//		}
//		return "/mall/ProductShowCart";
//	}

//	@GetMapping(value = "/CheckoutServlet")
//	public String checkoutServlet(Model model) {
//		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
//		if (cart == null) {
//			return "/index";
//		}
//		return "/mall/OrderConfirm";
//	}
//	@RequestMapping(value = "/ProcessOrderServlet", method = { RequestMethod.GET, RequestMethod.POST })
//	public String processOrderServlet(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
//			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
//			@RequestParam(value = "ShippingAddress", required = false) String shippingAddress,
//			@RequestParam(value = "tel", required = false) String tel,
//			@RequestParam(value = "BNO", required = false) String bNO,
//			@RequestParam(value = "InvoiceTitle", required = false) String invoiceTitle, Model model) {
//		
//		if (mb == null) {
//			mb = (Member_SignUp) model.getAttribute("login_guest");
//		}
//		if (cart == null) {
//			return "index";
//		}
//		Integer memberId = mb.getMember_no();
//		double totalAmount = Math.round(cart.getSubtotal() * 1.05);
//		Date today = new Date();
//		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
//		ProductOrderBean ob = (ProductOrderBean) context.getBean("productOrderBean");
//		ob.setBuyerId(memberId);
//		ob.setBuyerName(invoiceTitle);
//		ob.setAddress(shippingAddress);
//		ob.setTel(tel);
//		ob.setBNo(bNO);
//		ob.setTotal(totalAmount);
//		ob.setOrderDate(today);
//		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
//		System.err.println(cart);
//		Map<Integer, OrderItem> carts = cart.getContent();
//		Set<Integer> set = carts.keySet();
//		System.err.println(set);
//		for (Integer k : set) {
//			OrderItem oi = carts.get(k);
//			String description = oi.getProduct() + " " + oi.getContent() + oi.getUnit();
//			ProductOrderItemBean oib = (ProductOrderItemBean) context.getBean("productOrderItemBean");
//			oib.setProductId(oi.getProductId());
//			System.err.println(oi.getProductId());
//			oib.setProducterId(oi.getProducterId());
//			oib.setDescription(description);
//			oib.setDiscount(oi.getDiscount());
//			oib.setUnitPrice(oi.getPrice());
//			oib.setAmount(oi.getQty());
//			oib.setOrderId(null);
//			oib.setProductOrderBean(ob);
//			items.add(oib);
//		}
//		ob.setItems(items);
//		try {
//			orderService.persistOrder(ob);
//			cart.deleteAllOrders();
//			return "/mall/ThanksForOrdering";
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			return "/mall/ProductShowCart";
//		}
//	}