package tw.group5.active.controller;



import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Iterator;

import javax.persistence.criteria.From;
import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import example.ExampleAllInOne;
import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.SelfInjection.Split;
import oracle.net.aso.m;
import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActOrd;
import tw.group5.active.service.ActFarmerService;
import tw.group5.active.service.ActOrdService;
import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.util.SendMail;

@Controller
@SessionAttributes(names= {"pageNo","login_ok","actFarmer","actOrd","aoBean","collOrd"})
public class ActSignController {
	
	@Autowired
	private ActFarmerService actFarmerService;
	
	@Autowired
	private ActOrdService actOrdService;
	
	@Autowired
	private Member_Service mbService;	
	
	
	
//	@Autowired
//	private HttpRequest request;
	
	
//======================================消費者報名=============================================	
	
	//報名活動準備
	@RequestMapping(path = "/actSignPreInsert.do")
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
		model.addAttribute("actsigninert", actSign); //裝準備新增進去的資料
		model.addAttribute("actFarmer", actFarmer); //裝要用到的活動資料
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
		Timestamp time= new Timestamp(System.currentTimeMillis()); //獲取系統當前時間 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeStr = df.format(time);
		
		time = Timestamp.valueOf(timeStr); 
		aoInsert.setOrdTime(time);
		aoInsert.setOrdState(1);
		aoInsert.setPayWay(0);
		//新增報名訂單
		actOrdService.insertActOrd(aoInsert);	
				
		//取得信用卡付款畫面
//		ExampleAllInOne all = new ExampleAllInOne();		
//		String form = all.genAioCheckOutALL();
		
		String tradeNo= aoInsert.getActOrdId().toString();
		String tradeDate=aoInsert.getOrdTime().toString().substring(0, 19);
		String tradeTotal=Integer.toString(aoInsert.getTotalPrice().intValue());
		String tradeItem=aoInsert.getActFarmer().getActName();
		String tradeDesc=aoInsert.getOrdActNum().toString()+"人";
		
//		System.out.println("到底有沒有有沒有有沒有"+tradeNo);
//		System.out.println("印出來是什麼呢?"+tradeDate);
		String form = actOrdService.payActSign(tradeNo,tradeDate,tradeTotal,tradeItem,tradeDesc);
		model.addAttribute("actOrdId",tradeNo);
		model.addAttribute("form", form);
		return "active/EcpayForTest";
//		return "redirect:/actOrdSelect.do";  //新增DB用

		
	}

	//跳轉畫面	
	@RequestMapping(value = "actSignSucess.do")
	public String actSignSucess() {	
		System.out.println("成功寄信了嗎?看到他就對了");
		return "/active/actSuccess";
	}
	
	
	//寄信通知消費者
	@GetMapping(value = "actSendSignMail.do")
	public String actSendSignMail(
		@RequestParam(name = "actOrdId") String id,
		@SessionAttribute(value = "login_ok") Member_SignUp mb
		) {
		
		//寄信
		Integer actOrdId= Integer.parseInt(id);
		ActOrd aoBean = actOrdService.getActOrdOne(actOrdId);
		String who = mb.getMember_name(); //會員名稱
		String email = mb.getMember_email(); //會員E-mail
		String actName = aoBean.getActFarmer().getActName(); //參加的活動
		String ordActNum = aoBean.getOrdActNum().toString(); //報名人數
		String actDateSta = aoBean.getActFarmer().getActDateSta().toString(); //活動日期時間
		String actTimeSta = aoBean.getActFarmer().getActTimeSta().toString();
		String actDateEnd = aoBean.getActFarmer().getActDateEnd().toString();
		String actTimeEnd = aoBean.getActFarmer().getActTimeEnd().toString();
		String actAddr = aoBean.getActFarmer().getActAddr(); //活動地址
		String actEmail = aoBean.getMemEmail(); //活動主辦Email
		String tel = aoBean.getActFarmer().getTel(); //活動主辦電話
		String ordTime =aoBean.getOrdTime().toString();
		String title = "農郁活動系統通知" + actName;

		
		
		String text= who + "您好:<br>"
				+"非常感謝您使用農郁報名活動，您於" + ordTime + "報名了「 " +actName+ " 」的活動<br>"
				+"報名人數為 " + ordActNum + " 位<br>"
				+"活動時間: " + actDateSta + " " + actTimeSta + "至" + actDateEnd +" " + actTimeEnd +"<br>"
				+"活動地址:" + actAddr + "<br><br>"
				+"活動聯絡電話: "+ tel + "<br>"
				+"活動聯絡信箱" + actEmail + "<br>";
		
		new SendMail(email, title, text);
		
		System.out.println("確認一下到底有沒有寄出信");
	
		return "redirect:/actSignSucess.do";
	}

	//查詢會員報名的活動
	@RequestMapping(value = "actOrdSelect.do")
	public String actOrdSelect( Model model,
		@RequestParam(value = "pageNo", required = false) Integer pageNo,
		@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb
		) {
		if(mb == null) {
			return "Member_SignUp/Member_Login";
		}
		
		if(pageNo == null) {
			if(model.getAttribute("pageNo") != null) {
				pageNo = (Integer) model.getAttribute("pageNo");
			}else {
				pageNo = 1;
			}
		}	
		Integer memNo=mb.getMember_no();
//		Collection<ActOrd> collActOrds = actOrdService.getActOrds(memNo);
		Collection<ActOrd> collActOrds = actOrdService.getPageActOrds(memNo);
		model.addAttribute("totalPages", actOrdService.getTotalPages(memNo));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("collActOrds", collActOrds);
		return "/active/actSignOrd";
		}
	
	//======================================廠商CRUD=============================================	
	

	//查詢該活動的訂單
	@RequestMapping(value = "/actOrdList.do")
	public String actOrdList(Model model,
		@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, 
		@RequestParam(value = "actId") Integer actId
		){
			Collection<ActOrd> collOrd = actOrdService.getActOrdsById(actId);
			System.out.println("到底有沒有訂單請繼續看下去"+collOrd);
			model.addAttribute("collOrd", collOrd);
			return "/active/actSignMaintain";			
	}
	
//	//查詢該活動的某一筆訂單
//	public String actOrdOne(Model model,
//		@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, 
//		@RequestParam(value = "actOrdId") Integer actOrdId,
//		@RequestParam(value = "actId") Integer actId) {
//		
//		Collection<ActOrd> collOrd = actOrdService.getActOrdsByOrdId(actOrdId, actId);
//		if(collOrd.isEmpty()) {
//			return "redirect:/maintainActFarmer.do";
//		}else {
//			model.addAttribute("collOrd", collOrd);
//			return "/active/actOrdMaintain";			
//		}		
//	}
	
	//刪除某一筆訂單(假的)
	@PostMapping(value = "/actOrdDelet.do")
	public String actOrdDelet(Model model,
			@RequestParam(value="actOrdId") Integer actOrdId
			) {
		ActOrd aoBean = actOrdService.getActOrdOne(actOrdId);	
		aoBean.setOrdState(2);
		actOrdService.updateActOrd(aoBean);
					
		return "redirect:/maintainActFarmer.do";
		
	}
	
	//修改活動準備(找到該筆物件)
	@RequestMapping(value = "/actOrdPreUpdate.do")
	public String actOrdPreUpdate(Model model,
		@RequestParam(value="actOrdId") Integer actOrdId,
		@RequestParam(value="actId") Integer actId
		) {
		
		ActOrd aoBean = actOrdService.getActOrdOne(actOrdId);	
//		ActFarmer afBean = actFarmerService.getActFarmer(actId);
//		aoBean.setActFarmer(afBean);
		
		model.addAttribute("aoBean", aoBean);
		return "/active/actSignUpdate";
	}
	
	//修改某一筆報名訂單
	@PostMapping(value = "/actOrdUpdate.do")
	public String actOrdUpdate(@ModelAttribute(value = "aoBean")ActOrd actOrd,
		Model model, @SessionAttribute(value = "login_ok")Member_SignUp mb) {		
//		actOrd.setMemName(((Object) request).getParameter("memName"));
//		actOrd.getMemTel();
//		actOrd.getMemEmail();
//		actOrd.getOrdActNum();
//		actOrd.getTotalPrice();
		
		System.out.println(actOrd.toString());
		actOrdService.updateActOrd(actOrd);
		return "redirect:/maintainActFarmer.do";
	}
	
	
	
	
}
