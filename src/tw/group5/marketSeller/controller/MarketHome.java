package tw.group5.marketSeller.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductTotalBean;


@Controller
public class MarketHome  {
	
	@Autowired
	private MarketProductBeanService service; 
	@Autowired
	private HttpServletRequest request;
	
	//顯示全部
	@RequestMapping(path = "/selectAll.controller" ,method = RequestMethod.GET )
	public String selectAll(Model m) {
		System.out.println("來到MarketHome的Controller");
		List<MarketProductTotalBean> list = service.selectAll(); 
		m.addAttribute("list" , list);
		return "marketSeller/MarketHome";
	}
	
	//刪除單筆商品
	@RequestMapping(path = "/delete.controller" ,method = RequestMethod.POST)
	public String delete(@RequestParam(name = "productid") String productid,Model m) {
		int id=Integer.valueOf(productid);
		service.delete(id);
		
		return "marketSeller/MarketS";

	}
	
	
	
	

}
