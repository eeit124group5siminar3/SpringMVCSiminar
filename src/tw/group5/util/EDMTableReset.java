package tw.group5.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class EDMTableReset {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {
		try (Connection con = DriverManager.getConnection(DBService_for_Oracle.getDbUrl(),
				DBService_for_Oracle.getUser(), DBService_for_Oracle.getPassword());
				Statement stmt = con.createStatement();) {

			try {
				stmt.executeUpdate(DBService_for_Oracle.getDropProduct());
				System.out.println("Product表格刪除成功");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			try {
				stmt.executeUpdate(DBService_for_Oracle.getDropProductCategory());
				System.out.println("ProductCategory表格刪除成功");
			} catch (Exception ex) {
				System.out.println("ex=" + ex);
				ex.printStackTrace();
			}
			try {
				stmt.executeUpdate(DBService_for_Oracle.getDropOrderDetails());
				System.out.println("OrderDetails表格刪除成功");
			} catch (Exception ex) {
				System.out.println("ex=" + ex);
			}
			try {
				stmt.executeUpdate(DBService_for_Oracle.getDropOrderForm());
				System.out.println("OrderForm表格刪除成功");
			} catch (Exception ex) {
				System.out.println("OK ex=" + ex);
				ex.printStackTrace();
			}

			stmt.executeUpdate(DBService_for_Oracle.getCreateProductFavorite());
			System.out.println("ProductFavorite表格產生成功");
			stmt.executeUpdate(DBService_for_Oracle.getCreateProduct());
			System.out.println("Product表格產生成功");
			stmt.executeUpdate(DBService_for_Oracle.getCreateOrderFrom());
			System.out.println("OrderForm表格產生成功");
			stmt.executeUpdate(DBService_for_Oracle.getCreateOrderDetails());
			System.out.println("OrderDetails表格產生成功");
			

		} catch (SQLException e) {
			System.err.println("新建表格時發生SQL例外: " + e.getMessage());
			e.printStackTrace();
		}

	}


}