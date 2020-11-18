package tw.group5.mall.product_X;
//package tw.group5.mall.product;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import tw.group5.mall.model.ProductBean;
//import tw.group5.mall.service.ProductService;
//
//@Controller
//public class ProductDeleteServlet {
//
//	private ProductService service;
//
//	@PostMapping(value = "/ProductDeleteServlet")
//	public String productDeleteServlet(@RequestParam(value = "productId") Integer productId, Model model) {
//		ProductBean n = service.deleteProduct(productId);
//		if (n != null) {
//			model.addAttribute("ProductDeleteMsg", "商品編號(" + productId + ")刪除成功");
//		} else {
//			model.addAttribute("ProductDeleteMsg", "商品編號(" + productId + ")刪除失敗");
//		}
//		return "redirect:/DisplayMaintainProduct";
//	}
//
//}
//
////HttpSession session = request.getSession();
////String pId = request.getParameter("productId");
////int productId = Integer.parseInt(pId);
////SessionFactory factory = HibernateUtil.getSessionFactory();
////Session hibernateSession = factory.getCurrentSession();
////ProductService service = new ProductService(hibernateSession);