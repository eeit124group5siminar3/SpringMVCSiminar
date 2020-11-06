package tw.group5.member_backstage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BackstageController {
	
	@RequestMapping(path = "/backstage.controller", method = RequestMethod.GET)
	public String MemberBackstage() {
		return "Member_Backstage/Member_Backstage";
	}
	
	@RequestMapping(path = "/memberUpdate.controller", method = RequestMethod.GET)
	public String MemberMemberUpdate() {
		return "Member_Backstage/Member_Update";
	}
	
	@RequestMapping(path = "/memberEvaluation.controller", method = RequestMethod.GET)
	public String MemberMemberEvaluation() {
		return "Member_Backstage/Member_Evaluation";
	}
	
	
	
	
	
}
