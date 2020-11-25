package tw.group5.admin_menage_members.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = "admin_login_ok")
public class Admin_ManageMembersController {

	
	@RequestMapping(path = "/goManageMembers.controller", method = RequestMethod.GET)
	public String processManageMembers() {
		return "Admin/Admin_ManageMembers";
	}
	
	
	
	
	
	
	
	
	
}
