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
}
