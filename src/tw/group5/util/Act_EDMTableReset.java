package tw.group5.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Act_EDMTableReset {

	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元
	
	public static void main(String args[]) {
		try (Connection con = DriverManager.getConnection(Act_DBService_for_Oracle.getDburlOracle(),
				Act_DBService_for_Oracle.getUseridOracle(), Act_DBService_for_Oracle.getPswdOracle());
				Statement stmt = con.createStatement();) {
			
			//刪除ActFarmer表格
			try {
				stmt.executeUpdate(Act_DBService_for_Oracle.getDropActfarmer());
				System.out.println("ActFarmer表格刪除成功");
			} catch (SQLException e) {
				System.out.println("ActFarmer表格刪除e=" + e);
				e.printStackTrace();
			}
			
			//刪除ActOrd表格
			try {
				stmt.executeUpdate(Act_DBService_for_Oracle.getDropActord());
				System.out.println("ActOrd表格刪除成功");
			} catch (SQLException e) {
				System.out.println("ActOrd表格刪除e=" + e);
				e.printStackTrace();
			}
			
			//新增ActFarmer表格				
			stmt.executeUpdate(Act_DBService_for_Oracle.getCreateActfarmer());
			System.out.println("ActFarmer表格新增成功");
		
			
			//新增ActOrd表格			
			stmt.executeUpdate(Act_DBService_for_Oracle.getCreateActord());
			System.out.println("ActOrd表格新增成功");
			
		} catch (SQLException e) {
			System.err.println("新建表格時發生SQL例外: " + e.getMessage());
			e.printStackTrace();
		}
	}

}
