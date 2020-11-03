package tw.group5.marketSeller.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;






@Controller
public class MarketHome  {

	
	@RequestMapping(path = "/selectAll.controller" ,method = RequestMethod.GET )
	public String selectAll() {
		System.out.println("來到MarketHome的Controller");

		return "marketSeller/MarketHome";
	}
	
	

}
