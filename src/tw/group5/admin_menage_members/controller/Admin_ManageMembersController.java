package tw.group5.admin_menage_members.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.member_SignUp.util.SignUp_Function;

@Controller
@SessionAttributes(names = "admin_login_ok")
public class Admin_ManageMembersController {
	
	@Autowired
	private Member_Service member_Service;
	
	@Autowired
	private SignUp_Function signUp_Function;
	
	@RequestMapping(path = "/goManageMembers.controller", method = RequestMethod.GET)
	public String processgoManageMember() {
		return "Admin/Admin_ManageMembers";
	}	
	
	
	//進入會員管理秀資料
	@GetMapping(value = "/manageMembersData.controller/{pageNo}")
	@ResponseBody
	public Map<String, Object> processManageMembers(
			@PathVariable(name = "pageNo") String pageNo) {
		
		List<Member_SignUp> member_data = member_Service.select_member(pageNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("data", member_data);
		
		return map;
	}
	
	//會員管理，查詢資料
	@RequestMapping(value = "/selectManageMembersData.controller", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> processSelectManageMembers(
			@RequestParam(name = "select_member_no") String member_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (member_no != "") {
			
			Member_SignUp member_data = member_Service.select_member_no(member_no);
			
			if (member_data != null) {
				map.put("data", member_data);
				return map;
			}else {
				map.put("error","error");
				return map;
			}
		}
		List<Member_SignUp> member_data1 = member_Service.select_member("1");
		map.put("totaldata", member_data1);
		return map;
	}
	
	//會員管理，會員資料新增
	@RequestMapping(path = "/adminMemberSignUp.controller", method = RequestMethod.POST)
	@ResponseBody
	public String[] processadminMemberSignUp(
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
		Integer member_gg = 0;
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

			Member_SignUp member_data = new Member_SignUp(member_permissions, member_email, member_password, member_name,
					member_birthday, member_cellphone, member_id, member_address, member_gui_number, e_paper, member_gg,
					member_lock_acc, member_bank_code, member_bank_account);

			member_Service.insert_member_sing_up(member_data);
		}
		System.out.println("儲存喔");
		return check;	
	}
	
	
}
