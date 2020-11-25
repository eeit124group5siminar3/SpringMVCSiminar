package tw.group5.marketSeller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.service.MarketSellBeanService;

@Controller
@SessionAttributes(value = {"login_ok"} )
public class MarketHome {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	
	@Autowired
	private MarketSellBeanService sellerService;
	
	@GetMapping(value = "/GoMarketHome")
	public String goMarketHome() {
		return "marketSeller/MarketHome";
	}
	
	//取得頁面賣家
	@PostMapping(value = "/SellerContent")
	@ResponseBody
	public ModelAndView showAllSeller(HttpServletRequest request,
			@RequestParam(value = "pageNo", required = false) Integer pageNoP,
			@RequestParam(value = "searchString", required = false) String searchStringP
			){
		HttpSession session = request.getSession(false);
		Integer pageNo = (Integer) session.getAttribute("pageNo");
		int totalPages =sellerService.sellerPages();
		if (pageNoP != null) {
			pageNo=pageNoP;
			session.setAttribute("pageNo", pageNo);
		}
		List<MarketMallBean> list = sellerService.selectAllmall(pageNo,null);
		int totalPage =(int) Math.ceil(totalPages*1.0 /5);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/marketSeller/MarketHome");
		mav.addObject("seller_all",list);
		mav.addObject("totalPage",totalPage);
		return mav;
		
	}
}
