package tw.group5.mall.shoppingCart_X;
//package tw.group5.mall.shoppingCart;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import tw.group5.mall.ShoppingCart;
//
//
//@Controller
//@SessionAttributes(names = {"ShoppingCart"}, types = ShoppingCart.class)
////@SessionScope
//public class AbortServlet{
////	@Autowired
////	private HttpSession session;
////	@Autowired
////	DefaultSessionAttributeStore dsas;
//
////	public String abortServlet(SessionStatus status
////			,@ModelAttribute(value = "ShoppingCart")ShoppingCart cart
////			,HttpServletRequest request,WebRequest request2,Model model) {
//////			,Model model,WebRequest request){
//////		cart=null;
//////		dsas=new DefaultSessionAttributeStore();
//////		cart.deleteAllBooks();
//////		cart.finalize();
//////     	request.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
//////		dsas.cleanupAttribute(request, "ShoppingCart");
//////		request.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
////		
////		HttpSession session=request.getSession(false);
//////		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
//////		cart=null;
////		request.removeAttribute("ShoppingCart");
////		session.removeAttribute("ShoppingCart");
////		status.setComplete();	
//////		
////
////		return "redirect:/RetrievePageProducts";
////	}
////}
//	@GetMapping("/AbortServlet")
//	public String abortServlet(Model model) {
//		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
//		if (cart != null) {
//			cart.deleteAllOrders();
//			cart=null;
//		}
//		return "redirect:/RetrievePageProducts";
//	}
//}
////        HttpSession session = request.getSession();
////        ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
////		if (cart != null) {
////			//由session物件中移除ShoppingCart物件
////			session.removeAttribute("ShoppingCart");
////		}
////		response.sendRedirect(response.encodeRedirectURL ("RetrievePageProducts"));
////		return;
////	}
////}
