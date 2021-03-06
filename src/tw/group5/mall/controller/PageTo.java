package tw.group5.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class PageTo {
	
	@GetMapping(value = "/productShowCart")
	public String productShowCart() {
		return "/mall/ProductShowCart";
	}
	@GetMapping(value = "/mall_shop")
	public String shopPage() {
		return "/mall/mall_shop";
	}
	@GetMapping(value = "/mall_shoppingcart")
	public String shoppingcartPage() {
		return "/mall/mall_shoppingcart";
	}
	
	@GetMapping(value = "/mall_order")
	public String orderPage() {
		return "/mall/mall_order";
	}
	
	@GetMapping(value = "/mall_management")
	public String managementPage() {
		return "/mall/mall_management";
	}
	
	@GetMapping(value = "/mall_manageOrder")
	public String manageOrderPage() {
		return "/mall/mall_manageOrder";
	}
	
	@GetMapping(value = "/Member_Login")
	public String loginOK() {
		return "/Member_SignUp/Member_Login";
	}
	
	@GetMapping(value = "/mall_wishList")
	public String wishListPage() {
		return "/mall/mall_wishList";
	}
	
	@GetMapping(value = "/mall_analysis")
	public String analysisPage() {
		return "/mall/mall_analysis";
	}
	
	@GetMapping(value = "/Member_Update")
	public String member_Update() {
		return "/Member_Backstage/Member_Update";
	}
//	@GetMapping(value = "/mall_checkout")
//	public String checkOut() {
//		return "/mall/mall_checkout";
//	}
}
