package tw.group5.mall.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;

@Controller
@SessionAttributes(names = {"bean"})
public class ProductPreUpdateServlet{
	@Autowired
	private ProductService productService;
	@GetMapping(value = "/ProductPreUpdateServlet")
	public String productPreUpdateServlet(@RequestParam(value = "ProductId") Integer productId,Model model){
		
		ProductBean bean = productService.getProduct(productId);
		System.err.println(bean.hashCode());
		model.addAttribute("bean", bean);	
		productService.setSelected(bean.getCategoryBean().getId());
		productService.setTagName("categoryId");
		String categoryTag = productService.getSelectTag();
		model.addAttribute("SelectCategoryTag", categoryTag);
		return "/mall/ProductUpdate";
	}
}
		
		
		
		
//		
//		HttpSession session = request.getSession(false);
//		if (session == null) {
//			response.sendRedirect(request.getContextPath() + "/index.jsp");
//			return;
//		}
//		int productId= 0;
//		String strProductId = request.getParameter("ProductId");
//
//		if (strProductId != null) {
//			productId = Integer.parseInt(strProductId);
//		}

//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session hibernateSession = factory.getCurrentSession();
//		ProductService productService = new ProductService(hibernateSession);
//		ProductBean bean = productService.getProduct(productId);
//		session.setAttribute("bean", bean);
//		productService.setSelected(bean.getCategory());
//
//		productService.setTagName("categoryId");
//		String categoryTag = productService.getSelectTag();
//		request.setAttribute("SelectCategoryTag", categoryTag);
//
//		RequestDispatcher rd = request.getRequestDispatcher("mall//ProductUpdate.jsp");
//		rd.forward(request, response);
//		return;
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		doGet(request, response);
//	}
//
//}
