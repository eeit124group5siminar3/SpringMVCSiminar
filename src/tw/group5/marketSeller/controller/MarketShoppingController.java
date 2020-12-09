package tw.group5.marketSeller.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.marketSeller.MarketCart;
@Controller
@SessionAttributes(value = {"login_ok","MarketCart"} )
public class MarketShoppingController {
	
 @PostMapping(value = "/MarketCartContent")	
 public ModelAndView showMarketCart(@SessionAttribute(value = "MarketCart", required = false) MarketCart marketCart,
		 Model model) {
	 if (marketCart ==null) {
		marketCart =new MarketCart();
	}
    ModelAndView mav =new ModelAndView();
    mav.setViewName("/marketSeller/MarketBuyerCart");
    mav.addObject("marketCart",marketCart);
	
	 return null;
 }

}
