package tw.group5.active.controller;



import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	
	
//======================================消費者報名=============================================	
	
	//報名活動準備
	@GetMapping(path = "/actSignPreInsert.do")
	public String actSignPreInsert(Model model,
			@RequestParam(value = "id") Integer actId,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb 
			) {
		
		if(mb == null) {
			return "Member_SignUp/Member_Login";
		}else {
			
		ActOrd actSign = new ActOrd();
		ActFarmer actFarmer = actFarmerService.getActFarmer(actId);
		
		Member_SignUp mbBean = mbService.select_member_no(Integer.toString(mb.getMember_no()));
		model.addAttribute("actsigninert", actSign);//裝準備新增進去的資料
		model.addAttribute("actFarmer", actFarmer);//裝要用到的活動資料
		model.addAttribute("mbBean", mbBean);
		System.err.println(actSign.getActFarmer());
		return "active/actSignForm1";		
		}
	}
	
	//報名活動(新增)
	@PostMapping(value = "/actSignInsert.do")
	public String actSignInsert(Model model,
		@ModelAttribute(value = "actsigninert") ActOrd aoInsert,
		@SessionAttribute(value = "actFarmer") ActFarmer actFarmer,
		@SessionAttribute(value = "login_ok") Member_SignUp mb) {
		System.err.println(aoInsert.getActFarmer());
		System.err.println(actFarmer.getActId());
		aoInsert.setActFarmer(actFarmer);
		
		//新增訂單產生時間
		Timestamp time= new Timestamp(System.currentTimeMillis());//獲取系統當前時間 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeStr = df.format(time); 
		time = Timestamp.valueOf(timeStr); 
		aoInsert.setOrdTime(time);
		
		actOrdService.insertActOrd(aoInsert);
		return "active/actFarmerHome";
		
	}
	
	//======================================廠商CRUD=============================================	
	

	//查詢該活動的訂單
	@RequestMapping(value = "/actOrdList.do")
	public String actOrdList(Model model,
		@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, 
		@RequestParam(value = "actId") Integer actId
		){
		Collection<ActOrd> collOrd = actOrdService.getActOrdsById(actId);
		if(collOrd.isEmpty()) {
			return "redirect:/maintainActFarmer.do";
		}else {
			System.out.println("到底有沒有訂單請繼續看下去"+collOrd);
			model.addAttribute("collOrd", collOrd);
			return "/active/actOrdMaintain";			
		}
	}
	
	
	public String actOrdOne(Model model,
		@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, 
		@RequestParam(value = "actOrdId") Integer actOrdId,
		@RequestParam(value = "actId") Integer actId) {
		
		Collection<ActOrd> collOrd = actOrdService.getActOrdsByOrdId(actOrdId, actId);
		if(collOrd.isEmpty()) {
			return "redirect:/maintainActFarmer.do";
		}else {
			System.out.println("到底有沒有訂單請繼續看下去"+collOrd);
			model.addAttribute("collOrd", collOrd);
			return "/active/actOrdMaintain";			
		}
		
	}
}
