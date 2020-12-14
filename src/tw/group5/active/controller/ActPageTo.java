package tw.group5.active.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ActPageTo {
	
	//index頁面
	@RequestMapping(value="/index")
	public String index() {
		return "index";
	}
	
	//一日農夫活動列表
	@GetMapping(value = "/actFarmerHome")
	public String actFarmerPage() {
		return "/active/actFarmerHome";
	}
	
	//活動報名頁面
	@RequestMapping(value = "/actSignFormPage")
	public String actSignFormPage() {
		return "/active/actFarmerHome";
	}
	
	
	//去活動管理員頁面
	@RequestMapping(value = "/goActAdmin")
	public String goActAdmin() {
		return "/activeAdmin/actAdminHome";
	}
	
	
	//go管理員分析頁面
	@RequestMapping(value = "/goActAdminAnalysis")
	public String goActAdminAnalysis() {
		return "/activeAdmin/actAdminAnalysis";

	}


}
