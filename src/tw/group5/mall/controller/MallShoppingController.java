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
import tw.group5.mall.model.CategoryBean;
import tw.group5.mall.model.OrderItem;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;

@Controller
@SessionAttributes(value = { "pageNo", "login_ok", "login_guest", "ShoppingCart" })
public class MallShoppingController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ProductService service;

//取得頁面商品
	@GetMapping(value = { "/RetrievePageProducts", "/RetrievePageProducts/{pageNo}" }, produces = {
			"application/json" })
	public @ResponseBody List<ProductBean> productList(
			@SessionAttribute(value = "pageNo", required = false) Integer pageNo, Model model,
			HttpServletRequest request) {
		List<ProductBean> list = null;
//		HttpSession session = request.getSession(false);
		String searchString = (String) request.getAttribute("searchString");
		if (pageNo == null) {
			if (model.getAttribute("pageNo") != null) {
				pageNo = (Integer) model.getAttribute("pageNo");
			} else {
				pageNo = 1;
			}
		}
//		service.setPageNo(pageNo);
//		if (searchString == null || searchString.length() == 0) {
		list = service.getPageProductsWithoutZero();
//		} else {
//			list = service.getPageProductsWithoutZero(searchString);
//		}
		request.setAttribute("searchString", searchString);
		model.addAttribute("pageNo", pageNo);
		return list;
	}

//取得所有頁面數
	@GetMapping(value = "/RetrievePage/{pageNo}", produces = { "text/html;charset=UTF-8" })
	public @ResponseBody String productPage(@PathVariable(value = "pageNo", required = false) Integer pageNo,
			Model model, HttpServletRequest request) {
//		int totalPages = 1;
//		HttpSession session = request.getSession(false);
//		String searchString = (String) request.getAttribute("searchString");	
//		if (searchString == null || searchString.length() == 0) {
		Integer totalPages = service.getTotalPagesWithoutZero();
//		} else {
//			totalPages = service.getTotalPagesWithoutZero(searchString);
//		}
//		if (pageNo == null) {
//			if (model.getAttribute("pageNo") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			} else {
//				pageNo = 1;
//			}
//		}
		service.setPageNo(pageNo);
		model.addAttribute("pageNo", pageNo);
		return String.valueOf(totalPages);
	}

//設定查詢字串
	@GetMapping(value = { "/RetrieveSearch/{searchString}", "/RetrieveSearch" })
	@ResponseBody
	public void searchProduct(@PathVariable(value = "searchString", required = false) String searchString, Model model,
			HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
		if (searchString == null || searchString.length() == 0) {
			model.addAttribute("searchString", null);
			service.setSearchString(null);
		} else {
			model.addAttribute("searchString", searchString);
			service.setSearchString(searchString);
		}
		request.setAttribute("searchString", searchString);
	}

// 設定查詢種類
	@GetMapping(value = "/RetrieveCategory/{categoryId}")
	@ResponseBody
	public List<CategoryBean> categoryList(@PathVariable(value = "categoryId") Integer categoryId) {
		List<CategoryBean> list = service.getCategory();
		if (categoryId == 0) {
			categoryId = null;
		}
		service.setCategoryId(categoryId);
		return list;
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
