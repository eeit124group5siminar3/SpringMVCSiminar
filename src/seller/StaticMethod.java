package seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StaticMethod {

//	public static List<String> getColumnNames(HttpServletRequest request, HttpServletResponse response,
//			String[] table) {
//		List<String> columnNames = new ArrayList<String>();
//		Enumeration<String> parameterNames = request.getParameterNames();
//		while (parameterNames.hasMoreElements()) {			
//			String columnName = parameterNames.nextElement();
//			if (request.getParameter(columnName) != null) {
//				for (int i = 0; i < table.length; i++) {
//					if (table[i].equals(columnName)) {
//						columnNames.add(columnName);
//					}
//				}
//			}
//		}
//		return columnNames;
//	}
//
//	public static List<String> getColumnValue(HttpServletRequest request, HttpServletResponse response,
//			List<String> columnNames) {
//		List<String> columnValue = new ArrayList<String>();
//		for (int i = 0; i < columnNames.size(); i++) {
//			columnValue.add(request.getParameter(columnNames.get(i)).trim());
//		}
//		return columnValue;
//	}
//
//	public static String getInsertSQL(String tableName, List<String> columnNames) {
//		StringBuilder insertStringBuilder = new StringBuilder("insert into ");
//		insertStringBuilder.append(tableName + " (");
//		for (int i = 0; i < columnNames.size(); i++) {
//			insertStringBuilder.append(columnNames.get(i) + ", ");
//		}
//		insertStringBuilder.delete((insertStringBuilder.length() - 2), (insertStringBuilder.length()));
//		insertStringBuilder.append(") values(");
//		for (int i = 0; i < columnNames.size(); i++) {
//			insertStringBuilder.append("?, ");
//		}
//		insertStringBuilder.delete((insertStringBuilder.length() - 2), (insertStringBuilder.length()));
//		insertStringBuilder.append(")");
//		String insertString = insertStringBuilder.toString();
//		return insertString;
//	}
//	
//	public static void insertInto(Connection connection, PreparedStatement pstmt, String insertString,
//			List<String> columnValue) throws SQLException {
//		pstmt = connection.prepareStatement(insertString);
//		for (int i = 0; i < columnValue.size(); i++) {
//			pstmt.setObject(i + 1, columnValue.get(i));
//		}
//		pstmt.executeUpdate();
//		pstmt.clearParameters();
//	}
//	
//	public static void main(String[] args) {
//		List<String> aaMap= new ArrayList<String>();
//		aaMap.add("123");
//		aaMap.add("456");
//		aaMap.add("789");
//		String aaString=insertSQL("111",aaMap);
//		System.out.println(aaString);
//	}
}