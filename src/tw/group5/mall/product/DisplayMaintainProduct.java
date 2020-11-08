package tw.group5.mall.product;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names= { "MaintainPageNo","login_ok" })
public class DisplayMaintainProduct {
	public final int RECORDS_PER_PAGE = 5;
//	private int pageNo = 1;
	@Autowired
	private ProductService service;

	@GetMapping(value = "/DisplayMaintainProduct")
	public String displayMaintainProduct(@RequestParam(value = "MaintainPageNo", required = false) Integer maintainPageNo,
		@SessionAttribute(value ="login_ok",required = false )Member_SignUp mb,
			Model model) {
//		Member_SignUp mb = (Member_SignUp) model.getAttribute("login_ok");
		if (mb == null) {
			return "/index";
		}
		Integer producterId = mb.getMember_no();
		if (maintainPageNo == null) {
			if (model.getAttribute("MaintainPageNo") != null) {
				maintainPageNo = (Integer) model.getAttribute("MaintainPageNo");
			} else {
				maintainPageNo = 1;
			}
		} 
		model.addAttribute("baBean", service);
		service.setMaintainPageNo(maintainPageNo);
		service.setRecordsPerPage(RECORDS_PER_PAGE);
		model.addAttribute("totalPages", service.getTotalPages(producterId));
		Collection<ProductBean> coll = service.getPageProducts(producterId);
		model.addAttribute("MaintainPageNo", maintainPageNo);
		model.addAttribute("products_DPP", coll);
		return "/mall/ProductMaintainList";
	}
}
		// 先取出session物件
//		HttpSession session = request.getSession(false);
////		HttpSession session = request.getSession();
//		// 紀錄目前請求的RequestURI,以便使用者登入成功後能夠回到原本的畫面
//		String requestURI = request.getRequestURI();
//		// System.out.println("requestURI=" + requestURI);
//		// 如果session物件不存在
//		if (session == null || session.isNew()) {
//			// 請使用者登入
//			response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
//			return;
//		}
//		session.setAttribute("requestURI", requestURI);
//		// 此時session物件存在，讀取session物件內的LoginOK
//		// 以檢查使用者是否登入。
//		Member_SignUp mb = (Member_SignUp) model.getAttribute("login_ok");
//		if (mb == null) {
//			response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
//			return;
//		}
//		int producterId = mb.getMember_no();
//		String pageNoStr = request.getParameter("pageNo");
//		if (pageNoStr == null) {
//			pageNo = 1;
//		} else {
//			try {
//				pageNo = Integer.parseInt(pageNoStr.trim());
//			} catch (NumberFormatException e) {
//				pageNo = 1;
//			}
//		}
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session hibernateSession = factory.getCurrentSession();
//		ProductService service = new ProductService(hibernateSession);
//		//
//		request.setAttribute("baBean", service);
//		//
//		service.setPageNo(pageNo);
//		service.setRecordsPerPage(RECORDS_PER_PAGE);

//		Collection<ProductBean> coll = service.getPageProducts();
//		session.setAttribute("pageNo", pageNo);
////		request.setAttribute("totalPages", service.getTotalPages());
//		request.setAttribute("totalPages", service.getTotalPages(producterId));
//		Collection<ProductBean> coll = service.getPageProducts(producterId);
//		request.setAttribute("products_DPP", coll);
//		RequestDispatcher rd = request.getRequestDispatcher("mall/ProductMaintainList.jsp");
//		rd.forward(request, response);
//		return;
//	}
//}