package tw.group5.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.ShoppingCart;

import tw.group5.mall.model.CategoryClass;
import tw.group5.mall.model.OrderItem;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;

@Controller
@SessionAttributes(value = { "login_ok", "login_guest", "ShoppingCart" })
public class MallShoppingController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ProductService service;

//取得頁面商品
	@PostMapping(value = "/MallContent")
	public ModelAndView showMallContent(HttpServletRequest request,
			@RequestParam(value = "pageNo", required = false) Integer pageNoP,
			@RequestParam(value = "searchString", required = false) String searchStringP,
			@RequestParam(value = "categoryId", required = false) Integer categoryIdP) {
		HttpSession session = request.getSession(false);
		Integer pageNo = (Integer) session.getAttribute("pageNo");
		if (pageNoP != null) {
			pageNo = pageNoP;
			session.setAttribute("pageNo", pageNo);
			service.setPageNo(pageNo);
		}
		String searchString = (String) session.getAttribute("searchString");
		if (searchStringP != null) {
			searchString = searchStringP;
			session.setAttribute("searchString", searchString);
			service.setSearchString(searchString);
		}
		Integer categoryId = (Integer) session.getAttribute("categoryId");
		if (categoryIdP != null) {
			categoryId = categoryIdP;
			if (categoryId == 0) {
				session.setAttribute("categoryId", categoryId);
				categoryId = null;
				service.setCategoryId(categoryId);
			} else {
				session.setAttribute("categoryId", categoryId);
				service.setCategoryId(categoryId);
			}
		}
		int totalPages = service.getTotalPagesWithoutZero();
		List<ProductBean> list = service.getPageProductsWithoutZero();
		Map<Integer, String> map = CategoryClass.CATEGORY_MAP;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/pageProduct");
		mav.addObject("totalPages", totalPages);
		mav.addObject("products_DPP", list);
		mav.addObject("categoryBean", map);
		return mav;
	}

// 顯示單筆商品資料及加入購物車
	@PostMapping(value = "/SingleProduct")
	public ModelAndView showSingleProduct(@RequestParam(value = "productId", required = false) Integer productId,
			@RequestParam(value = "qty", required = false) Integer qty,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart, Model model) {
		ProductBean selectedProduct = service.getProduct(productId);
		OrderItem oi = new OrderItem();
		oi.setProductId(selectedProduct.getProductId());
		oi.setProduct(selectedProduct.getProduct());
		oi.setContent(selectedProduct.getContent());
		oi.setUnit(selectedProduct.getUnit());
		oi.setProducterId(selectedProduct.getProducterId());
		oi.setPrice(selectedProduct.getPrice());
		oi.setDiscount(selectedProduct.getDiscount());
		oi.setProducterName(selectedProduct.getProducterName());
		oi.setQty(0);
		if (qty != null) {
			if (cart == null) {
				cart = new ShoppingCart();
				model.addAttribute("ShoppingCart", cart);
			}
			oi.setQty(qty);
			cart.addToCart(productId, oi);
			oi = cart.getContent().get(productId);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/singleProduct");
		mav.addObject("selectedProduct", selectedProduct);
		mav.addObject("oi", oi);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 直接加入購物車
	@PostMapping(value = "/AddToCart")
	public ModelAndView addToCart(@RequestParam(value = "productId") Integer productId,
			@RequestParam(value = "qty") Integer qty,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart, Model model) {
		ProductBean selectedProduct = service.getProduct(productId);
		OrderItem oi = new OrderItem();
		oi.setProductId(selectedProduct.getProductId());
		oi.setProduct(selectedProduct.getProduct());
		oi.setContent(selectedProduct.getContent());
		oi.setUnit(selectedProduct.getUnit());
		oi.setProducterId(selectedProduct.getProducterId());
		oi.setPrice(selectedProduct.getPrice());
		oi.setDiscount(selectedProduct.getDiscount());
		oi.setProducterName(selectedProduct.getProducterName());
		oi.setQty(0);
		if (cart == null) {
			cart = new ShoppingCart();
			model.addAttribute("ShoppingCart", cart);
		}
			oi.setQty(qty);
			cart.addToCart(productId, oi);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/shoppingcartContent");

		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 購物車內容
	@PostMapping(value = "/CartContent")
	public ModelAndView showCartContent(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			Model model) {
		if (cart == null) {
			cart = new ShoppingCart();
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/mall_shoppingcart");
		mav.addObject("ShoppingCart", cart);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}
}
//	@RequestMapping(value = "/jQueryTest")
//	@ResponseBody
//	public Integer getInteger (@RequestParam(value = "num1")Integer num1,@RequestParam(value = "num2")Integer num2,@RequestParam(value = "num3")Integer num3) {
//		return num1+num2+num3;
//	}

//	@PostMapping(value = "/BuyProductServlet")
//	public String buyProduct(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
//			@RequestParam(value = "product") String product, @RequestParam(value = "productId") Integer productId,
//			@RequestParam(value = "producterId") Integer producterId,
//			@RequestParam(value = "producterName", required = false) String producterName,
//			@RequestParam(value = "content") Integer content, @RequestParam(value = "unit") String unit,
//			@RequestParam(value = "qty") Integer qty, @RequestParam(value = "price") Double price,
//			@RequestParam(value = "discount") Double discount, @RequestParam(value = "pageNo") Integer pageNo,
//			Model model) {
//		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
//		if (cart == null) {
//			cart = (ShoppingCart) context.getBean("shoppingCart");
//			model.addAttribute("ShoppingCart", cart);
//		}
//		if (pageNo == null) {
//			if (model.getAttribute("pageNo") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			} else {
//				pageNo = 1;
//			}
//		}
//		OrderItem oi = (OrderItem) context.getBean("orderItem");
//		oi.setProductId(productId);
//		oi.setProduct(product);
//		oi.setContent(content);
//		oi.setUnit(unit);
//		oi.setQty(qty);
//		oi.setProducterId(producterId);
//		oi.setPrice(price);
//		oi.setDiscount(discount);
//		oi.setProducterName(producterName);
//		cart.addToCart(productId, oi);
//		return "redirect:/RetrievePageProducts?pageNo=" + pageNo;
//	}
//	@GetMapping(value = { "/RetrievePageProducts", "/RetrievePageProducts/{pageNo}" }, produces = {
//			"application/json" })
//	public @ResponseBody List<ProductBean> productList(
////			@SessionAttribute(value = "pageNo", required = false) Integer pageNo, 
//			Model model,
//			HttpServletRequest request) {
//		List<ProductBean> list = null;
////		HttpSession session = request.getSession(false);
//		String searchString = (String) request.getAttribute("searchString");
//		Integer pageNo=(Integer) request.getAttribute("pageNo");
//		if (pageNo == null) {
//			if (model.getAttribute("pageNo") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			} else {
//				pageNo = 1;
//			}
//		}
////		service.setPageNo(pageNo);
////		if (searchString == null || searchString.length() == 0) {
//		list = service.getPageProductsWithoutZero();
////		} else {
////			list = service.getPageProductsWithoutZero(searchString);
////		}
//		request.setAttribute("searchString", searchString);
//		model.addAttribute("pageNo", pageNo);
//		return list;
//	}

//取得所有頁面數
//	@GetMapping(value = "/RetrievePage/{pageNo}", produces = { "text/html;charset=UTF-8" })
//	public @ResponseBody String productPage(@PathVariable(value = "pageNo", required = false) Integer pageNo,
//			Model model, HttpServletRequest request) {
////		int totalPages = 1;
////		HttpSession session = request.getSession(false);
////		String searchString = (String) request.getAttribute("searchString");	
////		if (searchString == null || searchString.length() == 0) {
//		Integer totalPages = service.getTotalPagesWithoutZero();
////		} else {
////			totalPages = service.getTotalPagesWithoutZero(searchString);
////		}
////		if (pageNo == null) {
////			if (model.getAttribute("pageNo") != null) {
////				pageNo = (Integer) model.getAttribute("pageNo");
////			} else {
////				pageNo = 1;
////			}
////		}
//		service.setPageNo(pageNo);
//		request.getSession(false).setAttribute("pageNo", pageNo);
////		model.addAttribute("pageNo", pageNo);
//		return String.valueOf(totalPages);
//	}

//設定查詢字串
//	@GetMapping(value = { "/RetrieveSearch/{searchString}", "/RetrieveSearch" })
//	@ResponseBody
//	public void searchProduct(@PathVariable(value = "searchString", required = false) String searchString, Model model,
//			HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//		if (searchString == null || searchString.length() == 0) {
//			session.setAttribute("searchString", null);
//			service.setSearchString(null);
//		} else {
//			session.setAttribute("searchString", searchString);
//			service.setSearchString(searchString);
//		}
//		request.setAttribute("searchString", searchString);
//	}

// 設定查詢種類
//	@GetMapping(value = "/RetrieveCategory/{categoryId}")
//	@ResponseBody
//	public Map<Integer, String> categoryList(@PathVariable(value = "categoryId") Integer categoryId,HttpServletRequest request) {
//		Map<Integer, String> map=CategoryClass.CATEGORY_MAP;
//		if (categoryId == 0) {
//			categoryId = null;
//		}
//		request.getSession(false).setAttribute("categoryId", categoryId);
//		service.setCategoryId(categoryId);
//		return map;
//	}