package tw.group5.member_backstage.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = {"reg_buyer","login_ok"})
public class BackstageController {

	@RequestMapping(path = "/backstage.controller", method = RequestMethod.GET)
	public String MemberBackstage() {
		return "Member_Backstage/Member_Backstage";
	}

	@RequestMapping(path = "/memberUpdate.controller", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String MemberUpdate(Model m) {
		Member_SignUp session = (Member_SignUp) m.getAttribute("login_ok");

		String member_permissions = session.getMember_permissions();
		String member_email = session.getMember_email();
		String member_id = session.getMember_id();
		String member_name = session.getMember_name();
		Date member_birthday = session.getMember_birthday();
		String member_gui_number = session.getMember_gui_number();
		String e_paper = session.getE_paper();
		Member_SignUp member_bean = new Member_SignUp(member_permissions, member_email, member_id, member_name,
				member_birthday, member_gui_number, e_paper);
		
		m.addAttribute("reg_buyer", member_bean);
		return "/Member_Backstage/Member_Update";
	}

	@RequestMapping(path = "/memberEvaluation.controller", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String MemberEvaluation() {
		return "Member_Backstage/Member_Evaluation";
	}

	// 會員修改資料
	@RequestMapping(path = "/memberBackstageUpDate.controller", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String MemberBackstageUpDate() {

		return "";
	}

//	未寫
//	@RequestMapping(path = "/memberBackstageSelectEvaluation.controller", method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
//	public String MemberBackstageSelectEvaluation() {
//		return "";
//	}

}
