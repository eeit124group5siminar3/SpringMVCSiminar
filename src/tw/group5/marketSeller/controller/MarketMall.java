package tw.group5.marketSeller.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.service.MarketSellBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = {"newMall","login_ok"})
public class MarketMall {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	@Autowired
	private MarketSellBeanService service;
	
	//註冊成為市場賣家(跳頁面)
	@GetMapping(path = "/MarketMall.goInsertJsp" )
	public String goInsert(Model model,@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb
			)throws IllegalStateException, IOException{
		
		if (mb == null) {
			return "Member_SignUp/Member_Login";
		}
		
		MarketMallBean insertBean =new MarketMallBean();
        model.addAttribute("Insert",insertBean);
		return "marketSeller/MarketMallInsert";
		}
	@PostMapping(path = "/MarketMall.Insert")
	public String insert(Model model,@ModelAttribute(value = "Insert") MarketMallBean bean,
			@SessionAttribute(value = "login_ok") Member_SignUp mb
			)throws IllegalStateException, IOException{
		    Integer mNo =mb.getMember_no();
		    Integer status=1;
		    bean.setMemberNo(mNo);
		    bean.setMallStatus(status);
		    service.insert(bean);
		return "marketSeller/MarketMallSuccess";
	}
}