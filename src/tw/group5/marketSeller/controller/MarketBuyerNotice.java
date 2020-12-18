package tw.group5.marketSeller.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.ShoppingCart;
import tw.group5.marketSeller.model.MarketNotice;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.MarketNoticeService;
import tw.group5.marketSeller.service.MarketProductBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(value = {"login_ok"} )
public class MarketBuyerNotice {
	
	@Autowired
	private MarketNoticeService noticeService;

	 @GetMapping(value = "/GoShowNotice")
	 public String productShowNotice() {

	 return "/marketSeller/MarketBuyerNotice";
		}
	
	 
		@PostMapping(value = "/ShowNotice")
		@ResponseBody
		public ModelAndView ShowNotice(@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb
				){
            List<MarketNotice> notice = noticeService.selectBuyerNotice(mb.getMember_no());
            System.out.println("嘿嘿 ID"+mb.getMember_no());
			ModelAndView mav = new ModelAndView();
		    mav.setViewName("/marketSeller/MarketProductNotice");
		    mav.addObject("notice",notice);
		    mav.setStatus(HttpStatus.OK);
			return mav;		
		}
	 
	
		@PostMapping(value = "/deleteNotice")
		public ModelAndView deleteNotice(@RequestParam(value = "noticeId") Integer noticeId,
				@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb) {
			List<MarketNotice> notice = noticeService.selectBuyerNotice(mb.getMember_no());
            noticeService.delete(noticeId);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/marketSeller/MarketProductNotice");
			mav.addObject("notice",notice);
			mav.setStatus(HttpStatus.OK);
			return mav;
		}
		
		
}
