package tw.group5.admin.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Employee")
@Component("myEmployee")
public class Employee implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String employee_no; 
	private byte[] employee_picture;
	private String employee_name;
	private String employee_account;
	private String employee_password;
	private Integer employee_id;
	private Date employee_birthday;
	private String employee_address;
	private Integer employee_cellphone;
	private String employee_education;
	private String school_department;
	private Integer department_no;
	private String department_name;
	private String job_name;
	private Integer military_discharge;
	private Date take_office_date;
	private Date leave_date;
	private Integer salary;
	private Integer insured_level;
	private Integer employee_permissions;
	
	
	
	
	@Id
	@Column(name="EMPLOYEE_NO")
	public String getEmployee_no() {
		return employee_no;
	}
	public void setEmployee_no(String employee_no) {
		this.employee_no = employee_no;
	}
	
	@Column(name="EMPLOYEE_PICTURE")
	public byte[] getEmployee_picture() {
		return employee_picture;
	}
	public void setEmployee_picture(byte[] employee_picture) {
		this.employee_picture = employee_picture;
	}
	
	@Column(name="EMPLOYEE_NAME")
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	
	@Column(name="EMPLOYEE_ACCOUNT")
	public String getEmployee_account() {
		return employee_account;
	}
	public void setEmployee_account(String employee_account) {
		this.employee_account = employee_account;
	}
	
	@Column(name="EMPLOYEE_PASSWORD")
	public String getEmployee_password() {
		return employee_password;
	}
	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}
	
	@Column(name="EMPLOYEE_ID")
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	
	@Column(name="EMPLOYEE_BIRTHDAY")
	public Date getEmployee_birthday() {
		return employee_birthday;
	}
	public void setEmployee_birthday(Date employee_birthday) {
		this.employee_birthday = employee_birthday;
	}
	
	@Column(name="EMPLOYEE_ADDRESS")
	public String getEmployee_address() {
		return employee_address;
	}
	public void setEmployee_address(String employee_address) {
		this.employee_address = employee_address;
	}
	
	@Column(name="EMPLOYEE_CELLPHONE")
	public Integer getEmployee_cellphone() {
		return employee_cellphone;
	}
	public void setEmployee_cellphone(Integer employee_cellphone) {
		this.employee_cellphone = employee_cellphone;
	}
	
	@Column(name="EMPLOYEE_EDUCATION")
	public String getEmployee_education() {
		return employee_education;
	}
	public void setEmployee_education(String employee_education) {
		this.employee_education = employee_education;
	}
	
	@Column(name="SCHOOL_DEPARTMENT")
	public String getSchool_department() {
		return school_department;
	}
	public void setSchool_department(String school_department) {
		this.school_department = school_department;
	}
	
	@Column(name="DEPARTMENT_NO")
	public Integer getDepartment_no() {
		return department_no;
	}
	public void setDepartment_no(Integer department_no) {
		this.department_no = department_no;
	}
	
	@Column(name="DEPARTMENT_NAME")
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	
	@Column(name="JOB_NAME")
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	
	@Column(name="MILITARY_DISCHARGE")
	public Integer getMilitary_discharge() {
		return military_discharge;
	}
	public void setMilitary_discharge(Integer military_discharge) {
		this.military_discharge = military_discharge;
	}
	
	@Column(name="TAKE_OFFICE_DATE")
	public Date getTake_office_date() {
		return take_office_date;
	}
	public void setTake_office_date(Date take_office_date) {
		this.take_office_date = take_office_date;
	}
	
	@Column(name="LEAVE_DATE")
	public Date getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(Date leave_date) {
		this.leave_date = leave_date;
	}
	
	@Column(name="SALARY")
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	
	@Column(name="INSURED_LEVEL")
	public Integer getInsured_level() {
		return insured_level;
	}
	public void setInsured_level(Integer insured_level) {
		this.insured_level = insured_level;
	}
	
	@Column(name="EMPLOYEE_PERMISSIONS")
	public Integer getEmployee_permissions() {
		return employee_permissions;
	}
	public void setEmployee_permissions(Integer employee_permissions) {
		this.employee_permissions = employee_permissions;
	}
		
	
	
}
