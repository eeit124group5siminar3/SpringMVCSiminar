package tw.group5.active.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActOrd;
import tw.group5.active.service.ActFarmerService;
import tw.group5.active.service.ActOrdService;
import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names= {"pageNo","login_ok","actFarmer","actOrd"})
public class ActSignController {
	
	@Autowired
	private ActFarmerService actFarmerService;
	
	@Autowired
	private ActOrdService actOrdService;
	
	@Autowired
	private Member_Service mbService;
	
	
	//查詢報名活動
	
	
	
	//報名活動準備
	@GetMapping(path = "/actSignPreInsert.do")
	public String actSignPreInsert(Model model,
			@RequestParam(value = "id") Integer actId,
			@SessionAttribute(value = "login_ok") Member_SignUp mb
			) {
		ActOrd actSign = new ActOrd();
		ActFarmer actFarmer = actFarmerService.getActFarmer(actId);
		
		Member_SignUp mbBean = mbService.select_member_no(Integer.toString(mb.getMember_no()));
		model.addAttribute("actsigninert", actSign);//裝準備新增進去的資料
		model.addAttribute("actFarmer", actFarmer);//裝要用到的活動資料
		model.addAttribute("mbBean", mbBean);
		return "active/actSignForm1";		
	}
	
	//報名活動(新增)
	@PostMapping(value = "/actSignInsert.do")
	public String actSignInsert(Model model,
		@ModelAttribute(value = "actsigninert") ActOrd aoInsert,
		@SessionAttribute(value = "login_ok") Member_SignUp mb) {
			
		actOrdService.insertActOrd(aoInsert);
		return "redirect:/actFarmerList.do/{pageNo}";
		
	}
	
	

}
