package tw.group5.marketSeller.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


import tw.group5.marketSeller.MarketCart;
import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.model.MarketOrderDetailBean;
import tw.group5.marketSeller.service.MarketOrderBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.marketSeller.model.MarketOrder;
@Controller
@SessionAttributes(value = {"login_ok","MarketCart"} )
public class MarketShoppingController {
	@Autowired
	private MarketOrderBeanService orderService;
	
	//跳轉購物車介面
 @GetMapping(value = "/GoMarketShoppingcart")
 public String productShowCart() {

 return "/marketSeller/MarketShoppingcart";
	}
 
//購物車介面
 @PostMapping(value = "/MarketCartContent")	
 public ModelAndView showMarketCart(@SessionAttribute(value = "MarketCart", required = false) MarketCart marketCart,
		 Model model) {
	 if (marketCart ==null) {
		marketCart =new MarketCart();
	}

	 
    ModelAndView mav =new ModelAndView();
    mav.setViewName("/marketSeller/MarketBuyerCart");
    mav.addObject("marketCart",marketCart);
	 return mav;
  }
 
//建立新訂單
	@GetMapping(value = "/Market_checkout")
	public String MarketCheckout(@SessionAttribute(value = "MarketCart", required = false) MarketCart marketCart,
			 @SessionAttribute(value = "login_ok") Member_SignUp mb,
			Model model) {
		MarketOrderBean order =new MarketOrderBean();
		model.addAttribute("order",order);
		return "/marketSeller/MarketSendOrder";
	}
// 送出訂單
	@PostMapping(value = "/MarketSendOrder")
	public String MarketOrder(
			@ModelAttribute(value ="order") MarketOrderBean order,
			@SessionAttribute(value = "MarketCart", required = false) MarketCart marketCart,
			 @SessionAttribute(value = "login_ok") Member_SignUp mb,
			Model model
			) {
		int allPrice=marketCart.getTotal();
		Date today = new Date();
		order.setBuyTime(today);
		order.setBuyerId(mb.getMember_no());
		order.setAllPrice(allPrice);
		Set<MarketOrderDetailBean> items =new HashSet<MarketOrderDetailBean>();
		Map<Integer,MarketOrder> carts =marketCart.getContent();
		Set<Integer> set =carts.keySet();
		for (Integer k : set) {
			MarketOrderDetailBean oid =new MarketOrderDetailBean();
			MarketOrder oi =carts.get(k);
			oid.setProductId(oi.getProductId());
			oid.setQuantity(oi.getQuantity());
			oid.setTotalPrice(oi.getPrice());
			oid.setProductName(oi.getProduct());	
			oid.setMarketOrderBean(order);
			oid.setSellerName(oi.getProducterName());
			oid.setSellerId(oi.getMemberNo());
			System.out.println("賣家的編號呢   :"+oi.getMemberNo());
			items.add(oid);
		}
		order.setMarketOrderDetailBean(items);
		orderService.insert(order);
		marketCart.deleteAllOrders();
		return "/mall/mall_thankForOrder";
	}

}
