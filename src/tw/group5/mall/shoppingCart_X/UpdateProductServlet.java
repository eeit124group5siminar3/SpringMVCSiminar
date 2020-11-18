package tw.group5.mall.shoppingCart_X;
//package tw.group5.mall.shoppingCart;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import tw.group5.mall.ShoppingCart;
//
//@Controller
//@SessionAttributes(names = { "ShoppingCart" })
//public class UpdateProductServlet {
//
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
//			cart.modifyQty(productId, newQty); // 修改某項商品的數項
//			return "/mall/ProductShowCart";
//		}
//		return "/mall/ProductShowCart";
//	}
//}
//
////		request.setCharacterEncoding("UTF-8");
////		session = request.getSession(false);
////		if (session == null) {      // 使用逾時
////			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
////			return;
////		}
////		//取出session物件內的ShoppingCart物件
////		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
////		if (sc == null) {
////			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
////			// 導向首頁
////			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
////			return;
////        }
//// cmd可能是DEL或是MOD
////		String cmd = request.getParameter("cmd");
////		String productIdStr = request.getParameter("ProductId");
////		int productId = Integer.parseInt(productIdStr.trim());
////		if (cmd.equalsIgnoreCase("DEL")) {
////	        sc.deleteBook(productId); // 刪除購物車內的某項商品
////	        RequestDispatcher rd = request.getRequestDispatcher("/mall/ProductShowCart.jsp");
////		    rd.forward(request, response);
////		    return;
////		} else if (cmd.equalsIgnoreCase("MOD")) {
////			String newQtyStr = request.getParameter("newQty");
////			int newQty = Integer.parseInt(newQtyStr.trim());
////			sc.modifyQty(productId, newQty);   // 修改某項商品的數項
////	        RequestDispatcher rd = request.getRequestDispatcher("/mall/ProductShowCart.jsp");
////		    rd.forward(request, response);
////		    return;
////		}
////	}
////}
