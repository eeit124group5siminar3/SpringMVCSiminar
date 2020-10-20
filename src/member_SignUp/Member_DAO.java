package member_SignUp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.naming.java.javaURLContextFactory;

import member_SignUp.Member_Bean;
import member_SignUp.Member_List;

public class Member_DAO implements Member_List {

	private DataSource ds = null;
	private InitialContext ctxt = null;
	private Connection conn = null;
	static List<Member_Bean> list;

	// 連線DB
	public Member_DAO() {
		try {
			ctxt = new InitialContext();
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			conn = ds.getConnection();

			if (list == null) {
				listmember_object();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Seller table 轉物件
	@Override
	public List<Member_Bean> listmember_object() {
		list = new ArrayList<Member_Bean>();
		try (Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from member_signup");) {

			while (rs.next()) {
				Member_Bean dir = new Member_Bean();

				dir.setMember_no(rs.getString("member_no"));
				dir.setMember_email(rs.getString("member_email"));
				dir.setMember_password(rs.getString("member_password"));
				dir.setMember_name(rs.getString("member_name"));
				dir.setMember_birthday(rs.getDate("member_birthday"));
				dir.setMember_id(rs.getString("member_id"));
				dir.setMember_cellphone(rs.getString("member_cellphone"));
				dir.setMember_address(rs.getNString("member_address"));
				dir.setMember_gui_number(rs.getString("member_gui_number"));
				dir.setMember_permissions(rs.getString("member_permissions"));
				dir.setMember_gg(rs.getString("member_gg"));
				dir.setMember_lock_acc(rs.getString("member_lock_acc"));

				list.add(dir);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 會員註冊
	@Override
	public boolean insert_member_sing_up(Member_Bean member_data) {

		try {
			String sqlString = "insert into member_signup(member_no,member_email,member_password,member_name,member_birthday,member_id,member_cellphone,member_address,member_permissions,member_gg,member_lock_acc) values("
					+ "concat(\'a\',member_no.nextval)" + ",'" + member_data.getMember_email() + "','"
					+ member_data.getMember_password() + "','" + member_data.getMember_name() + "',to_date(\'"
					+ member_data.getMember_birthday() + "\',\'yyyy-MM-dd\'),'"
					+ member_data.getMember_id().toUpperCase() + "','" + member_data.getMember_cellphone() + "','"
					+ member_data.getMember_address() + "','" + member_data.getMember_permissions() + "','" + "0"
					+ "','" + "0" + "')";

			Statement stmt = conn.createStatement();
			System.out.println(sqlString);
			int updatecount = stmt.executeUpdate(sqlString);
			stmt.close();
			if (updatecount >= 1)
				return true;
			else
				return false;
		} catch (Exception e) {
			System.err.println("會員註冊失敗，請洽承志哥:" + e);
			return false;
		}
	}

	// 會員註冊，驗證EMAIL
	public boolean check_signup_email(String member_email) {
		List<Member_Bean> email_check = listmember_object();
		for (int i = 0; i < email_check.size(); i++) {
			Member_Bean object = email_check.get(i);
			if (object.getMember_email().equals(member_email)) {
				return false;
			}
		}
		return true;
	}

	// 會員註冊，驗證身分證字號
	public boolean check_signup_id(String member_id) {
		List<Member_Bean> id_check = listmember_object();
		for (int i = 0; i < id_check.size(); i++) {
			Member_Bean object = id_check.get(i);
			if (object.getMember_id().equals(member_id)) {
				return false;
			}
		}
		return true;
	}
	
	//會員註冊，確認生日日期
	public boolean check_date(Date member_date1) {
		java.util.Date member_date2=(java.util.Date) member_date1;
		java.util.Date date = new java.util.Date();

		if (member_date1.getTime() <= date.getTime()) {
			return true;
		}
		return false;
	}

	// 會員註冊，驗證身分證字號是否正確
	public boolean check_id(String id) {

		Map<String, Integer> map = new HashMap<>();
		map.put("A", 10);
		map.put("B", 11);
		map.put("C", 12);
		map.put("D", 13);
		map.put("E", 14);
		map.put("F", 15);
		map.put("G", 16);
		map.put("H", 17);
		map.put("I", 34);
		map.put("J", 18);
		map.put("K", 19);
		map.put("L", 20);
		map.put("M", 21);
		map.put("N", 22);
		map.put("O", 35);
		map.put("P", 23);
		map.put("Q", 24);
		map.put("R", 25);
		map.put("S", 26);
		map.put("T", 27);
		map.put("U", 28);
		map.put("V", 29);
		map.put("W", 32);
		map.put("X", 30);
		map.put("Y", 31);
		map.put("Z", 33);

		String id_a = id.toUpperCase(); // 將資料轉成大寫
		char[] id_array = id_a.toCharArray(); // 將資料丟到List
		char id_char = id_array[0]; // 取第一個英文字母
		String id1 = String.valueOf(id_char);
		String check1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		if (id.length() == 10 && check1.indexOf(id_char) != -1) {
			try {
				Integer.valueOf(id.substring(1, 10));
			} catch (NumberFormatException e) {
				return false;
			}
			int idx1 = Integer.valueOf(map.get(id1)); // 取英文對應MAP的值
			int id_1 = idx1 / 10; // 取出十位數
			int id_x1 = idx1 % 10; // 取出個位數
			int id_2 = Integer.valueOf(id.substring(1, 2));
			int id_3 = Integer.valueOf(id.substring(2, 3));
			int id_4 = Integer.valueOf(id.substring(3, 4));
			int id_5 = Integer.valueOf(id.substring(4, 5));
			int id_6 = Integer.valueOf(id.substring(5, 6));
			int id_7 = Integer.valueOf(id.substring(6, 7));
			int id_8 = Integer.valueOf(id.substring(7, 8));
			int id_9 = Integer.valueOf(id.substring(8, 9));
			int id_10 = Integer.valueOf(id.substring(9, 10));

			if (id_2 == 1 || id_2 == 2) {

				int sum = ((id_1 * 1) + (id_x1 * 9) + (id_2 * 8) + (id_3 * 7) + (id_4 * 6) + (id_5 * 5) + (id_6 * 4)
						+ (id_7 * 3) + (id_8 * 2) + (id_9 * 1));
				int ok = 10 - (sum % 10);
				System.out.println(id_1 + "," + id_x1 + "," + id_2 + "," + id_3 + "," + id_4 + "," + id_5 + "," + id_6
						+ "," + id_7 + "," + id_8 + "," + id_9 + "," + id_10);
				System.out.println(ok);
				if (ok == id_10) {
					return true;
				}
			}

		}

		return false;
	}

	// 登錄驗證，資料包Bean
	public boolean login_check(String member_email, String member_password) {
		List<Member_Bean> login_check = this.listmember_object();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member_signup where member_email='" + member_email + "'");
			while (rs.next()) {
				String check_password = rs.getString("member_password");
				if (member_password.equals(check_password)) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 登錄資料包Bean
	public Member_Bean login_bean(String email) {
		List<Member_Bean> login_check = this.listmember_object();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member_signup where member_email='" + email + "'");
			while (rs.next()) {
				String member_no = rs.getString("member_no");
				String member_email = rs.getString("member_email");
				String check_password = rs.getString("member_password");
				String member_name = rs.getString("member_name");
				String member_cellphone = rs.getString("member_cellphone");
				String member_address = rs.getString("member_address");
				String member_permissions = rs.getString("member_permissions");

				Member_Bean bean = new Member_Bean(member_no, member_email, member_name, member_cellphone,
						member_address,member_permissions);
				return bean;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 忘記密碼
	public String reset_password(String member_email, String member_id, String member_name, String member_cellphone) {
		List<Member_Bean> login_check = this.listmember_object();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member_signup where member_email='" + member_email + "'");
			while (rs.next()) {
				String check_id = rs.getString("member_id");
				String check_name = rs.getString("member_name");
				String check_cellphone = rs.getString("member_cellphone");
				String password = rs.getNString("member_password");
				if (member_id.equals(check_id) && member_name.equals(check_name)
						&& member_cellphone.equals(check_cellphone)) {
					return password;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "NO DATA";
	}

	// 兩次密碼確認
	public boolean check_password(String password, String password1) {
		if (password.equals(password1)) {
			return true;
		}
		return false;
	}

	// 忘記密碼，修改密碼
	public boolean updata_member_password(String member_data, String password) {

		try {
			String sqlString = "update member_signup set MEMBER_PASSWORD='" + password + "' where member_email='"
					+ member_data + "'";

			Statement stmt = conn.createStatement();
			System.out.println(sqlString);
			int updatecount = stmt.executeUpdate(sqlString);
			stmt.close();
			if (updatecount >= 1) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.err.println("修改資料失敗，請洽承志哥:" + e);
			return false;
		}
	}

}
