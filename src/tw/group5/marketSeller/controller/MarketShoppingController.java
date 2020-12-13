package tw.group5.marketSeller.controller;


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
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(value = {"login_ok","MarketCart"} )
public class MarketShoppingController {

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
		java.util.Date date = new java.util.Date();
		
		order.setBuyTime(date);
		
		
		model.addAttribute("order",order);
		return "/marketSeller/MarketSendOrder";
	}
// 送出訂單
	@PostMapping(value = "/MarketSendOrder")
	public String MarketOrder(
			@ModelAttribute(value ="order") MarketOrderBean order,
			Model model
			) {
		   
		return null;
	}

}
