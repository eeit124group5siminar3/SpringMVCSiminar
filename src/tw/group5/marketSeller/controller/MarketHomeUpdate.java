package tw.group5.marketSeller.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;

@Controller
public class MarketHomeUpdate {
	
	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpServletRequest request;
	
	
	// 跳轉到修改jsp
	@RequestMapping(path = "/MarketProduct.goUpdateJsp" ,method = RequestMethod.GET)
	public String updateJsp(@RequestParam(name = "productid") int productid, Model m) {
		MarketProductTotalBean mBean = service.select(productid);
		m.addAttribute("list",mBean);
		return "marketSeller/MarketU";
	}
	
	
	@RequestMapping(path = "/MarketProduct.Update" ,method = RequestMethod.POST)
	public String update(@RequestParam(name = "productId" )int productId,
			@RequestParam(name = "product_name") String product_name,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "product_area") String product_area,
			@RequestParam(name = "price") String priceStr,
			@RequestParam(name = "quantity") String quantityStr,
			@RequestParam(name = "unit") String unit,
			MarketProductTotalBean bean1,MarketProductImgBean bean2,Model m){
             
		int price = Integer.parseInt(priceStr);
		int  quantity = Integer.parseInt(quantityStr);
		bean1.setProductId(productId);
		bean1.setProductName(product_name);
		bean2.setDescription(description);
		bean1.setProductArea(product_area);
		bean1.setPrice(price);
		bean1.setQuantity(quantity);
		bean1.setUnit(unit);
		bean1.setMarketProductImgBean(bean2);
	    bean2.setMarketProductTotalBean(bean1);
        service.update(bean1);
		
		
		
		return "marketSeller/MarketS";
	}
	
	

}
