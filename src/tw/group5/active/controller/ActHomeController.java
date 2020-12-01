package tw.group5.active.controller;


import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.active.model.ActFarmer;
import tw.group5.active.service.ActFarmerService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(value = {"pageNo", "login_ok"})
public class ActHomeController {
	
	public final int RECORDS_PER_PAGE = 5;
	
	@Autowired
	private ServletContext stx;
	
	@Autowired
	private ActFarmerService actFarmerService;

//===================================一日農夫===================================
	
	//取得活動列表	
	@GetMapping(value = "/actFarmerList.do/{pageNo}")
	@ResponseBody
	public Map<String, Object> actFarmerList(
			@PathVariable(name = "pageNo", required = false) Integer pageNo, Model model,
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
		actFarmerService.setPageNo(pageNo);
		actFarmerService.setRecordsPerPage(RECORDS_PER_PAGE);
		list = actFarmerService.getPageActFarmers();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("totalPages", actFarmerService.getTotalPages());
		map.put("pageNo", pageNo);
		
		return map;
	}
	
	
//	@RequestParam(name="searchString", required = false)String searchString,
	
//	public Map<String, Object> actFarmerListSearch(
//			@PathVariable(name = "pageNo", required = false) Integer pageNo, Model model,
//			HttpServletRequest rq){
//		List<ActFarmer> list = null;
//		String searchString = (String) rq.getAttribute("searchString");
//		if(pageNo == null) {
//			if(model.getAttribute("pageNO") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			}else {
//				pageNo = 1;
//			}
//		}
//		actFarmerService.setPageNo(pageNo);
//		actFarmerService.setRecordsPerPage(RECORDS_PER_PAGE);
//		list = actFarmerService.selectName(actName);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("data", list);
//		map.put("totalPages", actFarmerService.getTotalPages());
//		map.put("pageNo", pageNo);
//		
//		return map;
//	}
	
	//取得所有頁面數
	@GetMapping(value = "/actFarmerPage.do/{pageNo}", produces = {"text/html;charset=UTF-8" })
	@ResponseBody
	public String actPage(@PathVariable(value = "pageNo", required = false) Integer pageNo,
			Model model, HttpServletRequest rq) {
		Integer totalPages =actFarmerService.getTotalPages();
		actFarmerService.setPageNo(pageNo);
		model.addAttribute("pageNo", pageNo);
		return String.valueOf(totalPages);
	}
	
	
	//顯示單一活動的資訊
	@RequestMapping(path = "/getSingleAct.do", produces = {"text/html;charset=UTF-8" })
	public String getSingleAct(@RequestParam("id") Integer actId, Model m) {	
		ActFarmer collFarmer = actFarmerService.getActFarmer(actId);
		m.addAttribute("collFarmer", collFarmer);
		return "active/actFarmerSingle";
	} 
	
	//查詢單一活動
	
	
	
}
