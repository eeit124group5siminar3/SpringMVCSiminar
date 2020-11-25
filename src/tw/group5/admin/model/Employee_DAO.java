package tw.group5.admin.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("employeeDao")
public class Employee_DAO {

	private SessionFactory sessionFactory;
	
	
	// 連線DB
	@Autowired
	public Employee_DAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	// 登錄驗證
	public boolean login_check(String employee_account, String employee_password) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_account = session.createQuery("From Employee Where Employee_account=?0");
		Query<?> result = query_account.setParameter(0, employee_account);

		// 有資料就做判斷
		if (result.uniqueResult() != null) {
			Employee email_bean = (Employee) result.uniqueResult();
			String password = email_bean.getEmployee_password();
			if (employee_password.equals(password)) {
				return true;
			}
		}
		return false;
	}
	
	
	// 登錄資料包Bean
	public Employee login_bean(String employee_account) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_account = session.createQuery("From Employee Where Employee_account=?0");
		Query<?> result = query_account.setParameter(0, employee_account);

		// 有資料就做判斷
		if (result.uniqueResult() != null) {
			Employee admin_bean = (Employee) result.uniqueResult();
			return admin_bean;
		}
		return null;
	}
	
	
}
