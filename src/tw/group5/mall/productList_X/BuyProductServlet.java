package tw.group5.mall.productList_X;
//package tw.group5.mall.productList;
//
//import javax.servlet.ServletContext;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.context.WebApplicationContext;
//import org.springframework.web.context.support.WebApplicationContextUtils;
//
//import tw.group5.mall.ShoppingCart;
//import tw.group5.mall.model.OrderItem;
//
//@Controller
//@SessionAttributes(names = { "ShoppingCart" })
//public class BuyProductServlet {
//	@Autowired
//	private ServletContext servletContext;
//
//	@PostMapping(value = "/BuyProductServlet")
//	public String buyProductServlet(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
//			@RequestParam(value = "product") String product,
//			@RequestParam(value = "productId") Integer productId,
//			@RequestParam(value = "producterId") Integer producterId,
//			@RequestParam(value = "producterName",required = false) String producterName,
//			@RequestParam(value = "content") Integer content,
//			@RequestParam(value = "unit") String unit,
//			@RequestParam(value = "qty") Integer qty,
//			@RequestParam(value = "price") Double price,
//			@RequestParam(value = "discount") Double discount,
//			@RequestParam(value = "pageNo") Integer pageNo,
//			Model model){
//		WebApplicationContext context=WebApplicationContextUtils.getWebApplicationContext(servletContext);
//		if (cart==null) {
//			cart=(ShoppingCart) context.getBean("shoppingCart");
//			model.addAttribute("ShoppingCart",cart);
//		}
//		if (pageNo == null) {
//			if (model.getAttribute("pageNo") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			} else {
//				pageNo = 1;
//			}
//		} 
//		OrderItem oi=(OrderItem) context.getBean("orderItem");
//		oi.setProductId(productId);
//		oi.setProduct(product);
//		oi.setContent(content);
//		oi.setUnit(unit);
//		oi.setQty(qty);
//		oi.setProducterId(producterId);
//		oi.setPrice(price);
//		oi.setDiscount(discount);
//		oi.setProducterName(producterName);
//		cart.addToCart(productId, oi);
//		return "redirect:/RetrievePageProducts?pageNo=" + pageNo;
//	}
//}
////		// 只要舊的Session物件，如果找不到，不要建立新的Session物件，直接傳回 null
////		HttpSession session = request.getSession(false);
////
////		if (session == null) {
////			// 請使用者登入
////			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "./index.jsp"));
////			return;
////		}
////
////		// 取出存放在session物件內的ShoppingCart物件
////		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
////		// 如果找不到ShoppingCart物件
////		if (cart == null) {
////			// 就新建ShoppingCart物件
////			cart = new ShoppingCart();
////			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
////			session.setAttribute("ShoppingCart", cart);
////		}
//
////		String product = request.getParameter("product");
////		String producterIdstr = request.getParameter("producterId");
////		String unit = request.getParameter("unit");
////		String pageNo = request.getParameter("pageNo");
////		String qtyStr = request.getParameter("qty");
////		String productIdStr = request.getParameter("productId");
////		String priceStr = request.getParameter("price");
////		String discountStr = request.getParameter("discount");
////		String contentStr = request.getParameter("content");
////		String producterName = request.getParameter("producterName");
////		System.out.println(producterName);
////		if (pageNo == null || pageNo.trim().length() == 0) {
////			pageNo = (String) session.getAttribute("pageNo");
////			if (pageNo == null) {
////				pageNo = "1";
////			}
////		}
////		int qty = 0;
////		int productId = 0;
////		double price = 0;
////		double discount = 0;
////		int content = 0;
////		int producterId = 0;
////		try {
////			// 進行資料型態的轉換
////			qty = Integer.parseInt(qtyStr.trim());
////			productId = Integer.parseInt(productIdStr.trim());
////			content = Integer.parseInt(contentStr.trim());
////			price = Double.parseDouble(priceStr.trim());
////			discount = Double.parseDouble(discountStr.trim());
////			producterId = Integer.parseInt(producterIdstr.trim());
////
////		} catch (NumberFormatException e) {
////			throw new ServletException(e);
////		}
////		// 將訂單資料封裝到OrderItem物件內
////		OrderItem oi = new OrderItem(product, producterId, content, unit, qty, productId, price, discount,
////				producterName);
////		// 將OrderItem物件內加入ShoppingCart的物件內
////		cart.addToCart(productId, oi);
////		RequestDispatcher rd = request.getRequestDispatcher("/RetrievePageProducts?pageNo=" + pageNo);
////		rd.forward(request, response);
////	}
////
////}
