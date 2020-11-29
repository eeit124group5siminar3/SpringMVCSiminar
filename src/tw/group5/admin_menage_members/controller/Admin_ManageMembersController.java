package tw.group5.admin_menage_members.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		System.out.println("會員編號是："+member_no);
		
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
		return check;	
	}
	
	//會員管理，檢視資料
	@RequestMapping(value = "/viewSelectManageMembersData.controller", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> processViewSelectManageMembers(
			@RequestParam(name = "member_no") String member_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
			Member_SignUp member_data = member_Service.select_member_no(member_no);
			
				map.put("viewdata", member_data);
				return map;
	}
	
	//會員管理，修改資料
	@RequestMapping(path = "/adminMemberUpdate.controller", method = RequestMethod.POST)
	@ResponseBody
	public String[] processadminMemberUpdate(
			@RequestParam(name = "member_no") String member_no,
			@RequestParam(name = "member_permissions", required = false) String member_permissions,
			@RequestParam(name = "member_email", required = false) String member_email,
			@RequestParam(name = "member_password", required = false) String member_password,
			@RequestParam(name = "member_name", required = false) String member_name,
			@RequestParam(name = "member_birthday", required = false) String member_birthdayString,
			@RequestParam(name = "member_cellphone", required = false) String member_cellphone,
			@RequestParam(name = "member_id", required = false) String member_idLower,
			@RequestParam(name = "member_address", required = false) String member_address,
			@RequestParam(name = "member_gui_number", required = false) String member_gui_number,
			@RequestParam(name = "e_paper", required = false) String e_paper,
			@RequestParam(name = "member_bank_code", required = false) String member_bank_code,
			@RequestParam(name = "member_bank_account", required = false) String member_bank_account,
			@RequestParam(name = "member_gg", required = false) String member_gg,
			@RequestParam(name = "member_lock_acc", required = false) String member_lock_acc, Model m) {
	

		String member_id = member_idLower.toUpperCase();
		Date member_birthday = Date.valueOf(member_birthdayString);

		boolean boolean_member_password = false ;
		boolean boolean_member_permissions = false ;
		boolean boolean_member_gg = false ;
		boolean boolean_member_lock_acc = false ;
		boolean boolean_e_paper = true ; 



		boolean sel_email = member_Service.check_signup_email(member_email);
		boolean sel_id = member_Service.check_signup_id(member_id);
		boolean check_id = signUp_Function.check_id(member_id);
		boolean check_date = signUp_Function.check_date(member_birthday);

		String[] check = new String[11];

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
		if (member_password.equals("")) {
			boolean_member_password = true;
			check[6] = "5";
		}
		if(!member_permissions.equals("0") || !member_permissions.equals("1")) {
			boolean_member_permissions = true;
			check[7] = "7";
		}
		if (!member_gg.equals("0") || !member_gg.equals("1") || !member_gg.equals("2") || !member_gg.equals("3")) {
			boolean_member_gg = true;
			check[8] = "8";
		}
		if (!member_lock_acc.equals("0") || !member_lock_acc.equals("1")) {
			boolean_member_lock_acc = true;
			check[9] = "9";
		}
		if (!e_paper.equals("0") || !e_paper.equals("1")) {
			boolean_e_paper = true;
			check[10] = "10";
		}
		
		
		

		if (sel_email && sel_id && check_id && check_date && boolean_member_password && boolean_member_permissions && boolean_member_gg && boolean_member_lock_acc && boolean_e_paper) {
			check[5] = "1";

			Member_SignUp member_data = new Member_SignUp(member_permissions, member_email, member_password, member_name,
					member_birthday, member_cellphone, member_id, member_address, member_gui_number, e_paper, member_gg,
					member_lock_acc, member_bank_code, member_bank_account);

			member_Service.insert_member_sing_up(member_data);
		}
		return check;	
	}
	
	
}
