package member_SignUp;

import java.io.Serializable;
import java.sql.Date;

public class Member_Bean implements Serializable {

	private String member_no;
	private String member_email;
	private String member_password;
	private String member_name;
	private Date member_birthday;
	private String member_id;
	private String member_cellphone;
	private String member_address;
	private String member_gui_number;
	private String member_permissions;
	private String member_gg;
	private String member_lock_acc;

	public Member_Bean() {

	}

	// 登錄驗證Bean
	public Member_Bean(String member_email, String member_password) {
		this.member_email = member_email;
		this.member_password = member_password;
	}

	//登錄後資料包Bean
	public Member_Bean(String member_no, String member_email, String member_name, String member_cellphone,
			String member_address,String member_permissions) {
		this.member_no = member_no;
		this.member_email = member_email;
		this.member_name = member_name;
		this.member_cellphone = member_cellphone;
		this.member_address = member_address;
		this.member_permissions = member_permissions;
	}

	// 註冊Bean
	public Member_Bean(String member_permissions, String member_email, String member_password, String member_name,
			Date member_birthday, String member_cellphone, String member_id, String member_address,
			String member_gui_number) {

		this.member_permissions = member_permissions;
		this.member_email = member_email;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_birthday = member_birthday;
		this.member_id = member_id;
		this.member_cellphone = member_cellphone;
		this.member_address = member_address;
		this.member_gui_number = member_gui_number;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_cellphone() {
		return member_cellphone;
	}

	public void setMember_cellphone(String member_cellphone) {
		this.member_cellphone = member_cellphone;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_gui_number() {
		return member_gui_number;
	}

	public void setMember_gui_number(String member_gui_number) {
		this.member_gui_number = member_gui_number;
	}

	public String getMember_permissions() {
		return member_permissions;
	}

	public void setMember_permissions(String member_permissions) {
		this.member_permissions = member_permissions;
	}

	public String getMember_gg() {
		return member_gg;
	}

	public void setMember_gg(String member_gg) {
		this.member_gg = member_gg;
	}

	public String getMember_lock_acc() {
		return member_lock_acc;
	}

	public void setMember_lock_acc(String member_lock_acc) {
		this.member_lock_acc = member_lock_acc;
	}

}