package tw.group5.marketSeller.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.ShoppingCart;
import tw.group5.marketSeller.MarketCart;
import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.model.MarketOrderDetailBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.MarketOrderBeanService;
import tw.group5.marketSeller.service.MarketProductBeanService;
import tw.group5.marketSeller.service.MarketSellBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.model.MarketOrder;
@Controller
@SessionAttributes(value = {"login_ok","MarketCart"} )
public class MarketShoppingController {
	@Autowired
	private MarketOrderBeanService orderService;
	@Autowired
	private MarketProductBeanService productService;
	@Autowired
	private MarketSellBeanService mallService;
	
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
// 
//刪除購物車內物件
	@PostMapping(value = "/DeleteCart")
	public ModelAndView deleteOrderItem(@SessionAttribute(value = "MarketCart", required = false) MarketCart marketCart,
			@RequestParam(value = "productId") Integer productId) {
		marketCart.deleteOrder(productId);
		ModelAndView mav = new ModelAndView();
		Integer shoppingcartItemNum=marketCart.getItemNumber();
		mav.setViewName("/marketSeller/MarketBuyerCart");
		mav.addObject("marketCart", marketCart);
		mav.addObject("ShoppingCartItemNum", shoppingcartItemNum);
		mav.setStatus(HttpStatus.OK);
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
			MarketProductTotalBean bean = productService.select(oi.getProductId());
			System.out.println("a賣家ID出來:"+oi.getSellerId());
			MarketMallBean bean2 =  mallService.selectid(oi.getSellerId());
			oid.setMarketProductTotalBean(bean);
			oid.setMarketMallBean(bean2);
			oid.setQuantity(oi.getQuantity());
			oid.setMarketOrderBean(order);
			items.add(oid);
		}
		order.setMarketOrderDetailBean(items);
		orderService.insert(order);
		marketCart.deleteAllOrders();
		return "/mall/mall_thankForOrder";
	}

}
