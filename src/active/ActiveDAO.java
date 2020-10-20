package active;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ActiveDAO {
	
	private static final String INSERT_STMT = 	
	"INSERT INTO active(act_id,act_name,act_addr,tel,exp_num, act_date,price,act_type,date_sta,date_end,act_descri,act_img,act_video) values ('A'||LPAD(TO_CHAR(ACTIVE_SEQ.NEXTVAL),3,'0'),?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = 
    "UPDATE active set act_name=?,act_addr=?,tel=?,exp_num=?,act_date=?,price=?,act_type=?,date_sta=?,date_end=?,act_descri=?,act_img=?,act_video=? where act_id = ?";
	private static final String GET_ALL_STMT = 
	"SELECT act_id,act_name,act_addr,tel,exp_num, act_date,price,act_type,date_sta,date_end,act_descri,act_img,act_video FROM active order by act_id ";
	private static final String GET_ONE_STMT = 
	"SELECT act_id,act_name,act_addr,tel,exp_num, act_date,price,act_type,date_sta,date_end,act_descri,act_img,act_video FROM active where act_id = ?";
	private static final String GET_BY_NAME = 
    "SELECT act_id,act_name,act_addr,tel,exp_num, act_date,price,act_type,date_sta,date_end,act_descri,act_img,act_video FROM active WHERE act_name =? ";
	private static final String DELETE = 
	"DELETE FROM active where act_id = ?";
	
	private Connection conn;

	  //建構子====================================================
//	  public ActiveDAO(Connection conn) {
//			this.conn = conn;
//	  }
	
//	private DataSource dataSource;
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xe");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
//	
//	
//	public DataSource getDataSource() {
//		
//		if(dataSource == null) {
//			
//			BasicDataSource ds= new BasicDataSource();
//			ds.setDriverClassName("oracle.jdbc.OracleDriber");
//			ds.setUrl("jdbc:oracle:thin@//localhost:1521/xepdb1");
//			ds.setUsername("seminar");
//			ds.setPassword("seminar");
//			ds.setMaxTotal(50);
//			ds.setMaxIdle(50);
//			dataSource=ds;
//		}
//		return dataSource;
//	}
	
	//轉物件====================================================
	public List<Active> listActive(){
		List<Active> list = new ArrayList<Active>();
	    DataSource ds = null;
	    InitialContext ctxt = null;
	    Connection conn = null;
		try{
			   ctxt = new InitialContext();
			   ds = ( DataSource ) ctxt.lookup("java:comp/env/jdbc/xe");
			 conn=ds.getConnection();
			Statement stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from active");
		    
			while(rs.next()) {
				
				Active act = new Active();
				act.setAct_id(rs.getString("act_id"));
				act.setAct_name(rs.getString("act_name"));
				act.setAct_addr(rs.getString("act_addr"));
				act.setTel(rs.getString("tel"));
				act.setExp_num(rs.getInt("exp_num"));
				act.setAct_num(rs.getInt("act_num"));
				act.setSig_stat(rs.getString("sig_stat"));
				act.setMember_no(rs.getString("member_no"));
				act.setAct_date(rs.getDate("act_date"));
				act.setPrice(rs.getInt("price"));
				act.setAct_type(rs.getString("act_type"));
				act.setDate_sta(rs.getDate("date_sta"));
				act.setDate_end(rs.getDate("date_end"));
				act.setAct_descri(rs.getClob("act_descri"));
				act.setAct_img(rs.getBlob("act_img"));
				act.setAct_video(rs.getBlob("act_video"));
				
				list.add(act);
			}
				conn.close();
		}catch (NamingException ne) {
		      System.out.println("Naming Service Lookup Exception");  
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;		
	}
	
	
	
	//新增活動table ====================================================
	public void insertActive(Active act) {
		try{
			conn = ds.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(INSERT_STMT);
			//(act_id=?,act_name=?,act_addr=?,tel=?,exp_num=?, act_date=?,price=?,act_type=?,date_sta=?,date_end=?")		
		System.out.println("insert");
			pstmt.setString(1,act.getAct_name());	
			pstmt.setString(2,act.getAct_addr());			
			pstmt.setString(3,act.getTel());			
			pstmt.setInt(4,act.getExp_num());		
			pstmt.setDate(5,(java.sql.Date) act.getAct_date());		
			pstmt.setInt(6,act.getPrice());			
			pstmt.setString(7,act.getAct_type());			
			pstmt.setDate(8,(java.sql.Date) act.getDate_sta());			
			pstmt.setDate(9, (java.sql.Date) act.getDate_end());			
			pstmt.setClob(10, act.getAct_descri());			
			pstmt.setBlob(11, act.getAct_img());			
			pstmt.setBlob(12, act.getAct_video());			
			
			
			pstmt.executeUpdate();
			pstmt.clearParameters();
			
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("error happened");
		}
	}
	
	//修改活動table===========================================================

	public void update(Active act) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1,act.getAct_name());
			pstmt.setString(2,act.getAct_addr());
			pstmt.setString(3,act.getTel());
			pstmt.setInt(4,act.getExp_num());
			pstmt.setDate(5,(java.sql.Date) act.getAct_date());
			pstmt.setInt(6,act.getPrice());
			pstmt.setString(7,act.getAct_type());
			pstmt.setDate(8,(java.sql.Date) act.getDate_sta());
			pstmt.setDate(9, (java.sql.Date) act.getDate_end());
			pstmt.setClob(10, act.getAct_descri());
			pstmt.setBlob(11, act.getAct_img());
			pstmt.setBlob(12, act.getAct_video());			
			pstmt.setString(13, act.getAct_id());
			pstmt.executeUpdate();
			pstmt.clearParameters();
			
			
			pstmt.close();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	
	//刪除活動table====================================================
	
	public void delete(String actid) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, actid);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	//查詢全部====================================================
	public List<Active> getAll(){
		List<Active> list = new ArrayList<Active>();
		Active active = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			
				active = new Active();
				active.setAct_id(rs.getString("act_id"));
				active.setAct_name(rs.getString("act_name"));
				active.setAct_addr(rs.getString("act_addr"));
				active.setTel(rs.getString("tel"));
				active.setExp_num(rs.getInt("exp_num"));
				active.setAct_date(rs.getDate("act_date"));
				active.setPrice(rs.getInt("price"));
				active.setAct_type(rs.getString("act_type"));
				active.setDate_sta(rs.getDate("date_sta"));
				active.setDate_end(rs.getDate("date_end"));
				active.setAct_descri(rs.getClob("act_descri"));
				active.setAct_img(rs.getBlob("act_img"));
				active.setAct_video(rs.getBlob("act_video"));
				list.add(active); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	//查詢BYID====================================================
	
	public Active findByPrimaryKey(String actid) {

		Active active = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, actid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				active = new Active();
				active.setAct_id(rs.getString("act_id"));
				active.setAct_name(rs.getString("act_name"));
				active.setAct_addr(rs.getString("act_addr"));
				active.setTel(rs.getString("tel"));
				active.setExp_num(rs.getInt("exp_num"));
				active.setAct_date(rs.getDate("act_date"));
				active.setPrice(rs.getInt("price"));
				active.setAct_type(rs.getString("act_type"));
				active.setDate_sta(rs.getDate("date_sta"));
				active.setDate_end(rs.getDate("date_end"));
				active.setAct_descri(rs.getClob("act_descri"));
				active.setAct_img(rs.getBlob("act_img"));
				active.setAct_video(rs.getBlob("act_video"));

			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return active;
	}
	
	
	
	
	
	//模糊查詢BY name====================================================
	public Active findByName(String actName) {

		Active active = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_NAME);
			pstmt.setString(1, actName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
//				"SELECT act_id,act_name,act_addr,tel,exp_num, act_date,price"
//				+ ",act_type,"
//				+ "date_sta,date_end,act_descri,act_img,act_video"
//				+ " FROM active WHERE act_name like '%?%' ";				
				active = new Active();
				active.setAct_id(rs.getString("act_id"));
				active.setAct_name(rs.getString("act_name"));
				active.setAct_addr(rs.getString("act_addr"));
				active.setTel(rs.getString("tel"));
				active.setExp_num(rs.getInt("exp_num"));
				active.setAct_date(rs.getDate("act_date"));
				active.setPrice(rs.getInt("price"));
				active.setAct_type(rs.getString("act_type"));
				active.setDate_sta(rs.getDate("date_sta"));
				active.setDate_end(rs.getDate("date_end"));
//				active.setAct_descri(rs.getClob("act_descri"));
//				active.setAct_img(rs.getBlob("act_img"));
//				active.setAct_video(rs.getBlob("act_video"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return active;
	}
	
	
	
	//字串轉日期====================================================
	
		public java.sql.Date strToDate(String strDate){
			String str= strDate;
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			java.util.Date d= null;
			try {
				d= format.parse(str);
			}catch(Exception e){
				e.printStackTrace();
			}
			java.sql.Date date = new java.sql.Date (d.getTime());
			return date;
		}
	
	
}
