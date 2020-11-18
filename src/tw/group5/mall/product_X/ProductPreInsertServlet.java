package tw.group5.mall.product_X;
//package tw.group5.mall.product;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import tw.group5.mall.model.ProductBean;
//import tw.group5.mall.service.ProductService;
//
//@Controller
//@SessionAttributes(names = {"SelectCategoryTag"})
//public class ProductPreInsertServlet{
//	@Autowired
//	private ProductService productService;
//	@GetMapping(value = "/ProductPreInsertServlet")
//	public String productPreInsertServlet(Model model){
//		ProductBean insert=new ProductBean();
//		productService.setTagName("categoryId");
//		String categoryTag = productService.getSelectTag();
//		model.addAttribute("SelectCategoryTag", categoryTag);
//		model.addAttribute("Insert", insert);
//		model.addAttribute("baBean", productService);
//		return "/mall/ProductInsert";
//	}
//}
//		// 本類別負責讀取資料庫內Book表格內某一頁的紀錄，並能新增紀錄、修改紀錄、刪除記錄等
////		SessionFactory factory = HibernateUtil.getSessionFactory();
////		Session hibernateSession = factory.getCurrentSession();
////		ProductService productService = new ProductService(hibernateSession);
////		productService.setTagName("categoryId");
////		String categoryTag = productService.getSelectTag();
////		request.getSession(false).setAttribute("SelectCategoryTag", categoryTag);
////
////		request.setAttribute("baBean", productService);
////		RequestDispatcher rd = request.getRequestDispatcher("mall/ProductInsert.jsp");
////		rd.forward(request, response);
////		return;
////	}
////
////
////}
