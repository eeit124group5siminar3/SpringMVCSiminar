package tw.group5.admin_menage_members.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = "admin_login_ok")
public class Admin_ManageMembersController {
	@Autowired
	private Member_Service member_Service;
	
	@RequestMapping(path = "/goManageMembers.controller", method = RequestMethod.GET)
	public String processgoManageMember() {
		return "Admin/Admin_ManageMembers";
	}	
	
	
	@GetMapping(value = "/manageMembersData.controller/{pageNo}")
	@ResponseBody
	public Map<String, Object> processManageMembers(
			@PathVariable(name = "pageNo") String pageNo) {
		
		List<Member_SignUp> member_data = member_Service.select_member(pageNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("data", member_data);
		
		return map;
	}
	
	
	
	
	
	
	
	
	
}
