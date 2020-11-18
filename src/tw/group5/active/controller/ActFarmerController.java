package tw.group5.active.controller;

import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import sun.print.resources.serviceui;
import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActFarmerService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = {"MaintainPageNo", "login_ok"})
public class ActFarmerController {
	public final int RECORDS_PER_PAGE = 5;
	
	@Autowired
	private ActFarmerService actFarmerService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpServletResponse response;
	
	@Autowired
	ServletContext ctx;
	
	
	//廠商活動管理頁面-一日農夫
	@GetMapping(value = "maintainActFarmer")
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
		model.addAttribute("actFarmerList", collFarmer);
		return "/active/actFarmerMaintain";
	}
	
//	//申請活動準備(建立空的物件)
//	public String actFarmerPreInsert(Model model) {
//		ActFarmer actInsert = new ActFarmer();
//		actFarmerService.
// 		
//	}
	
}
