package tw.group5.member_backstage.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = { "reg_buyer", "login_ok" })
public class BackstageController {

	@Autowired
	private Member_Service member_Service;

	@RequestMapping(path = "/backstage.controller", method = RequestMethod.GET)
	public String MemberBackstage() {
		return "Member_Backstage/Member_Backstage";
	}

	@RequestMapping(path = "/memberUpdate.controller", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String MemberUpdate(Model m) {
		Member_SignUp session = (Member_SignUp) m.getAttribute("login_ok");

		String member_permissions = session.getMember_permissions();
		String member_email = session.getMember_email();
		String member_password = session.getMember_password();
		String member_id = session.getMember_id();
		String member_name = session.getMember_name();
		Date member_birthday = session.getMember_birthday();
		String member_cellphone = session.getMember_cellphone();
		String member_address = session.getMember_address();
		String member_gui_number = session.getMember_gui_number();
		String e_paper = session.getE_paper();
		
		if (member_gui_number == null) {
			member_gui_number = "";
		}
		
		Member_SignUp member_bean = new Member_SignUp(member_permissions, member_email, member_password, member_id,
				member_name, member_birthday, member_gui_number, e_paper, member_cellphone, member_address);

		m.addAttribute("reg_buyer", member_bean);
		return "/Member_Backstage/Member_Update";
	}

	// 會員修改資料
	@RequestMapping(path = "/memberBackstageUpDate.controller", method = RequestMethod.POST)
	public String MemberBackstageUpDate(@RequestParam(name = "member_permissions") String member_permissions,
			@RequestParam(name = "member_password") String member_password,
			@RequestParam(name = "member_cellphone") String member_cellphone,
			@RequestParam(name = "member_address") String member_address,
			@RequestParam(name = "e_paper", required = false) String e_paper, HttpSession httpsession,
			SessionStatus sessionStatus, Model m) {

		
		
		if (e_paper == null) {
			e_paper = "0";
		}

		Member_SignUp session = (Member_SignUp) m.getAttribute("login_ok");

		String member_email = session.getMember_email();

		member_Service.updata_member_data(member_email, member_permissions, member_password, member_cellphone,
				member_address, e_paper);
		
		httpsession.removeAttribute("reg_buyer");
		httpsession.invalidate();
		
		Member_SignUp login_bean = member_Service.login_bean(member_email);
		
		m.addAttribute("login_ok", login_bean);

		return "/Member_Backstage/Member_Update_OK";
	}

	@RequestMapping(path = "/memberEvaluation.controller", method = RequestMethod.GET)
	public String MemberEvaluation() {
		return "Member_Backstage/Member_Evaluation";
	}

//	未寫
//	@RequestMapping(path = "/memberBackstageSelectEvaluation.controller", method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
//	public String MemberBackstageSelectEvaluation() {
//		return "";
//	}

}
