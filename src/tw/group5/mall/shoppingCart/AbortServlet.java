package tw.group5.mall.shoppingCart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.DefaultSessionAttributeStore;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.context.request.WebRequest;

import tw.group5.mall.ShoppingCart;


@Controller
@SessionAttributes(names = {"ShoppingCart"}, types = ShoppingCart.class)
//@SessionScope
public class AbortServlet{
//	@Autowired
//	private HttpSession session;
//	@Autowired
//	DefaultSessionAttributeStore dsas;

	@RequestMapping(value = "/AbortServlet",method = {RequestMethod.GET,RequestMethod.POST})
	public String abortServlet(SessionStatus status
			,@ModelAttribute(value = "ShoppingCart")ShoppingCart cart
			,HttpServletRequest request,WebRequest request2,Model model) {
//			,Model model,WebRequest request){
//		cart=null;
//		dsas=new DefaultSessionAttributeStore();
//		cart.deleteAllBooks();
//		cart.finalize();
//     	request.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
//		dsas.cleanupAttribute(request, "ShoppingCart");
//		request.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		
//		HttpSession session=request.getSession(false);
//		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
//		cart=null;
//		request.removeAttribute("ShoppingCart");
//		session.removeAttribute("ShoppingCart");
		status.setComplete();	
//		

		return "redirect:/RetrievePageProducts";
	}
}
//	public String abortServlet(Model model) {
//		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
//		System.err.println(cart);
//		if (cart != null) {
////			model.addAttribute("ShoppingCart", null);
////			ShoppingCart cart2 = (ShoppingCart) model.getAttribute("ShoppingCart");
////			cart=null;
////			model.addAttribute("ShoppingCart", cart);
//			cart.deleteAllBooks();
//			cart=null;
//			System.err.println(cart);
////			System.err.println(cart2);
//		}
//		return "redirect:/RetrievePageProducts";
//	}
//}
//        HttpSession session = request.getSession();
//        ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
//		if (cart != null) {
//			//由session物件中移除ShoppingCart物件
//			session.removeAttribute("ShoppingCart");
//		}
//		response.sendRedirect(response.encodeRedirectURL ("RetrievePageProducts"));
//		return;
//	}
//}
