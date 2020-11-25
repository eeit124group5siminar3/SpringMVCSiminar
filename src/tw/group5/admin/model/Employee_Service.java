package tw.group5.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("employeeService")
public class Employee_Service {

	
	@Autowired
	private Employee_DAO employeeDao;
	
	
	public boolean login_check(String employee_account, String employee_password) {
		return employeeDao.login_check(employee_account, employee_password);
	}
	
	public Employee login_bean(String employee_account) {
		return employeeDao.login_bean(employee_account);
	}
	
}
