	package tw.group5.mall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.ShoppingCart;

import tw.group5.mall.model.CategoryClass;
import tw.group5.mall.model.OrderItem;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProductFavoriteBean;
import tw.group5.mall.service.ProductService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
//@Transactional
@SessionAttributes(value = { "login_ok", "login_guest", "ShoppingCart" })
public class MallShoppingController {

	@Autowired
	private ProductService service;

//取得頁面商品
	@PostMapping(value = "/MallContent")
	public ModelAndView showMallContent(HttpServletRequest request,
			@RequestParam(value = "mall_pageNo", required = false) Integer pageNoP,
			@RequestParam(value = "mall_searchString", required = false) String searchStringP,
			@RequestParam(value = "mall_categoryId", required = false) Integer categoryIdP,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart, Model model) {
		if (cart == null) {
			cart = new ShoppingCart();
			model.addAttribute("ShoppingCart", cart);
		}
		HttpSession session = request.getSession(false);
		Integer pageNo = (Integer) session.getAttribute("mall_pageNo");
		if (pageNoP != null) {
			pageNo = pageNoP;
			session.setAttribute("mall_pageNo", pageNo);
			service.setPageNo(pageNo);
		}
		String searchString = (String) session.getAttribute("mall_searchString");
		if (searchStringP != null) {
			searchString = searchStringP;
			session.setAttribute("mall_searchString", searchString);
			service.setSearchString(searchString.toUpperCase());
		}
		Integer categoryId = (Integer) session.getAttribute("mall_categoryId");
		if (categoryIdP != null) {
			categoryId = categoryIdP;
			if (categoryId == 0) {
				session.setAttribute("mall_categoryId", categoryId);
				categoryId = null;
				service.setCategoryId(categoryId);
			} else {
				session.setAttribute("mall_categoryId", categoryId);
				service.setCategoryId(categoryId);
			}
		}
		int totalPages = service.getTotalPagesWithoutZero();
		List<ProductBean> list = service.getPageProductsWithoutZero(mb);
		Map<Integer, String> map = CategoryClass.CATEGORY_MAP;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/pageProduct");
		mav.addObject("mall_totalPages", totalPages);
		mav.addObject("products_DPP", list);
		mav.addObject("categoryBean", map);
		System.err.println("我是路人甲");
		return mav;
	}

// 顯示單筆商品資料及加入購物車
	@PostMapping(value = "/SingleProduct")
	public ModelAndView showSingleProduct(@RequestParam(value = "productId", required = false) Integer productId,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb,
			@RequestParam(value = "qty", required = false) Integer qty,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart, Model model) {
		ProductBean selectedProduct = service.getProduct(productId, mb);
		selectedProduct.setViews(selectedProduct.getViews() + 1);
		OrderItem oi = new OrderItem();
		oi.setProductId(selectedProduct.getProductId());
		oi.setProduct(selectedProduct.getProduct());
		oi.setContent(selectedProduct.getContent());
		oi.setUnit(selectedProduct.getUnit());
		oi.setProducterId(selectedProduct.getProducterBean().getMember_no());
		oi.setPrice(selectedProduct.getPrice());
		oi.setDiscount(selectedProduct.getDiscount());
		oi.setProducterName(selectedProduct.getProducterName());
		oi.setStock(selectedProduct.getStock());
		oi.setQty(0);
		if (cart == null) {
			cart = new ShoppingCart();
			model.addAttribute("ShoppingCart", cart);
		}
		cart.addToCart(productId, oi);
		if (qty != null) {
			oi.setQty(qty);
			cart.addToCart(productId, oi);
		}
		oi = cart.getContent().get(productId);
		Integer shoppingcartItemNum=cart.getItemNumber();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/singleProduct");
		mav.addObject("selectedProduct", selectedProduct);
		mav.addObject("oi", oi);
		mav.addObject("ShoppingCartItemNum", shoppingcartItemNum);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 取的上一筆商品ID
	@PostMapping(value = "/preProduct")
	public @ResponseBody Integer getPreId(@RequestParam(value = "productId") Integer productId) {
		Integer preProductId = service.getPreProductId(productId);
		return preProductId;
	}

// 取的下一筆商品ID
	@PostMapping(value = "/nextProduct")
	public @ResponseBody Integer getNextId(@RequestParam(value = "productId") Integer productId) {
		Integer nextProductId = service.getNextProductId(productId);
		return nextProductId;
	}

// 直接加入購物車
	@RequestMapping(value = "/AddToCart", method = { RequestMethod.GET, RequestMethod.POST })
	public String addToCart(@RequestParam(value = "productId", required = false) Integer productId,
			@RequestParam(value = "qty", required = false) Integer qty,
			@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart, Model model) {
		if (productId != null) {
			ProductBean selectedProduct = service.getProduct(productId, null);
			selectedProduct.setViews(selectedProduct.getViews() + 1);
			OrderItem oi = new OrderItem();
			oi.setProductId(selectedProduct.getProductId());
			oi.setProduct(selectedProduct.getProduct());
			oi.setContent(selectedProduct.getContent());
			oi.setUnit(selectedProduct.getUnit());
			oi.setProducterId(selectedProduct.getProducterBean().getMember_no());
			oi.setPrice(selectedProduct.getPrice());
			oi.setDiscount(selectedProduct.getDiscount());
			oi.setProducterName(selectedProduct.getProducterName());
			oi.setStock(selectedProduct.getStock());
			oi.setQty(0);
			if (cart == null) {
				cart = new ShoppingCart();
				model.addAttribute("ShoppingCart", cart);
			}
			oi.setQty(qty);
			cart.addToCart(productId, oi);
		}
		return "/mall/mall_shoppingcart";
	}

// 購物車內容
	@PostMapping(value = "/CartContent")
	public ModelAndView showCartContent(@SessionAttribute(value = "ShoppingCart", required = false) ShoppingCart cart,
			Model model) {
		if (cart == null) {
			cart = new ShoppingCart();
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/shoppingcartContent");
		mav.addObject("ShoppingCart", cart);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}

// 設定願望清單
	@GetMapping(value = "/SetFavorite")
	public @ResponseBody Boolean setFavorite(@SessionAttribute(value = "login_ok") Member_SignUp mb,
			@RequestParam(value = "productId") Integer productId) {
		ProductFavoriteBean pfb = service.getFavorite(mb.getMember_no(), productId);
		if (pfb == null) {
			pfb = new ProductFavoriteBean();
			pfb.setUserId(mb.getMember_no());
			pfb.setProductId(productId);
			pfb.setStatus(1);
			service.saveFavorite(pfb);
			return true;
		} else if (pfb.getStatus() == 0) {
			pfb.setStatus(1);
			return true;
		} else {
			pfb.setStatus(0);
			return false;
		}
	}

// 顯示願望清單
	@PostMapping(value = "/WishListContent")
	public ModelAndView showWishListContent(@SessionAttribute(value = "login_ok") Member_SignUp mb,
			@RequestParam(value = "productId", required = false) Integer productId) {
		Integer userId = mb.getMember_no();
		if (productId != null) {
			service.cancelFavorite(userId, productId);
		}
		List<ProductBean> list = service.getFavoriteList(userId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/wishListContent");
		mav.addObject("productWishList", list);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}
	
// 顯示推薦商品
	@PostMapping(value = "/RecommendedProducts")
	public ModelAndView recommendedProducts(){
		List<ProductBean> list=service.getRecommendedProducts();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/recommendedProducts");
		mav.addObject("recommendedProducts", list);
		mav.setStatus(HttpStatus.OK);
		return mav;
	}
}