package tw.group5.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class PageTo {
	
	@GetMapping(value = "/productShowCart")
	public String productShowCart() {
		return "/mall/ProductShowCart";
	}
	@GetMapping(value = "/shop")
	public String shopPage() {
		return "/mall/shop";
	}
}
