package seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionMethod {
	private static InitialContext ctxt;
	private static DataSource ds;

//連線
	public static DataSource getDataSource() {
		if (ds == null) {
			try {
				ctxt = new InitialContext();
				ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ds;
	}

//關閉連線	
	public static boolean getClose(ResultSet rs, PreparedStatement pstmt, Connection connection) {
		Boolean flag = true;
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		try {
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		try {
			if (connection != null) {
				connection.close();
				connection = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
}
