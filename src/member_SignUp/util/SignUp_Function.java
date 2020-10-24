package member_SignUp.util;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

public class SignUp_Function {

	// 會員註冊，確認生日日期不大於今日
	public boolean check_date(Date member_date1) {
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
	
	// 忘記密碼，兩次密碼確認
	public boolean check_password(String password, String password1) {
		if (password.equals(password1)) {
			return true;
		}
		return false;
	}
	
	

}
