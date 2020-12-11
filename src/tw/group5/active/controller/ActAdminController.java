package tw.group5.active.controller;


import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;

import javax.sql.rowset.serial.SerialBlob;

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
import tw.group5.active.service.ActFarmerService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = {"login_ok","actFarmer"})
public class ActAdminController {
	
	@Autowired
	private ActFarmerService actFarmerService;	
	
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
		actFarmerService.deletActFarmer(id);
		return "redirect:/getAllActFarmer.do";
	}

}
