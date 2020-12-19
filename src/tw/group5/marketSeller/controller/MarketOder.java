package tw.group5.marketSeller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.model.MarketOrderDetailBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.MarketOrderBeanService;
import tw.group5.marketSeller.service.MarketProductBeanService;
import tw.group5.marketSeller.service.MarketSellBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
public class MarketOder {
	@Autowired
	private MarketOrderBeanService service;
	@Autowired
	private MarketProductBeanService productService;
	@Autowired
	private MarketSellBeanService sellerService;

	
	@RequestMapping(path = "/MarketBuyerOrder", method = RequestMethod.GET)
	public String selectBuyerOrder(
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model m
			) {
		if (mb == null) {
			return "Member_SignUp/Member_Login";
		}
		Integer mid  = mb.getMember_no();
		List<MarketOrderBean> bean = service.selectBuyerOrder(mid);
		m.addAttribute("list",bean);
		return "marketSeller/MarketBuyerOrder";
	}
	
	
//	顯示訂單詳細資料
	@PostMapping(value = "/showOrderDetail")
	public ModelAndView showBuyerOrderDetail(HttpServletRequest request,
			@RequestParam(value = "oId", required = false) Integer oId){
        List<MarketOrderDetailBean> order = service.selectBuyerOrderDetail(oId);
        ModelAndView mav =new ModelAndView();
		mav.setViewName("/marketSeller/MarketShowBuyerOrderDetail");
		mav.addObject("order",order);
		return mav;
	}
	
	@RequestMapping(path = "/MarketSellerOrder", method = RequestMethod.GET)
	public String selectSellerOrder(
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model m
			) {
		if (mb == null) {
			return "Member_SignUp/Member_Login";
		}
		Integer mid  = mb.getMember_no();
		System.out.println("哭阿 數字呢"+mid);
		List<MarketOrderBean> bean = service.selectSellerOrder(mid);

		m.addAttribute("list",bean);
		return "marketSeller/MarketSellerOrder";
	}
}
