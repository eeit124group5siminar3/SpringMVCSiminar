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
		// 比對Email、ID是否重複
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_data.getMember_email());
		List<Member_SignUp> list_email = (List<Member_SignUp>) email.list();
		
		if (list_email.size() <= 0) {
			session.save(member_data);
			System.out.println("會員資料註冊成功");
			return true;
		}
		return false;
	}

	// 會員註冊，驗證EMAIL
	public boolean check_signup_email(String member_email) {
		Query query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query email = query_email.setParameter(0, member_email);
		List<String> list_email = email.list();
		//Email不重複回傳0
		System.out.println("123+++"+list_email.size());
		if (list_email.size() <= 0) {
			return true;
		}
		return false;
	}

	// 會員註冊，驗證身分證字號
	public boolean check_signup_id(String member_id) {
		Query query_id = session.createQuery("From Member_SignUp Where Member_id=?0");
		Query id = query_id.setParameter(0, member_id);
		List<Member_SignUp> list_id = (List<Member_SignUp>) id.list();
		//ID不重複回傳0
		if (list_id.size() <= 0) {
			return true;
		}
		return false;
	}

	// 會員註冊，確認生日日期
	public boolean check_date(Date member_date1) {
		java.util.Date date = new java.util.Date();

		if (member_date1.getTime() <= date.getTime()) {
			return true;
		}
		return false;
	}

	// 會員註冊，驗證身分證字號是否正確
//	public boolean check_id(String id) {
//
//		Map<String, Integer> map = new HashMap<>();
//		map.put("A", 10);
//		map.put("B", 11);
//		map.put("C", 12);
//		map.put("D", 13);
//		map.put("E", 14);
//		map.put("F", 15);
//		map.put("G", 16);
//		map.put("H", 17);
//		map.put("I", 34);
//		map.put("J", 18);
//		map.put("K", 19);
//		map.put("L", 20);
//		map.put("M", 21);
//		map.put("N", 22);
//		map.put("O", 35);
//		map.put("P", 23);
//		map.put("Q", 24);
//		map.put("R", 25);
//		map.put("S", 26);
//		map.put("T", 27);
//		map.put("U", 28);
//		map.put("V", 29);
//		map.put("W", 32);
//		map.put("X", 30);
//		map.put("Y", 31);
//		map.put("Z", 33);
//
//		String id_a = id.toUpperCase(); // 將資料轉成大寫
//		char[] id_array = id_a.toCharArray(); // 將資料丟到List
//		char id_char = id_array[0]; // 取第一個英文字母
//		String id1 = String.valueOf(id_char);
//		String check1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//		if (id.length() == 10 && check1.indexOf(id_char) != -1) {
//			try {
//				Integer.valueOf(id.substring(1, 10));
//			} catch (NumberFormatException e) {
//				return false;
//			}
//			int idx1 = Integer.valueOf(map.get(id1)); // 取英文對應MAP的值
//			int id_1 = idx1 / 10; // 取出十位數
//			int id_x1 = idx1 % 10; // 取出個位數
//			int id_2 = Integer.valueOf(id.substring(1, 2));
//			int id_3 = Integer.valueOf(id.substring(2, 3));
//			int id_4 = Integer.valueOf(id.substring(3, 4));
//			int id_5 = Integer.valueOf(id.substring(4, 5));
//			int id_6 = Integer.valueOf(id.substring(5, 6));
//			int id_7 = Integer.valueOf(id.substring(6, 7));
//			int id_8 = Integer.valueOf(id.substring(7, 8));
//			int id_9 = Integer.valueOf(id.substring(8, 9));
//			int id_10 = Integer.valueOf(id.substring(9, 10));
//
//			if (id_2 == 1 || id_2 == 2) {
//
//				int sum = ((id_1 * 1) + (id_x1 * 9) + (id_2 * 8) + (id_3 * 7) + (id_4 * 6) + (id_5 * 5) + (id_6 * 4)
//						+ (id_7 * 3) + (id_8 * 2) + (id_9 * 1));
//				int ok = 10 - (sum % 10);
//				System.out.println(id_1 + "," + id_x1 + "," + id_2 + "," + id_3 + "," + id_4 + "," + id_5 + "," + id_6
//						+ "," + id_7 + "," + id_8 + "," + id_9 + "," + id_10);
//				System.out.println(ok);
//				if (ok == id_10) {
//					return true;
//				}
//			}
//
//		}
//
//		return false;
//	}

	// 登錄驗證
//	public boolean login_check(String member_email, String member_password) {
//		this.listmember_object();
//		try {
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("select * from member_signup where member_email='" + member_email + "'");
//			while (rs.next()) {
//				String check_password = rs.getString("member_password");
//				if (member_password.equals(check_password)) {
//					return true;
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}

	// 登錄資料包Bean
//	public Member_SignUp login_bean(String email) {
//		this.listmember_object();
//		try {
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("select * from member_signup where member_email='" + email + "'");
//			while (rs.next()) {
//				String member_no = rs.getString("member_no");
//				String member_email = rs.getString("member_email");
//				rs.getString("member_password");
//				String member_name = rs.getString("member_name");
//				String member_cellphone = rs.getString("member_cellphone");
//				String member_address = rs.getString("member_address");
//				String member_permissions = rs.getString("member_permissions");
//
//				Member_SignUp bean = new Member_SignUp(member_no, member_email, member_name, member_cellphone,
//						member_address,member_permissions);
//				return bean;
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}

	// 忘記密碼
//	public String reset_password(String member_email, String member_id, String member_name, String member_cellphone) {
//		this.listmember_object();
//		try {
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("select * from member_signup where member_email='" + member_email + "'");
//			while (rs.next()) {
//				String check_id = rs.getString("member_id");
//				String check_name = rs.getString("member_name");
//				String check_cellphone = rs.getString("member_cellphone");
//				String password = rs.getNString("member_password");
//				if (member_id.equals(check_id) && member_name.equals(check_name)
//						&& member_cellphone.equals(check_cellphone)) {
//					return password;
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "NO DATA";
//	}

	// 兩次密碼確認
//	public boolean check_password(String password, String password1) {
//		if (password.equals(password1)) {
//			return true;
//		}
//		return false;
//	}

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
