package tw.group5.marketSeller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductTotalBean;

@Controller
public class MarketHomeUpdate {
	
	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpServletRequest request;
	
	
	// 跳轉到修改jsp
	@RequestMapping(path = "/MarketProduct.goUpdateJsp" ,method = RequestMethod.POST)
	public String updateJsp(@RequestParam(name = "productid") int productid, Model m) {
		MarketProductTotalBean mBean = service.select(productid);
		m.addAttribute("list",mBean);
		return "marketSeller/MarketU";
	}

}
