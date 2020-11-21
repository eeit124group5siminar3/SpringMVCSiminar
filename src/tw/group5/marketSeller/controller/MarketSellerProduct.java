package tw.group5.marketSeller.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.MarketProductBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;


@Controller
@SessionAttributes(names = {"Insert1", "login_ok","mBean"})
public class MarketSellerProduct {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpSession session;
	

	// 顯示全部
	@RequestMapping(path = "/MarketProduct.selectAll", method = RequestMethod.GET)
	public String selectAll(@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model m) {
		
	if (mb == null) {
		return "/index";
	}
	
	Integer producterId = mb.getMember_no();
		
		List<MarketProductTotalBean> list = service.selectAll(producterId);
		m.addAttribute("list", list);
		return "marketSeller/MarketHome";
	}

	// 刪除單筆商品
	@RequestMapping(path = "/MarketProduct.delete", method = RequestMethod.POST)
	public String delete(@RequestParam(name = "productid") String productid, Model m) {
		int id = Integer.valueOf(productid);
		service.delete(id);

		return "marketSeller/MarketS";

	}

	// 跳轉到新增jsp 
	@GetMapping(path = "/MarketProduct.goInsertJsp" )
	public String insertJsp(Model model) {
        MarketProductTotalBean insert =new MarketProductTotalBean();
        MarketProductImgBean imgBean=new MarketProductImgBean();
        insert.setMarketProductImgBean(imgBean);
        imgBean.setMarketProductTotalBean(insert);
        System.out.println("跳過去囉");
        System.err.println(insert.hashCode());
        System.err.println(insert.getMarketProductImgBean());
        model.addAttribute("Insert1",insert);
		return "marketSeller/MarketI";
	}
	
	//新增
	@PostMapping(path = "/MarketProduct.insert")
	public String insert(Model model, @ModelAttribute(value = "Insert1") MarketProductTotalBean bean1,
			@SessionAttribute(value = "login_ok") Member_SignUp mb
			)throws IllegalStateException, IOException{
		   Map<String, String> errorMsgs = new HashMap<String, String>();
		   model.addAttribute("Errors",errorMsgs);
		   service.insert(bean1);
		return "marketSeller/MarketS";
		}
	
	
	// 跳轉到修改jsp
	@GetMapping(path = "/MarketProduct.goUpdateJsp")
	public String updateJsp(@RequestParam(name = "productid") int productid, Model m) {

		MarketProductTotalBean mBean = service.select(productid);
		m.addAttribute("mBean",mBean);

		return "marketSeller/MarketU";
	}
	//更新商品
	@PostMapping(path = "/MarketProductUpdate",produces = "multipart/data-form")
	public String update(@ModelAttribute(value = "mBean") MarketProductTotalBean mb ){

		service.update(mb);
		
		return "marketSeller/MarketS";
	}


	} 

