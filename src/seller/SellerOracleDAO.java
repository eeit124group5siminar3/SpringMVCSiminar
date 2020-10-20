package seller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class SellerOracleDAO implements SellerDAO{
	private DataSource ds = null;
	private static final String[] SELLER_ACCOUNT = { "email,String", "sellerPassword,String" };
	private static final String[] SELLER_MEMBER = { "email,String", "gender,Integer", "birthday,Date",
			"sellerName,String", "shopName,String", "tel,String", "address,String", "taxId,Integer" };

	public SellerOracleDAO() {
		ds = ConnectionMethod.getDataSource();
	}

//賣家註冊
	public void sellerRegister(HttpServletRequest request, HttpServletResponse response) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String[]> accountColumnNames = getColumnNames(request, response, SELLER_ACCOUNT);
		List<Object> accountColumnValue = getColumnValue(request, response, accountColumnNames);
		String accountInsertString = getInsertSQL("sellerAccount", accountColumnNames);
		List<String[]> memberColumnNames = getColumnNames(request, response, SELLER_MEMBER);
		List<Object> memberColumnValue = getColumnValue(request, response, memberColumnNames);
		String memberInsertString = getInsertSQL("sellerMember", memberColumnNames);
		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			executeSQL(connection, pstmt, accountInsertString, accountColumnValue);
			executeSQL(connection, pstmt, memberInsertString, memberColumnValue);
			connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionMethod.getClose(rs, pstmt, connection);

		}
	}

//登入認證
	public boolean loginCheck(String email,String password) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement("select sellerpassword from SELLERACCOUNT where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String sellerPassword = rs.getString(1);
				if (sellerPassword.equals(password)) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionMethod.getClose(rs, pstmt, connection);
		}
		return flag;
		}
	
//確認帳號是否存在
	public boolean checkAccount(String newEmail) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement("select EMAIL from SELLERACCOUNT");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String email = rs.getString(1);
				if (email.equals(newEmail)) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionMethod.getClose(rs, pstmt, connection);
		}
		return flag;
	}

//獲得欄位名稱
	public List<String[]> getColumnNames(HttpServletRequest request, HttpServletResponse response, String[] tableName) {
		List<String[]> columnNames = new ArrayList<String[]>();
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String columnName = parameterNames.nextElement();
				if (!request.getParameter(columnName).equals("")) {
				for (int i = 0; i < tableName.length; i++) {
					String[] tableContain = tableName[i].split(",");
					if (tableContain[0].equals(columnName)) {
						String[] column = { columnName, tableContain[1] };
						columnNames.add(column);
					}
				}
			}
		}
		return columnNames;
	}

//獲得欄位的值
	public List<Object> getColumnValue(HttpServletRequest request, HttpServletResponse response,
			List<String[]> columnNames) {
		List<Object> columnValue = new ArrayList<Object>();
		for (int i = 0; i < columnNames.size(); i++) {		
			String[] column = columnNames.get(i);
			String valueString = request.getParameter(column[0]).trim();
			switch (column[1]) {
			case "Integer":
				int valueInteger = Integer.valueOf(valueString);
				columnValue.add(valueInteger);
				break;
			case "Date":
				Date valueDate = Date.valueOf(valueString);
				columnValue.add(valueDate);
				break;
			default:
				columnValue.add(valueString);
				break;
			}
		}
		return columnValue;
	}

//獲得查詢SQL碼
	public String getQueryString(String tableName,String columnName,String queryCondition) {
		StringBuilder queryStringBuilder = new StringBuilder("select ");
		String queryString=queryStringBuilder.toString();
		return queryString;
	}
	
//獲得新增SQL碼
	public String getInsertSQL(String tableName, List<String[]> columnNames) {
		StringBuilder insertStringBuilder = new StringBuilder("insert into ");
		insertStringBuilder.append(tableName + " (");
		for (int i = 0; i < columnNames.size(); i++) {
			insertStringBuilder.append((columnNames.get(i))[0]);
			insertStringBuilder.append((i == (columnNames.size() - 1)) ? ") values(" : ", ");
		}
		for (int i = 0; i < columnNames.size(); i++) {
			insertStringBuilder.append((i == (columnNames.size() - 1)) ? "?)" : "?, ");
		}
		String insertString = insertStringBuilder.toString();
		return insertString;
	}

//獲得修改SQL碼
	public String getUpdateSQL(String tableName, List<String[]> columnNames,String updateCondition) {
		StringBuilder updateStringBuilder = new StringBuilder("update ");
		updateStringBuilder.append(tableName + " set ");
		for (int i = 0; i < columnNames.size(); i++) {
			updateStringBuilder.append((columnNames.get(i))[0]);
			updateStringBuilder.append((i == (columnNames.size() - 1)) ? "=?)" : "=?, ");
		}
		updateStringBuilder.append("where ");
		updateStringBuilder.append(updateCondition);
		String updateString = updateStringBuilder.toString();
		return updateString;
	}

//獲得刪除SQL碼
	public String getDeleteSQL(String tableName) {
		StringBuilder deleteStringBuilder = new StringBuilder("delete ");
		deleteStringBuilder.append(tableName);
		String deleteString = deleteStringBuilder.toString();
		return deleteString;
	}
	public String getDeleteSQL(String tableName,String deleteCondition) {
		StringBuilder deleteStringBuilder = new StringBuilder("delete ");
		deleteStringBuilder.append(tableName);
		deleteStringBuilder.append(" where ");
		deleteStringBuilder.append(deleteCondition);
		String deleteString = deleteStringBuilder.toString();
		return deleteString;
	}

//執行SQL碼
	public void executeSQL(Connection connection, PreparedStatement pstmt, String insertString) throws SQLException {
		pstmt = connection.prepareStatement(insertString);
		pstmt.executeUpdate();
	}
	public void executeSQL(Connection connection, PreparedStatement pstmt, String insertString,
			List<Object> columnValue) throws SQLException {
		pstmt = connection.prepareStatement(insertString);
		for (int i = 0; i < columnValue.size(); i++) {
			pstmt.setObject(i + 1, columnValue.get(i));
		}
		pstmt.executeUpdate();
		pstmt.clearParameters();
	}
}
