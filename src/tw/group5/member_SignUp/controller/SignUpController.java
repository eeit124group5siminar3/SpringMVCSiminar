package tw.group5.member_SignUp.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.member_SignUp.util.SignUp_Function;

@Controller
@SessionAttributes(names = {"reg_buyer","login_ok"})
public class SignUpController {

	@Autowired
	private Member_Service member_Service;
	@Autowired
	private SignUp_Function signUp_Function;

	@RequestMapping(path = "/goMemberSignUp.controller", method = RequestMethod.GET)
	public String processgoMemberSignUp() {
		return "Member_SignUp/Member_SignUp";
	}

	@RequestMapping(path = "/memberSignUp.controller", method = RequestMethod.POST)
	public String processmemberSignUp(@RequestParam(name = "member_permissions") String member_permissions,
			@RequestParam(name = "member_email") String member_email,
			@RequestParam(name = "member_password") String member_password,
			@RequestParam(name = "member_name") String member_name,
			@RequestParam(name = "member_birthday") String member_birthdayString,
			@RequestParam(name = "member_cellphone") String member_cellphone,
			@RequestParam(name = "member_id") String member_idLower,
			@RequestParam(name = "member_address") String member_address,
			@RequestParam(name = "member_gui_number") String member_gui_number,
			@RequestParam(name = "e_paper",required=false) String e_paper,
			Model m) {

		Integer member_gg = 0;
		String  member_lock_acc = "0";
		
		System.out.println("會員"+member_permissions);
		
		if (e_paper == null) {
			e_paper = "0";
		}

		String member_id = member_idLower.toUpperCase();
		Date member_birthday = Date.valueOf(member_birthdayString);
		
		boolean sel_email = member_Service.check_signup_email(member_email);
		boolean sel_id = member_Service.check_signup_id(member_id);
		boolean check_id = signUp_Function.check_id(member_id);
		boolean check_date = signUp_Function.check_date(member_birthday);
		
		if (member_permissions.equals("0")) {
			if (sel_email) {
				if (sel_id) {
					if (check_id) {
						if (check_date) {
							if (e_paper.equals("1")) {
								// 建立Buyer_Object Bean
								Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
										member_name, member_birthday, member_cellphone, member_id, member_address,
										member_gui_number,e_paper,member_gg,member_lock_acc);
								// 建立getSession(true) 若沒有Session則會建立Session
								m.addAttribute("reg_buyer",reg_buyer);
								// 把工作交給Buyer_SignUp_Check.jsp
								return "Member_SignUp/Member_SignUp_Check0";
							}else {
								// 建立Buyer_Object Bean
								Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
										member_name, member_birthday, member_cellphone, member_id, member_address,
										member_gui_number,e_paper,member_gg,member_lock_acc);
								// 建立getSession(true) 若沒有Session則會建立Session
								m.addAttribute("reg_buyer",reg_buyer);
								// 把工作交給Buyer_SignUp_Check.jsp
								return "Member_SignUp/Member_SignUp_Check1";
							}

						} else {
							return "Member_SignUp/Member_SignUp_Alert_Birthday";
						}
					} else {
						return "Member_SignUp/Member_SignUp_Alert_Id";
					}
				} else {
					return "Member_SignUp/Member_SignUp_Alert_Id1";
				}
			} else {
				return "Member_SignUp/Member_SignUp_Alert_Email";
			}
		} else if (member_permissions.equals("1")) {
			if (sel_email) {
				if (sel_id) {
					if (check_id) {
						if (check_date) {
							if (e_paper.equals("1")) {
								// 建立Buyer_Object Bean
								Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
										member_name, member_birthday, member_cellphone, member_id, member_address,
										member_gui_number,e_paper,member_gg,member_lock_acc);
								// 建立getSession(true) 若沒有Session則會建立Session
								m.addAttribute("reg_buyer",reg_buyer);
								// 把工作交給Buyer_SignUp_Check.jsp
								return "Member_SignUp/Member_SignUp_Check2";
							}else {
								// 建立Buyer_Object Bean
								Member_SignUp reg_buyer = new Member_SignUp(member_permissions, member_email, member_password,
										member_name, member_birthday, member_cellphone, member_id, member_address,
										member_gui_number,e_paper,member_gg,member_lock_acc);
								// 建立getSession(true) 若沒有Session則會建立Session
								m.addAttribute("reg_buyer",reg_buyer);
								// 把工作交給Buyer_SignUp_Check.jsp
								return "Member_SignUp/Member_SignUp_Check3";					
							}

						} else {
							return "Member_SignUp/Member_SignUp_Alert_Birthday";	
						}
					} else {
						return "Member_SignUp/Member_SignUp_Alert_Birthday";
					}
				} else {
					return "Member_SignUp/Member_SignUp_Alert_Id1";
				}
			} else {
				return "Member_SignUp/Member_SignUp_Alert_Email";
			}
		}
		return "Member_SignUp/Member_SignUp";
	}
	
	@RequestMapping(path = "/checkMemberSignUp.controller", method = RequestMethod.POST)
	public String processcheckMemberSignUp(HttpSession session,Model m) {
		
		Member_SignUp member_data =(Member_SignUp) m.getAttribute("reg_buyer");

		member_Service.insert_member_sing_up(member_data);
		
		m.addAttribute("login_ok",member_data);
		
		session.removeAttribute("reg_buyer");
		
		return "Member_SignUp/Member_SignUp_OK";
	}

}
