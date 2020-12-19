package tw.group5.active.controller;


import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.faces.event.PostPutFlashValueEvent;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActOrd;
import tw.group5.active.service.ActFarmerService;
import tw.group5.active.service.ActOrdService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = {"login_ok","actFarmer","actOrd"})
public class ActAdminController {
	
	@Autowired
	private ActFarmerService actFarmerService;	
	
	@Autowired
	private ActOrdService actOrdService;

//======================================  活動總覽  =======================================================================
	
	//查詢所有活動
	@RequestMapping(value = "getAllActFarmer.do")
	public String getAllActFarmer(Model model,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb) {
		
		model.addAttribute("actFarmer", actFarmerService);
		Collection<ActFarmer> collFarmer = actFarmerService.getAllActFarmers();
		model.addAttribute("collFarmer", collFarmer);
		return "/activeAdmin/actAdminHome";
	}
	
	//檢視該活動
	@RequestMapping(value = "getActByIdForAdmin.do")
	public String getActByIdForAdmin(Model model,
			@RequestParam(value = "actId") Integer actId) {
		
		ActFarmer afBean = actFarmerService.getActFarmer(actId);
		model.addAttribute("afBean", afBean);
		return "/activeAdmin/actAdminActByIdR";
	}

	//更新準備
	@RequestMapping(value = "actAdminPreUpdate.do")
	public String actAdminPreUpdate(Model model, 
			@RequestParam(value = "actId") Integer actId) {
		
		ActFarmer afBean = actFarmerService.getActFarmer(actId);
		model.addAttribute("afBean", afBean);
		return "/activeAdmin/actAdminActByIdU";
	}	
	
	//更新該活動
	@PostMapping(value = "actAdminUpdate.do")
	public String actAdminUpdate(Model model,
		@ModelAttribute(value = "afBean") ActFarmer actFarmer
		) {
		if(actFarmer.getActImg() == null) {
			ActFarmer originActFarmer = actFarmerService.getActFarmer(actFarmer.getActId());
			Blob tempBlob = originActFarmer.getActImg();
			
			try {				
				SerialBlob sb = new SerialBlob(tempBlob);
				originActFarmer.setActImg(null);				
				actFarmer.setActImg(sb);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		actFarmerService.updateActFarmer(actFarmer);
		return "redirect:/getAllActFarmer.do";
	}
	
	//刪除改活動
	@PostMapping(value = "actAdminDelect.do")
	public String actAdminDelect(@RequestParam(value = "actId")Integer actId,Model model) {
		Integer id =Integer.valueOf(actId);
		System.out.println("你有沒有接到參數阿!!不要不刪東西喔"+id);
		actFarmerService.deletActFarmer(id);
		return "redirect:/getAllActFarmer.do";
	}

	
	
//======================================  報名管理  =======================================================================

	//查詢所有訂單
	@RequestMapping(value = "actAdminSign.do")
	public String actAdminSign(Model model,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb
	) {

		Collection<ActOrd> collActOrds = actOrdService.getActAdminOrds();
		model.addAttribute("collActOrds", collActOrds);
		return "/activeAdmin/actAdminSignHome";
	}
	
	
	//檢視訂單
	@RequestMapping(value = "actAdminSignR.do")
	public String actAdminSignR(Model model,
		@RequestParam(name="actOrdId") Integer actOrdId		
		) {
		
		ActOrd aoBean = actOrdService.getActOrdOne(actOrdId);
		model.addAttribute("aoBean", aoBean);
		
		return "/activeAdmin/actAdminSignByIdR";
	}
	
	
	//修改準備
	@RequestMapping(value = "actAdminPreSignU.do")
	public String actAdminPreSignU(Model model,
		@RequestParam(name="actOrdId") Integer actOrdId		
		) {
		
		ActOrd aoBean = actOrdService.getActOrdOne(actOrdId);
		model.addAttribute("aoBean", aoBean);
		
		return "/activeAdmin/actAdminSignByIdU";
	}
	
	//修改訂單
	@RequestMapping(value = "actAdminSignU.do")	
	public String actAdminSignU(Model model,
			@ModelAttribute(value = "aoBean") ActOrd actOrd
			) {
		
		actOrdService.updateActOrd(actOrd);
		return "/activeAdmin/actAdminSignHome";
	}
	
	
	//刪除訂單
	@RequestMapping(value = "actAdminSignD.do")
	public String actAdminSignD(Model model,
			@RequestParam(name="actOrdId")Integer actOrdId){		
			
		actOrdService.delectActAdminOrd(actOrdId);	
		return "redirect:/actAdminSign.do";
	}

	
//======================================  報名訂單分析  =============================================================
	
	//訂單類型的比例圖
	@PostMapping(value = "/actAnalysisType.do")
	@ResponseBody
	public LinkedHashMap<String, Object> actAnalysisType() {
		
		LinkedHashMap<String, Integer> list = null;
		list = actOrdService.countActType();
		LinkedHashMap<String, Object> map = new LinkedHashMap();
		map.put("actTypeData", list);
		System.out.println(map);
		
		return map;
	}
	
	//取得活動總金額等
	@RequestMapping(value="/actTotal.do", produces = {"application/json;charset=UTF-8" })
	@ResponseBody
	public LinkedHashMap<String, Object> actTotal(){
		
		LinkedHashMap<String, Integer> list = null;
		list = actOrdService.countTotal();
		LinkedHashMap<String, Object> map = new LinkedHashMap();
		map.put("list", list);
		System.out.println(map);
		
		return map;
	}

	//隨機灌訂單================================================================================
//	 @GetMapping(path="/initRandomOrder")
//	 public String randomOrder() {
//	  
//	  int smin = 5;  //活動最小值
//	  int smax = 47;  //活動最大值
//	  int priceMin = 100;  //價格
//	  int priceMax = 2000; //價格
////	  int rbPriceMin = 350;  //價格
////	  int rbPriceMax = 2000; //價格
////	  int rbmin = 271; //單車
////	  int rbmax = 397; //單車
//	  int mmin = 63; //會員
//	  int mmax = 81; //會員
//	  int countMax = 6; //數量最大
//	  int countMin = 1; //數量最小
//	  Random random = new Random();
//	  
//	  for(int i=1;i<50;i++) {
//	   
//	   //先創建ORDERID 
//	   for(int s = 1005;s<=1035;s++) {
//	   String actOrdId =; //起始店家(每家都有)
//	   
//	   int st1 = random.nextInt(smax)%(smax-smin+1) + smin; //隨機生成活動
//	   int totalPrice = random.nextInt(priceMax)%(priceMax-priceMin+1) + priceMin; //隨機生成的價格
//	   //String priceStr = String.valueOf(price);
//	   int member = random.nextInt(mmax)%(mmax-mmin+1) + mmin; //隨機生成的會員
//	   String memNo = String.valueOf(member);
//	   String date = actOrdService.randomDate("2020-01-01 00:00:00","2020-12-08 00:00:00").get(0); //隨機生成日期
//
//	   
//	   String 
//	   
//	   ActOrd actOrd = actOrdService.;//篩選起始店家物件
//	   RbOrder order = new RbOrder(memberId,bgStore,edStore,bgDate,edDate,selectBgTime,selectEdTime,totalPrice,date);
//	   rbOrderService.insertRbOrder(order);
//	   
//	  
//	   
//	   }
//	  }         
//	  return "rental/orderSuccess";
//	 }
	
}
