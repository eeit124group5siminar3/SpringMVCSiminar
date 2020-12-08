package tw.group5.member_SignUp.controller;

import java.sql.Date;
import java.text.ParseException;

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
@SessionAttributes(names = { "reg_buyer", "login_ok" })
public class SignUpController {

	@Autowired
	private Member_Service member_Service;
	@Autowired
	private SignUp_Function signUp_Function;

	@RequestMapping(path = "/goMemberSignUp.controller", method = RequestMethod.GET)
	public String processgoMemberSignUp() {
		return "Member_SignUp/Member_SignUp";
	}

	@RequestMapping(path = "/goCheckMemberSignUp.controller", method = RequestMethod.GET)
	public String processgoCheckMemberSignUp() {
		return "Member_SignUp/Member_SignUp_Check";
	}

	@RequestMapping(path = "/goFbMemberSignUp.controller", method = RequestMethod.GET)
	public String processgoFbMemberSignUp() {
		return "Member_SignUp/FB_Member_SignUp";
	}
	
	@RequestMapping(path = "/goFbCheckMemberSignUp.controller", method = RequestMethod.GET)
	public String processgoFbCheckMemberSignUp() {
		return "Member_SignUp/FB_Member_SignUp_Check";
	}

	// 會員註冊
	@RequestMapping(path = "/memberSignUp.controller", method = RequestMethod.POST)
	@ResponseBody
	public String[] processmemberSignUp(
			@RequestParam(name = "member_permissions", required = false) boolean boolean_member_permissions,
			@RequestParam(name = "member_email") String member_email,
			@RequestParam(name = "member_password") String member_password,
			@RequestParam(name = "member_password1") String member_password1,
			@RequestParam(name = "member_name") String member_name,
			@RequestParam(name = "member_birthday") String member_birthdayString,
			@RequestParam(name = "member_cellphone") String member_cellphone,
			@RequestParam(name = "member_id") String member_idLower,
			@RequestParam(name = "member_address") String member_address,
			@RequestParam(name = "member_gui_number") String member_gui_number,
			@RequestParam(name = "e_paper", required = false) boolean boolean_e_paper,
			@RequestParam(name = "member_bank_code", required = false) String member_bank_code,
			@RequestParam(name = "member_bank_account", required = false) String member_bank_account, Model m) {

		String member_permissions = null;
		String e_paper = null;
		String member_gg = "0";
		String member_lock_acc = "0";

		String member_id = member_idLower.toUpperCase();
		Date member_birthday = Date.valueOf(member_birthdayString);

		if (boolean_member_permissions) {
			member_permissions = "0";
		}
		if (!boolean_member_permissions) {
			member_permissions = "1";
		}
		if (boolean_e_paper) {
			e_paper = "1";
		}
		if (!boolean_e_paper) {
			e_paper = "0";
		}

		boolean sel_email = member_Service.check_signup_email(member_email);
		boolean sel_id = member_Service.check_signup_id(member_id);
		boolean check_id = signUp_Function.check_id(member_id);
		boolean check_date = signUp_Function.check_date(member_birthday);

		String[] check = new String[7];

		if (!sel_email) {
			check[0] = "2";
		}
		if (!sel_id) {
			check[1] = "3";
		}
		if (!check_id) {
			check[2] = "12";
		}
		if (!check_date) {
			check[3] = "6";
		}
		if (!member_password.equals(member_password1)) {
			check[4] = "4";
		}
		if (member_password.equals("") || member_password1.equals("")) {
			check[6] = "5";
		}

		if (sel_email && sel_id && check_id && check_date && member_password.equals(member_password1)) {
			check[5] = "1";

			Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password, member_name,
					member_birthday, member_cellphone, member_id, member_address, member_gui_number, e_paper, member_gg,
					member_lock_acc, member_bank_code, member_bank_account);

			m.addAttribute("reg_buyer", reg_buyer);
		}
		return check;
	}

	// 會員註冊確認資料
	@RequestMapping(path = "/checkMemberSignUp.controller", method = RequestMethod.POST)
	public String processcheckMemberSignUp(HttpSession session, Model m) {

		Member_SignUp member_data = (Member_SignUp) m.getAttribute("reg_buyer");

		member_Service.insert_member_sing_up(member_data);

		m.addAttribute("login_ok", member_data);

		session.removeAttribute("reg_buyer");

		return "redirect:index.controller";
	}

	// FB登錄註冊
	@RequestMapping(path = "/fbMemberSignUp.controller", method = RequestMethod.POST)
	@ResponseBody
	public boolean processfbMemberSignUp(@RequestParam(name = "member_name") String member_name,
			@RequestParam(name = "member_email") String member_email, Model m) {
		String member_permissions = "0";
		String member_password = "";
		Date member_birthday = null;
		String member_cellphone = "";
		String member_id = "";
		String member_address = "";
		String member_gui_number = "";
		String e_paper = "";
		String member_bank_code = "";
		String member_bank_account = "";
		String member_gg = "0";
		String member_lock_acc = "0";

		Member_SignUp member_data = new Member_SignUp(member_permissions, member_email, member_password, member_name,
				member_birthday, member_cellphone, member_id, member_address, member_gui_number, e_paper, member_gg,
				member_lock_acc, member_bank_code, member_bank_account);

		member_Service.insert_member_sing_up(member_data);

		m.addAttribute("login_ok", member_data);

		return true;
	}

	// FB註冊後完整註冊資料(更新資料)
	@RequestMapping(path = "/fbMemberUpDate.controller", method = RequestMethod.POST)
	@ResponseBody
	public String[] MemberBackstageUpDate(@RequestParam(name = "member_permissions") boolean boolean_member_permissions,
			@RequestParam(name = "member_id") String member_idLower,
			@RequestParam(name = "member_password") String member_password,
			@RequestParam(name = "member_password1") String member_password1,
			@RequestParam(name = "member_birthday") String member_birthdayString,
			@RequestParam(name = "member_cellphone") String member_cellphone,
			@RequestParam(name = "member_address") String member_address,
			@RequestParam(name = "member_gui_number", required = false) String member_gui_number,
			@RequestParam(name = "e_paper", required = false) boolean boolean_e_paper,
			@RequestParam(name = "member_bank_code", required = false) String member_bank_code,
			@RequestParam(name = "member_bank_account", required = false) String member_bank_account,
			HttpSession session, Model m) {

		String member_permissions = null;
		String e_paper = null;
		String member_gg = "0";
		String member_lock_acc = "0";

		String member_id = member_idLower.toUpperCase();
		Date member_birthday = Date.valueOf(member_birthdayString);

		if (boolean_member_permissions) {
			member_permissions = "0";
		}
		if (!boolean_member_permissions) {
			member_permissions = "1";
		}
		if (boolean_e_paper) {
			e_paper = "1";
		}
		if (!boolean_e_paper) {
			e_paper = "0";
		}

		boolean sel_id = member_Service.check_signup_id(member_id);
		boolean check_id = signUp_Function.check_id(member_id);
		boolean check_date = signUp_Function.check_date(member_birthday);

		String[] check = new String[7];

		if (!sel_id) {
			check[1] = "3";
		}
		if (!check_id) {
			check[2] = "12";
		}
		if (!check_date) {
			check[3] = "6";
		}
		if (!member_password.equals(member_password1)) {
			check[4] = "4";
		}
		if (member_password.equals("") || member_password1.equals("")) {
			check[6] = "5";
		}

		if (sel_id && check_id && check_date && member_password.equals(member_password1)) {
			check[5] = "1";
			
			Member_SignUp member_data = (Member_SignUp) m.getAttribute("login_ok");
			String member_email = member_data.getMember_email();
			String member_name = member_data.getMember_name();

			Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password, member_name,
					member_birthday, member_cellphone, member_id, member_address, member_gui_number, e_paper, member_gg,
					member_lock_acc, member_bank_code, member_bank_account);

			m.addAttribute("reg_buyer", reg_buyer);
			session.removeAttribute("login_ok");
		}
		return check;
	}

	// FB會員完整註冊確認資料(更新)
	@RequestMapping(value = "/fbCheckMemberSignUp.controller", method = RequestMethod.POST)
	public String processfbCheckMemberSignUp(HttpSession session, Model m) throws ParseException {

		System.err.println("1111111111111");
		Member_SignUp member_data = (Member_SignUp) m.getAttribute("reg_buyer");
		System.err.println("2222222222");

		String member_email = member_data.getMember_email();
		String member_permissions = member_data.getMember_permissions();
		String member_password = member_data.getMember_password();
		Date member_birthday = (Date) member_data.getMember_birthday();
		String member_cellphone = member_data.getMember_cellphone();
		String member_address = member_data.getMember_address();
		String member_id = member_data.getMember_id();
		String member_gui_number = member_data.getMember_gui_number();
		String e_paper = member_data.getE_paper();
		String member_bank_code = member_data.getMember_bank_code();
		String member_bank_account = member_data.getMember_bank_account();

		String member_gg = "0";
		String member_lock_acc = "0";
		System.err.println("3333333333333");

		System.err.println(member_cellphone);


		member_Service.Fb_Updata_Member_Data(member_email, member_permissions, member_password, member_birthday,
				member_cellphone, member_id, member_address, member_gui_number, e_paper, member_gg, member_lock_acc,
				member_bank_code, member_bank_account);

		m.addAttribute("login_ok", member_data);

		session.removeAttribute("reg_buyer");

		return "redirect:index.controller";
	}

}
