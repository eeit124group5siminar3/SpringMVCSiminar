package tw.group5.mall.shoppingCart;

import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
public class ProcessOrderServlet {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ServletContext servletContext;

	@PostMapping(value = "/ProcessOrderServlet")
	public String processOrderServlet(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			@RequestParam(value = "finalDecision", required = false) String finalDecision,
			@RequestParam(value = "ShippingAddress", required = false) String shippingAddress,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "BNO", required = false) String bNO,
			@RequestParam(value = "InvoiceTitle", required = false) String invoiceTitle,
			Model model) {

		if (mb == null) {
			mb = (Member_SignUp) model.getAttribute("login_guest");
		}
		if (cart == null) {
			return "index";
		}
		if (finalDecision.equals("CANCEL")) {
			model.addAttribute("ShoppingCart", null);
			return "redirect:/ProcessOrderServlet";
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
		Map<Integer, OrderItem> carts = cart.getContent();
		Set<Integer> set = carts.keySet();
		for (Integer k : set) {
			OrderItem oi = carts.get(k);
			String description = oi.getProduct() + " " + oi.getContent() + oi.getUnit();
			ProductOrderItemBean oib = (ProductOrderItemBean) context.getBean("productOrderItemBean");
			oib.setProductId(oi.getProductId());
			oib.setProducterId(oi.getProducterId());
			oib.setDescription(description);
			oib.setDiscount(oi.getDiscount());
			oib.setUnitPrice(oi.getPrice());
			oib.setAmount(oi.getQty());
			oib.setOrderId(null);
		}
		ob.setItems(items);
		try {
			orderService.persistOrder(ob);
			return "/mall/ThanksForOrdering";
		} catch (RuntimeException ex) {
			String message = ex.getMessage();
			String shortMsg = "";
			shortMsg = message.substring(message.indexOf(":") + 1);
			System.out.println(shortMsg);
			model.addAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg + "，請調正訂單內容");
			return "/mall/ProductShowCart";
		}
	}
	
	@GetMapping(value = "/productShowCart")
	public String productShowCart() {
		return "/mall/ProductShowCart";
	}
}

//		request.setCharacterEncoding("UTF-8");
//		
//		String finalDecision = request.getParameter("finalDecision");		
////		HttpSession session = request.getSession();
//		HttpSession session = request.getSession(false);
//		if (session == null) {   // 使用逾時
//			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
//			return;
//		}
//		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
//		if (mb == null) {
////			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
////			return;
//			mb=(Member_SignUp) session.getAttribute("login_guest");
//		}

//		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
//		if (sc == null) {
//			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
//			// 導向首頁
//			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
//			return;
//		}
// 如果使用者取消訂單
//		if  (finalDecision.equals("CANCEL")){
//			session.removeAttribute("ShoppingCart");
//			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()));
//			return;  			// 一定要記得 return 
//		}
//		int memberId = mb.getMember_no();
//		String memberId ="a1";
// 取出會員代號
//		String memberId="aaa";
//		double totalAmount = Math.round(cart.getSubtotal() * 1.05);  	// 計算訂單總金額 
//		String shippingAddress = request.getParameter("ShippingAddress");// 出貨地址
//		String tel =request.getParameter("tel");
//		String bNO = request.getParameter("BNO");					// 發票的統一編號  
//		String invoiceTitle = request.getParameter("InvoiceTitle");	// 發票的抬頭
//		Date today = new Date();   									// 新增訂單的時間
//		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
//		ProductOrderBean ob = new ProductOrderBean(memberId,invoiceTitle,shippingAddress,tel,bNO,totalAmount, today,null);
//		
//		// 新建一個存放訂單明細的Set物件: items		
//		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
//		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
//		// 然後存入items。
//		Map<Integer, OrderItem> cart = sc.getContent();
//		// 呼叫keySet()取出cart內所有的 key，由於Map內的Key不會重複，因此keySet()方法的傳回值為
//		// Set物件
//		Set<Integer> set = cart.keySet();
//		// 使用for敘述將set內所有的元素(這些元素都是Map物件內的Key)逐一取出，然後經由Map物件的
//		// get方法取出Key所對應的value物件。這些value物件就是客戶購買的商品。
//		for (Integer k : set) {
//			OrderItem oi = cart.get(k);   // 經由Map物件的 get方法取出Key所對應的value物件
//			String description = oi.getProduct()+" "+oi.getContent()+oi.getUnit();
//			// 由於表格的Primary Key為自動遞增，為了配合Hibernate，在此主鍵設定為null
//			// (Hibernate規定：自動遞增的主鍵，其對應之物件的欄位必須是null)，絕對不可以是零。
//			ProductOrderItemBean oib = new ProductOrderItemBean(0, oi.getProductId(),oi.getProducterId(), description, oi.getQty(), 
//										oi.getPrice(), oi.getDiscount());
//			oib.setProductOrderBean(ob);
//			items.add(oib);
//		}
//		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
//		ob.setItems(items); 
//		
//		try {
//			SessionFactory factory = HibernateUtil.getSessionFactory();
//			Session hibernateSession = factory.getCurrentSession();
//			OrderService orderService = new OrderService(hibernateSession);
//	
//			orderService.persistOrder(ob);
//			session.removeAttribute("ShoppingCart");
//			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()+"/mall/ThanksForOrdering.jsp"));
//			return;
//		} catch(RuntimeException ex){
//			String message = ex.getMessage();
//			String shortMsg = "" ;   
//			shortMsg =  message.substring(message.indexOf(":") + 1);
//			System.out.println(shortMsg);
//			session.setAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg  + "，請調正訂單內容" );
//			//System.out.println("處理訂單時發生異常: " + message);
//			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()+"/mall/ProductShowCart.jsp"));
//			return;
//		}
//	}
//
//}
