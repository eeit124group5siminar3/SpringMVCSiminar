package tw.group5.member_SignUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.util.SignUp_Function;

@Controller
public class SignUpController {
	
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private SignUp_Function SignUp_Function;
	
	
	@RequestMapping(path = "/memberSignUp.controller", method = RequestMethod.GET)
	public String processmemberSignUp() {
		return "Member_SignUp/Member_SignUp";
	}
	
	
	
	
	
	
	
	
}
