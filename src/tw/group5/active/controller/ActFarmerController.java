package tw.group5.active.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActFarmerService;
import tw.group5.active.model.Clock;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = {"MaintainPageNo", "login_ok"})
public class ActFarmerController {
	public final int RECORDS_PER_PAGE = 5;
	
	@Autowired
	private ActFarmerService actFarmerService;
	
//	@Autowired
//	private HttpServletRequest request;
//	
//	@Autowired
//	private HttpServletResponse response;
	
	@Autowired
	ServletContext ctx;
	
	//查詢所有活動-一日農夫
	@RequestMapping(value = "")
	public String getAllactFarmer(Model model) {
		Collection<ActFarmer> collFarmers = actFarmerService.getPageActFarmers();
		model.addAttribute("collFarmers", collFarmers);
		return "";
	}
	
	//廠商活動管理頁面-一日農夫
	@RequestMapping(value = "allActFarmer.do")
	public String allActFarmer(
			@RequestParam(value = "MaintainPageNo", required = false) Integer maintainPageNo,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model model
			) {
		try {
		if (mb == null) {
			return "/index";
		}
		Integer sellerId = mb.getMember_no();
		Collection<ActFarmer> collFarmer = actFarmerService.getActFarmers(sellerId);
		model.addAttribute("collFarmer", collFarmer);
		return "/active/actFarmerMaintain";
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return "/index";
	}
		
	
	
	
	//廠商活動管理頁面(分頁)-一日農夫
	@GetMapping(value = "maintainActFarmer.do")
	public String maintainActFarmer(
			@RequestParam(value = "MaintainPageNo", required = false) Integer maintainPageNo,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model model) {
		if(mb == null) {
			return "/index";
		}
		
		Integer sellerId = mb.getMember_no();
		
		if(maintainPageNo == null) {
			if(model.getAttribute("MaintainPageNo") != null) {
				maintainPageNo = (Integer) model.getAttribute("MaintainPageNo");
			}else {
				maintainPageNo = 1;
			}
		}
		model.addAttribute("actFarmer", actFarmerService);
		actFarmerService.setMaintainPageNo(maintainPageNo);
		actFarmerService.setRecordsPerPage(RECORDS_PER_PAGE);
		model.addAttribute("totalPages", actFarmerService.getTotalPages(sellerId));
		Collection<ActFarmer> collFarmer = actFarmerService.getPageActFarmers(sellerId);
		model.addAttribute("MaintainPageNo",maintainPageNo);
		model.addAttribute("collFarmer", collFarmer);
		return "/active/actFarmerMaintain";
	}
	
	
	
	//申請活動準備(建立空的物件)
	@GetMapping(path = "/actFarmerPreInsert.do")
	public String actFarmerPreInsert(Model model) {
		System.out.println("成功進入");
		ActFarmer actInsert = new ActFarmer();
		model.addAttribute("farmerinsert", actInsert);
		return "active/actFarmerApply";
	}
	
	//申請活動(新增)
	@PostMapping(value = "/actFarmerInsert.do")
	public String actFarmerInsert(
			Model model, @ModelAttribute(value="farmerinsert") ActFarmer afInsert,
			@SessionAttribute(value = "login_ok") Member_SignUp mb) {
		
		//放判斷式的錯誤訊息
		Map<String, String> errorMsgs = new HashMap<String, String>();
		//放判斷式的成功訊息
		Map<String, String> successMsgs =  new HashMap<String, String>();
		model.addAttribute("ErrMsg", errorMsgs);
		model.addAttribute("successMsg", successMsgs);

		Integer sellerId = mb.getMember_no();
		afInsert.setSellerId(sellerId);
		actFarmerService.insertActFarmer(afInsert);
		successMsgs.put("sucess", "資料新增成功");
		return "redirect:/allActFarmer.do";
		
	}
	//檢視活動準備(找到該筆物件)
	@GetMapping(path="/actFarmerPreRead.do")
	public String actFarmerPreRead(@RequestParam(value = "actId") Integer actId, Model model) {
		ActFarmer afBean = actFarmerService.getActFarmer(actId);
		System.out.println(afBean.getActImg());
		model.addAttribute("afBean", afBean);
		return "/active/actFarmerRead";
	}
	
	//返回場
	
	//修改活動準備(找到該筆物件)
	@GetMapping(value = "/actFarmerPreUpdate.do")
	public String actFarmerPreUpdate(@RequestParam(value = "actId") Integer actId, Model model) {		
	
		ActFarmer afBean = actFarmerService.getActFarmer(actId);
		model.addAttribute("afBean", afBean);
		System.out.println(afBean.getActId());
		return "/active/actFarmerUpdate";
	}
	
	//修改活動
	@PostMapping(value = "/actFarmerUpdate.do")
	public String actFarmerUpdate(@ModelAttribute(value = "afBean") ActFarmer actFarmer, Model model,
			@SessionAttribute(value = "login_ok")Member_SignUp mb		
			) {
		//放判斷式的錯誤訊息
		Map<String, String> errorMsgs = new HashMap<String, String>();
		//放判斷式的成功訊息
		Map<String, String> successMsgs =  new HashMap<String, String>();
		model.addAttribute("ErrMsg", errorMsgs);
		model.addAttribute("successMsg", successMsgs);
		Integer sellerId = mb.getMember_no();
		actFarmer.setSellerId(sellerId);
		
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
		
		return "redirect:/allActFarmer.do";
	}
	
	//刪除活動
	@PostMapping(value = "actFarmerDelete.do")
	public String actFarmerDelete(@RequestParam(value = "actId")Integer actId,Model model) {
		Integer id =Integer.valueOf(actId);
		actFarmerService.deletActFarmer(id);
		return "redirect:/allActFarmer.do";
	}

	
	//取得活動列表
	public @ResponseBody List<ActFarmer> actFarmerList(
			@SessionAttribute(value = "pageNo", required = false) Integer pageNo, Model model,
			HttpServletRequest rq){
		List<ActFarmer> list = null;
		String searchString = (String) rq.getAttribute("searchString");
		if(pageNo == null) {
			if(model.getAttribute("pageNO") != null) {
				pageNo = (Integer) model.getAttribute("pageNo");
			}else {
				pageNo = 1;
			}
		}
		list = actFarmerService.getPageActFarmers();
		rq.setAttribute("searchString", searchString);
		model.addAttribute("pageNo", pageNo);
		return list;
	}
		

	
	
//測試ajax
	@RequestMapping("/test")
	@ResponseBody
	public Clock test1(@RequestParam("param1")String s1) throws JsonProcessingException {
		System.out.println(s1);
		
		Map<String, String> map = new HashMap<>();
		map.put("actId", "1");
		map.put("actName", "2");
		map.put("actType", "3");
		
		ObjectMapper mapper = new ObjectMapper();
		String str = mapper.writeValueAsString(map);
		
		Clock clock = new Clock();
		clock.setTimeId(5566);
		clock.setTimeName("clock test中文");
		
		return clock;
	}
}
