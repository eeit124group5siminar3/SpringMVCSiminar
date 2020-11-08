package tw.group5.mall.shoppingCart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.mall.ShoppingCart;

@Controller
@SessionAttributes(names = { "ShoppingCart" })
public class CheckoutServlet {

	@GetMapping(value = "/CheckoutServlet")
	public String checkoutServlet(Model model) {

		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (cart == null) {
			return "/index";
		}

		return "/mall/OrderConfirm";
	}
}

//    	
//		HttpSession session = request.getSession(false);
//
//		if (session == null) {      // 使用逾時
//			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
//			return;
//		}
//		
//		
//		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
//		if (sc == null) {
//			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
//			// 導向首頁
//			response.sendRedirect(getServletContext().getContextPath()
//					+ "/index.jsp");
//			return;
//		}
//		// 結帳
//		RequestDispatcher rd = request.getRequestDispatcher("/mall/OrderConfirm.jsp");
//		rd.forward(request, response);
//		return;
//	}
//
//}
