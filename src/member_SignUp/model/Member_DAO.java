package member_SignUp.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;

import member_SignUp.model.Member_SignUp;

public class Member_DAO implements Member_List {

	private Session session;

	// 連線DB
	public Member_DAO(Session session) {
		this.session = session;
	}

	// 會員註冊
	@Override
	public boolean insert_member_sing_up(Member_SignUp member_data) {

		// HQL語法搜尋
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_data.getMember_email());

		// 若無資料回傳null
		if (email.uniqueResult() == null) {
			Member_SignUp email_bean = (Member_SignUp) email.uniqueResult();
			session.save(member_data);
			System.out.println("會員資料註冊成功");
			return true;
		}
		return false;
	}

	// 會員註冊，驗證EMAIL
	public boolean check_signup_email(String member_email) {

		// HQL語法搜尋
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_email);

		// 若無資料回傳null
		if (email.uniqueResult() == null) {
			return true;
		}
		return false;
	}

	// 會員註冊，驗證身分證字號
	public boolean check_signup_id(String member_id) {

		// HQL語法搜尋
		Query query_id = session.createQuery("From Member_SignUp Where Member_id=?0");
		Query id = query_id.setParameter(0, member_id);

		// 若無資料回傳null
		if (id.uniqueResult() == null) {
			return true;
		}
		return false;
	}

	// 登錄驗證
	public boolean login_check(String member_email, String member_password) {

		// HQL語法搜尋
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_email);

		// 有資料就做判斷
		if (email.uniqueResult() != null) {
			Member_SignUp email_bean = (Member_SignUp) email.uniqueResult();
			String password = email_bean.getMember_password();
			if (member_password.equals(password)) {
				return true;
			}
		}
		return false;
	}

	// 登錄資料包Bean
	public Member_SignUp login_bean(String member_email) {

		// HQL語法搜尋
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_email);

		// 有資料就做判斷
		if (email.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) email.uniqueResult();
			return member_bean;
		}
		return null;
	}

	// 忘記密碼
	public String reset_password(String member_email, String member_id, String member_name, String member_cellphone) {

		// HQL語法搜尋
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_email);
		
		// 有資料就做判斷
		if (email.uniqueResult() != null) {
			//把資料包成Bean
			Member_SignUp member_bean = (Member_SignUp) email.uniqueResult();

			//從Bean取各個資料出來
			String check_id = member_bean.getMember_id();
			String check_name = member_bean.getMember_name();
			String check_cellphone = member_bean.getMember_cellphone();
			String password = member_bean.getMember_password();

			//做資料比對，正確回傳PassWord
			if (check_id.equals(member_id) && check_name.equals(member_name)
					&& check_cellphone.equals(member_cellphone)) {
				return password;
			}
		}
		return "NO DATA";
	}

	// 忘記密碼，修改密碼
//	public boolean updata_member_password(String member_data, String password) {
//
//		try {
//			String sqlString = "update member_signup set MEMBER_PASSWORD='" + password + "' where member_email='"
//					+ member_data + "'";
//
//			Statement stmt = conn.createStatement();
//			System.out.println(sqlString);
//			int updatecount = stmt.executeUpdate(sqlString);
//			stmt.close();
//			if (updatecount >= 1) {
//				return true;
//			} else {
//				return false;
//			}
//		} catch (Exception e) {
//			System.err.println("修改資料失敗，請洽承志哥:" + e);
//			return false;
//		}
//	}

}
