package tw.group5.active.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ActPageTo {
	
	@GetMapping(value = "/actFarmerHome")
	public String actFarmerPage() {
		return "/active/actFarmerHome";
	}


}
