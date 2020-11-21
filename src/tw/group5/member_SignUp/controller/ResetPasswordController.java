package tw.group5.member_SignUp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.member_SignUp.util.SignUp_Function;

@Controller
@SessionAttributes(names = "reg_buyer")
public class ResetPasswordController {

	@Autowired
	private Member_Service member_Service;
	@Autowired
	private SignUp_Function SignUp_Function;

	@RequestMapping(path = "/goResetPwd.controller", method = RequestMethod.GET)
	public String processresetPwd() {
		return "Member_SignUp/Member_ResetPassword";
	}

	// 忘記密碼
	@RequestMapping(path = "/forgotResetPwd.controller", method = RequestMethod.GET)
	public String processforgotResetPassword() {
		return "Member_SignUp/Member_ForgotPassword";
	}

	// 亂數給密碼
	@RequestMapping(path = "/forgotPwd.controller", method = RequestMethod.POST)
	@ResponseBody
	public boolean processForgotPassword(@RequestParam(name = "member_email", required = false) String email,
			@RequestParam(name = "member_id", required = false) String id,
			@RequestParam(name = "member_name", required = false) String name,
			@RequestParam(name = "member_cellphone", required = false) String cellphone, Model m) {

		String resetPwd = member_Service.reset_password(email, id, name, cellphone);
		
		if (resetPwd != "NO DATA") {
			member_Service.updata_member_password(email, resetPwd);
			Member_SignUp reg_buyer = member_Service.reset_bean(email);
			m.addAttribute("reg_buyer", reg_buyer);

			return true;
		}
		return false;
	}

	@RequestMapping(value = "/resetPwd.controller", method = RequestMethod.POST)
	@ResponseBody
	public boolean processResetPassword(@RequestParam(name = "member_password") String password,
			@RequestParam(name = "member_password1") String password1, Model m, HttpSession session) {

		Member_SignUp session_bean = (Member_SignUp) m.getAttribute("reg_buyer");
		String member_email = session_bean.getMember_email();

		boolean checkPwd = SignUp_Function.check_password(password, password1);

		if (checkPwd) {
			boolean updataPwd = member_Service.updata_member_password(member_email, password1);
			if (updataPwd) {
				session.removeAttribute("reg_buyer");
				return true;
			}
		}
		return false;
	}

}
