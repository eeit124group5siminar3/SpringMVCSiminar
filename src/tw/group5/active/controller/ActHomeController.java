package tw.group5.active.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActFarmerService;

@Controller
@SessionAttributes(value = {"pageNo", "login_ok"})
public class ActHomeController {
	
	@Autowired
	private ServletContext stx;
	
	@Autowired
	private ActFarmerService actFarmerService;
	
	//取得活動列表	
	@GetMapping(value = "/actFarmerList.do", produces = {"application/json" })
	@ResponseBody
	public List<ActFarmer> actFarmerList(
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
	
	//分頁列表
	@GetMapping(value = "/actFarmerPageList.do/{pageNo}", produces = {"text/html;charset=UTF-8" })
	@ResponseBody
	public ArrayList<Integer> actPageList(@PathVariable(value = "pageNo", required = false) Integer pageNo,
			Model model, HttpServletRequest rq) {
		Integer starPage = 1;
//		Integer endPage = 5;
		actFarmerService.setPageNo(pageNo);
		Integer totalPages =actFarmerService.getTotalPages();
//		if(pageNo <= 3) {
//			starPage=1;
//			endPage=5;
//		}
//		if(pageNo>3) {
//			starPage = pageNo-2;
//			endPage= pageNo;
//		}
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(int i = starPage; i<=totalPages; i++) {
			list.add(i);
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", totalPages);
		return list;
	}
}
