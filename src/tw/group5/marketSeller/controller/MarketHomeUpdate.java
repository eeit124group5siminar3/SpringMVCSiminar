package tw.group5.marketSeller.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.model.MarketPutOutBean;

@Controller
@SessionAttributes(names = "mBean")
public class MarketHomeUpdate {
	
	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ServletContext servletContext;
	
	
	// 跳轉到修改jsp
	@GetMapping(path = "/MarketProduct.goUpdateJsp")
	public String updateJsp(@RequestParam(name = "productid") int productid, Model m) {
		MarketProductTotalBean mBean = new MarketProductTotalBean();
		MarketProductImgBean iBean =new MarketProductImgBean();
		MarketPutOutBean pBean =new MarketPutOutBean();
		mBean.setMarketProductImgBean(iBean);
		iBean.setMarketProductTotalBean(mBean);
		mBean.setMarketPutOutBean(pBean);
		mBean = service.select(productid);
		m.addAttribute("mBean",mBean);
		System.out.println("狀態   "+mBean.getMarketPutOutBean().getPutOut());		
		return "marketSeller/MarketU";
	}
	
	
	@PostMapping(path = "/MarketProductUpdate" )
	public String update(@ModelAttribute(value = "mBean") MarketProductTotalBean mb){
		System.out.println("更新狀態   "+mb.getPutOut());
		service.update(mb);
		
		return "marketSeller/MarketS";
	}
	
}
