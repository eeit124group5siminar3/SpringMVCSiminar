package tw.group5.mall.shoppingCart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import tw.group5.mall.ShoppingCart;
/**
 * Servlet implementation class AbortServlet
 */
@WebServlet("/AbortServlet")
public class AbortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
		if (cart != null) {
			//由session物件中移除ShoppingCart物件
			session.removeAttribute("ShoppingCart");
		}
		response.sendRedirect(response.encodeRedirectURL ("RetrievePageProducts"));
		return;
	}
}
