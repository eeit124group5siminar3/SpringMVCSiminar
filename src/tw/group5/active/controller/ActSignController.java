package tw.group5.active.controller;



import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Iterator;

import javax.persistence.criteria.From;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		//新增報名訂單
		actOrdService.insertActOrd(aoInsert);	
		
		
		//取得信用卡付款畫面
//		ExampleAllInOne all = new ExampleAllInOne();
//		
//		String form = all.genAioCheckOutALL();
		
		String tradeNo= aoInsert.getActOrdId().toString();
		String tradeDate=aoInsert.getOrdTime().toString().substring(0, 19);
		String tradeTotal=Integer.toString(aoInsert.getTotalPrice().intValue());
		String tradeItem=aoInsert.getActFarmer().getActName();
		String tradeDesc=aoInsert.getOrdActNum().toString()+"人";
		
		System.out.println("到底有沒有有沒有有沒有"+tradeNo);
		System.out.println("印出來是什麼呢?"+tradeDate);
		String form = actOrdService.payActSign(tradeNo,tradeDate,tradeTotal,tradeItem,tradeDesc);
		model.addAttribute("form", form);
		return "active/EcpayForTest";
		
	}
	

	//查詢會員報名的活動
	@RequestMapping(value = "actOrdSelect.do")
	public String actOrdSelect( Model model,
		@RequestParam(value = "pageNo", required = false) Integer pageNo,
		@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb
		) {
		if(mb == null) {
			return "Member_SignUp/Member_Login";
		}else {
//		if(pageNo == null) {
//			if(model.getAttribute("pageNo") != null)
//		}
		Integer memNo=mb.getMember_no();
		Collection<ActOrd> collActOrds = actOrdService.getActOrds(memNo);
		model.addAttribute("collActOrds", collActOrds);
		return "/active/actSignOrd";
		}
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
	
	//刪除某一筆訂單
	@PostMapping(value = "/actOrdDelet.do")
//	public String actOrdDelet(@RequestParam(value="actOrd")ActOrd actOrd, Model model) {
		public String actOrdDelet(@RequestParam(value="actOrdId")Integer actOrdId, Model model) {
//		Integer id = Integer.valueOf(actOrdId);
//		Collection<ActOrd> collOrd= (Collection<ActOrd>) model.getAttribute("collOrd");
//		Iterator<ActOrd> iterator = collOrd.iterator();
//		ActOrd actOrd=null;
//		if(iterator.hasNext()) {
//		for(ActOrd ao:iterator) {
//			ActOrd ao=(ActOrd)iterator.next();
//			if(ao.getActOrdId()==actOrdId) {	
//			actOrd=ao;
//			}
//		}
//		ActOrd actOrdOne = actOrdService.getActOrdOne(actOrdId);
//		actOrdService.delectActOrd(actOrdId);
		actOrdService.delectActOrd(actOrdId);
//		System.err.println(actOrdId);
//		System.err.println(bean.getActOrdId());
		return "redirect:/maintainActFarmer.do";
		
	}
	
	//修改活動準備(找到該筆物件)
	@GetMapping(value = "/actOrdPreUpdate.do")
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
