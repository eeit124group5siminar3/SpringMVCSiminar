package tw.group5.marketSeller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.service.MarketOrderBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
public class MarketOder {
	@Autowired
	private MarketOrderBeanService service;
	
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

}
