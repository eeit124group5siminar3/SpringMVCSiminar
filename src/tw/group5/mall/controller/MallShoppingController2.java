package tw.group5.mall.controller;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



import tw.group5.mall.ShoppingCart;
import tw.group5.mall.model.OrderItem;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(value = { "searchString", "pageNo", "login_ok", "login_guest", "ShoppingCart" })
public class MallShoppingController2 {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ProductService service;
//
//	@GetMapping(value = "/RetrievePageSearch", produces = "text/HTML;charset=UTF-8")
//	public String retrievePageProducts(@RequestParam(value = "pageNo", required = false) Integer pageNo,
//			@RequestParam(value = "searchString", required = false) String searchString,
//			@RequestParam(value = "search", required = false) String search,
//			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model model) {
//		if (mb == null) {
//			mb = new Member_SignUp();
//			mb.setMember_no(1);
//			model.addAttribute("login_guest", mb);
//		}
//		if (pageNo == null) {
//			if (model.getAttribute("pageNo") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			} else {
//				pageNo = 1;
//			}
//		}
//		model.addAttribute("baBean", service);
//		Collection<ProductBean> coll = null;
//		if (search != null) {
//			service.setPageNo(1);
//			pageNo = 1;
//		} else {
//			searchString = (String) model.getAttribute("searchString");
//		}
//		service.setPageNo(pageNo);
//
//		if (searchString != null) {
//			coll = service.getPageProductsWithoutZero(searchString);
//			model.addAttribute("totalPages", service.getTotalPagesWithoutZero(searchString));
//			
//		} else {
//			coll = service.getPageProductsWithoutZero();
//			model.addAttribute("totalPages", service.getTotalPagesWithoutZero());
//		}
//		model.addAttribute("searchString", searchString);
//		model.addAttribute("pageNo", pageNo);
//		model.addAttribute("products_DPP", coll);
//		return "mall/shop";
//	}

	@GetMapping(value = { "/RetrievePageProducts", "/RetrievePageProducts/{pageNo}" }, produces = {
			"application/json" })
	public @ResponseBody List<ProductBean> productList(
			@SessionAttribute(value = "pageNo", required = false) Integer pageNo,
//			@RequestParam(value = "searchString", required = false) String searchString,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model model,HttpServletRequest request) {
		List<ProductBean> list = null;
		String searchString=(String) model.getAttribute("searchString");
//		if (mb == null) {
//			mb = new Member_SignUp();
//			mb.setMember_no(1);
//			model.addAttribute("login_guest", mb);
//		}
		if (pageNo == null) {
			if (model.getAttribute("pageNo") != null) {
				pageNo = (Integer) model.getAttribute("pageNo");
			} else {
				pageNo = 1;
			}
		}
		service.setPageNo(pageNo);
		if (searchString == null || searchString.length() == 0) {
			list = service.getPageProductsWithoutZero();
		} else {
			list = service.getPageProductsWithoutZero(searchString);
		}
		model.addAttribute("searchString", searchString);
		model.addAttribute("pageNo", pageNo);
		return list;
	}

	@GetMapping(value = "/RetrievePage/{pageNo}", produces = { "text/html;charset=UTF-8" })
	public @ResponseBody String productPage(
//			@RequestParam(value = "searchString", required = false) String searchString,
			@PathVariable(value = "pageNo", required = false) Integer pageNo, Model model,HttpServletRequest request) {
		int totalPages = 1;
		String searchString=(String) model.getAttribute("searchString");
		System.err.println(searchString);
		if (searchString == null || searchString.length() == 0) {
			totalPages = service.getTotalPagesWithoutZero();
		} else {
			totalPages = service.getTotalPagesWithoutZero(searchString);
		}
		if (pageNo == null) {
			if (model.getAttribute("pageNo") != null) {
				pageNo = (Integer) model.getAttribute("pageNo");
			} else {
				pageNo = 1;
			}
		}
		model.addAttribute("pageNo", pageNo);
		return String.valueOf(totalPages);
	}

	@GetMapping(value = {"/RetrieveSearch/{searchString}","/RetrieveSearch"})
	public void searchProduct(@PathVariable(value = "searchString",required = false) String searchString, Model model) {
		System.err.println(searchString);
		if (searchString == null || searchString.length() == 0) {
			model.addAttribute("searchString", new String());
		} else {
			model.addAttribute("searchString", searchString);
		}
		model.addAttribute("searchString", searchString);
		System.err.println(model.getAttribute("searchString"));
	}

	@PostMapping(value = "/BuyProductServlet")
	public String buyProduct(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			@RequestParam(value = "product") String product, @RequestParam(value = "productId") Integer productId,
			@RequestParam(value = "producterId") Integer producterId,
			@RequestParam(value = "producterName", required = false) String producterName,
			@RequestParam(value = "content") Integer content, @RequestParam(value = "unit") String unit,
			@RequestParam(value = "qty") Integer qty, @RequestParam(value = "price") Double price,
			@RequestParam(value = "discount") Double discount, @RequestParam(value = "pageNo") Integer pageNo,
			Model model) {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		if (cart == null) {
			cart = (ShoppingCart) context.getBean("shoppingCart");
			model.addAttribute("ShoppingCart", cart);
		}
		if (pageNo == null) {
			if (model.getAttribute("pageNo") != null) {
				pageNo = (Integer) model.getAttribute("pageNo");
			} else {
				pageNo = 1;
			}
		}
		OrderItem oi = (OrderItem) context.getBean("orderItem");
		oi.setProductId(productId);
		oi.setProduct(product);
		oi.setContent(content);
		oi.setUnit(unit);
		oi.setQty(qty);
		oi.setProducterId(producterId);
		oi.setPrice(price);
		oi.setDiscount(discount);
		oi.setProducterName(producterName);
		cart.addToCart(productId, oi);
		return "redirect:/RetrievePageProducts?pageNo=" + pageNo;
	}
}
