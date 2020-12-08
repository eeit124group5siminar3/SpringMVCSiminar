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

	// 進入會員管理秀資料
	@GetMapping(value = "/manageMembersData.controller/{pageNo}")
	@ResponseBody
	public Map<String, Object> processManageMembers(@PathVariable(name = "pageNo") String pageNo) {
		
		int intNO = Integer.valueOf(pageNo);
		
		List<Member_SignUp> member_data = member_Service.select_member(pageNo);
		int total_pages = member_Service.totalPages();

		int totalPage =(int) Math.ceil(total_pages*1.0 /10);//總頁數
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", member_data);
		map.put("pageNO", intNO);
		map.put("totalPageNo",totalPage);

		return map;
	}

	// 會員管理，查詢資料
	@RequestMapping(value = "/selectManageMembersData.controller", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> processSelectManageMembers(@RequestParam(name = "select_member_no") String member_no) {

		int total_pages = member_Service.totalPages();
		int totalPage =(int) Math.ceil(total_pages*1.0 /10);//總頁數
		
		int intNO = Integer.valueOf("1");
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (member_no != "") {

			Member_SignUp member_data = member_Service.select_member_no(member_no);

			if (member_data != null) {
				map.put("data", member_data);
				return map;
			} else {
				map.put("error", "error");
				return map;
			}
		}
		List<Member_SignUp> member_data1 = member_Service.select_member("1");
		map.put("totaldata", member_data1);
		map.put("pageNO", intNO);
		map.put("totalPageNo",totalPage);
		return map;
	}

	// 會員管理，會員資料新增
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

			Member_SignUp member_data = new Member_SignUp(member_permissions, member_email, member_password,
					member_name, member_birthday, member_cellphone, member_id, member_address, member_gui_number,
					e_paper, member_gg, member_lock_acc, member_bank_code, member_bank_account);

			member_Service.insert_member_sing_up(member_data);
		}
		return check;
	}

	// 會員管理，檢視資料
	@RequestMapping(value = "/viewSelectManageMembersData.controller", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> processViewSelectManageMembers(@RequestParam(name = "member_no") String member_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		Member_SignUp member_data = member_Service.select_member_no(member_no);

		map.put("viewdata", member_data);
		return map;
	}

	// 會員管理，修改資料
	@RequestMapping(path = "/adminMemberUpdate.controller", method = RequestMethod.POST)
	@ResponseBody
	public String[] processadminMemberUpdate(@RequestParam(name = "member_no") String member_no,

			@RequestParam(name = "member_permissions1") String member_permissions1,
			@RequestParam(name = "member_email1") String member_email1,
			@RequestParam(name = "member_password1") String member_password1,
			@RequestParam(name = "member_name1") String member_name1,
			@RequestParam(name = "member_birthday1") String member_birthdayString1,
			@RequestParam(name = "member_cellphone1") String member_cellphone1,
			@RequestParam(name = "member_id1") String member_idLower1,
			@RequestParam(name = "member_address1") String member_address1,
			@RequestParam(name = "member_gui_number1") String member_gui_number1,
			@RequestParam(name = "e_paper1") String e_paper1,
			@RequestParam(name = "member_bank_code1", required = false) String member_bank_code1,
			@RequestParam(name = "member_bank_account1", required = false) String member_bank_account1,
			@RequestParam(name = "member_gg1") String member_gg1,
			@RequestParam(name = "member_lock_acc1") String member_lock_acc1,

			@RequestParam(name = "member_permissions2", required = false) String member_permissions2,
			@RequestParam(name = "member_email2", required = false) String member_email2,
			@RequestParam(name = "member_password2", required = false) String member_password2,
			@RequestParam(name = "member_name2", required = false) String member_name2,
			@RequestParam(name = "member_birthday2", required = false) String member_birthdayString2,
			@RequestParam(name = "member_cellphone2", required = false) String member_cellphone2,
			@RequestParam(name = "member_id2", required = false) String member_idLower2,
			@RequestParam(name = "member_address2", required = false) String member_address2,
			@RequestParam(name = "member_gui_number2", required = false) String member_gui_number2,
			@RequestParam(name = "e_paper2", required = false) String e_paper2,
			@RequestParam(name = "member_bank_code2", required = false) String member_bank_code2,
			@RequestParam(name = "member_bank_account2", required = false) String member_bank_account2,
			@RequestParam(name = "member_gg2", required = false) String member_gg2,
			@RequestParam(name = "member_lock_acc2", required = false) String member_lock_acc2, Model m) {

		Date member_birthday1 = Date.valueOf(member_birthdayString1);

		//預設修改資料為原始資料
		String member_permissions = member_permissions1;
		String member_email = member_email1;
		String member_password = member_password1;
		String member_name = member_name1;
		Date member_birthday = member_birthday1;
		String member_cellphone = member_cellphone1;
		String member_id = member_idLower1;
		String member_address = member_address1;
		String member_gui_number = member_gui_number1;
		String e_paper = e_paper1;
		String member_bank_code = member_bank_code1;
		String member_bank_account = member_bank_account1;
		String member_gg = member_gg1;
		String member_lock_acc = member_lock_acc1;

		//預設所有判斷Error為True(無Error)
		boolean sel_email = true;
		boolean sel_id = true;
		boolean boolean_member_password = true;
		boolean boolean_member_permissions = true;
		boolean boolean_member_gg = true;
		boolean boolean_member_lock_acc = true;
		boolean boolean_e_paper = true;

		//判斷Admin是否有輸入更改資料，有就以Admin輸入的資料為主，沒有就用原始資料
		if (member_permissions2 != "") {
			member_permissions = member_permissions2;
		}
		if (member_email2 != "") {
			sel_email = member_Service.check_signup_email(member_email2);
			member_email = member_email2;
		}
		if (member_password2 != "") {
			member_password = member_password2;
		}
		if (member_name2 != "") {
			member_name = member_name2;
		}
		if (member_birthdayString2 != "") {
			Date member_birthday2 = Date.valueOf(member_birthdayString2);
			member_birthday = member_birthday2;
		}
		if (member_cellphone2 != "") {
			member_cellphone = member_cellphone2;
		}
		if (member_idLower2 != "") {
			String member_id2 = member_idLower2.toUpperCase();
			sel_id = member_Service.check_signup_id(member_id2);
			member_id = member_idLower2.toUpperCase();
		}
		if (member_address2 != "") {
			member_address = member_address2;
		}
		if (member_gui_number2 != "") {
			member_gui_number = member_gui_number2;
		}
		if (e_paper2 != "") {
			e_paper = e_paper2;
		}
		if (member_bank_code2 != "") {
			member_bank_code = member_bank_code2;
		}
		if (member_bank_account2 != "") {
			member_bank_account = member_bank_account2;
		}
		if (member_gg2 != "") {
			member_gg = member_gg2;
		}
		if (member_lock_acc2 != "") {
			member_lock_acc = member_lock_acc2;
		}

		//判斷身分證是否正確
		boolean check_id = signUp_Function.check_id(member_id);
		//判斷生日格式是否正確
		boolean check_date = signUp_Function.check_date(member_birthday);

		String[] check = new String[10];

		//判斷Admin資料是否有誤，有就把Error放入map回傳
		if (!sel_email) {
			check[1] = "1";
		}
		if (!sel_id) {
			check[2] = "2";
		}
		if (!check_id) {
			check[3] = "3";
		}
		if (!member_password.equals("")) {
			boolean_member_password = true;
		} else {
			boolean_member_password = false;
			check[4] = "4";
		}
		if (!check_date) {
			check[5] = "5";
		}
		if (member_permissions.equals("0") || member_permissions.equals("1")) {
			boolean_member_permissions = true;
		} else {
			boolean_member_permissions = false;
			check[6] = "6";
		}
		if (member_gg.equals("0") || member_gg.equals("1") || member_gg.equals("2") || member_gg.equals("3")) {
			boolean_member_gg = true;
		} else {
			boolean_member_gg = false;
			check[7] = "7";
		}
		if (member_lock_acc.equals("0") || member_lock_acc.equals("1")) {
			boolean_member_lock_acc = true;
		} else {
			boolean_member_lock_acc = false;
			check[8] = "8";
		}
		if (e_paper.equals("0") || e_paper.equals("1")) {
			boolean_e_paper = true;
		} else {
			boolean_e_paper = false;
			check[9] = "9";
		}

		//當所有Error判斷皆為True，就執行修改，回傳map[0]=0
		if (sel_email && sel_id && check_id && check_date && boolean_member_password && boolean_member_permissions
				&& boolean_member_gg && boolean_member_lock_acc && boolean_e_paper) {
			check[0] = "0";

			member_Service.Admin_Updata_Member_Data(member_no, member_permissions, member_email, member_password,
					member_name, member_birthday, member_cellphone, member_id, member_address, member_gui_number,
					e_paper, member_bank_code, member_bank_account, member_gg, member_lock_acc);
		}
		return check;
	}
	
	//會員管理，回傳要刪除的資料內容
	@RequestMapping(value = "/viewDeleteManageMembersData.controller", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> processViewDeleteManageMembers(@RequestParam(name = "member_no") String member_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		Member_SignUp member_data = member_Service.select_member_no(member_no);
		map.put("deletedata", member_data);
		return map;
	}
	
	//會員管理，確定刪除資料
	@RequestMapping(value = "/viewDeleteManageMembersDataSure.controller", method = RequestMethod.POST)
	@ResponseBody
	public boolean processViewDeleteManageMembersSure(@RequestParam(name = "member_no") Integer member_no) {

		System.out.println("會員編號是"+member_no);
		boolean delete_member = member_Service.Admin_Delete_Member_Data(member_no);
		System.err.println(delete_member);
		if (delete_member) {
			
			return true;
		}
		return false;
	}

}
