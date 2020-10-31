package tw.group5.member_SignUp.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Member_SignUp")
public class Member_SignUp implements Serializable {
	

	private static final long serialVersionUID = 1L;
	private Integer member_no;
	private String member_email;
	private String member_password;
	private String member_name;
	private Date member_birthday;
	private String member_id;
	private String member_cellphone;
	private String member_address;
	private String member_gui_number;
	private String member_permissions;
	private Integer member_gg;
	private String member_lock_acc;
	private String e_paper;

	public Member_SignUp() {

	}

	// 登錄驗證Bean
	public Member_SignUp(String member_email, String member_password) {
		this.member_email = member_email;
		this.member_password = member_password;
	}

	//登錄後資料包Bean
	public Member_SignUp(Integer member_no, String member_email, String member_name, String member_cellphone,
			String member_address,String member_permissions) {
		this.member_no = member_no;
		this.member_email = member_email;
		this.member_name = member_name;
		this.member_cellphone = member_cellphone;
		this.member_address = member_address;
		this.member_permissions = member_permissions;
	}

	// 註冊Bean
	public Member_SignUp(String member_permissions, String member_email, String member_password, String member_name,
			Date member_birthday, String member_cellphone, String member_id, String member_address,
			String member_gui_number,String e_paper) {

		this.member_permissions = member_permissions;
		this.member_email = member_email;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_birthday = member_birthday;
		this.member_id = member_id;
		this.member_cellphone = member_cellphone;
		this.member_address = member_address;
		this.member_gui_number = member_gui_number;
		this.e_paper = e_paper;
	}

	@Id
	@Column(name="MEMBER_NO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	@Column(name="MEMBER_EMAIL")
	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	@Column(name="MEMBER_PASSWORD")
	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	@Column(name="MEMBER_NAME")
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	@Column(name="MEMBER_BIRTHDAY")
	public Date getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}

	@Column(name="MEMBER_ID")
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Column(name="MEMBER_CELLPHONE")
	public String getMember_cellphone() {
		return member_cellphone;
	}

	public void setMember_cellphone(String member_cellphone) {
		this.member_cellphone = member_cellphone;
	}

	@Column(name="MEMBER_ADDRESS")
	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	@Column(name="MEMBER_GUI_NUMBER")
	public String getMember_gui_number() {
		return member_gui_number;
	}

	public void setMember_gui_number(String member_gui_number) {
		this.member_gui_number = member_gui_number;
	}

	@Column(name="MEMBER_PERMISSIONS")
	public String getMember_permissions() {
		return member_permissions;
	}

	public void setMember_permissions(String member_permissions) {
		this.member_permissions = member_permissions;
	}

	@Column(name="MEMBER_GG")
	public Integer getMember_gg() {
		return member_gg;
	}

	public void setMember_gg(Integer member_gg) {
		this.member_gg = member_gg;
	}

	@Column(name="MEMBER_LOCK_ACC")
	public String getMember_lock_acc() {
		return member_lock_acc;
	}

	public void setMember_lock_acc(String member_lock_acc) {
		this.member_lock_acc = member_lock_acc;
	}

	@Column(name="E_PAPER")
	public String getE_paper() {
		return e_paper;
	}
	
	public void setE_paper(String e_paper) {
		this.e_paper = e_paper;
	}
}