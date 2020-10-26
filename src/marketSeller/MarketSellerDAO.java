package marketSeller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import active.model.Active;
import mall.productModel.ProductBean;
import marketSeller.MarketSellerBean;


public class MarketSellerDAO {
	DataSource ds=null;
	InitialContext ctxt=null;
	Connection conn=null;
	
	//連線DB
	public MarketSellerDAO() {
		System.out.println("enter DAO");
		try {
			ctxt=new InitialContext();
			System.out.println("ctxt success");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		try {
			ds=(DataSource)ctxt.lookup("java:comp/env/jdbc/xe");
			System.out.println("ds success");

		} catch (NamingException e) {
			e.printStackTrace();
		}
//		try {
//			System.out.println(ds);
//			conn=ds.getConnection();
//			System.out.println("conn success");
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}
	//上架商品轉物件====================================================
	public List<MarketSellerBean> listMarketSellerBeans(){
		
		List<MarketSellerBean> list= new ArrayList<MarketSellerBean>();
	    DataSource ds = null;
	    InitialContext ctxt = null;
	    Connection conn = null;
		try {
			ctxt = new InitialContext();
			   ds = ( DataSource ) ctxt.lookup("java:comp/env/jdbc/xe");
			 conn=ds.getConnection();;
			Statement stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery("select t.product_id,t.product_name,t.product_area,t.price"
			+ ",n.product_id,n.product_img,n.description"
			+ " from MARKET_PRODUCT_TOTAL t,MARKET_PRODUCT_IMG n "
			+ "where t.product_id=n.product_id "
			+ " order by 1");
			
			while(rs.next()) {
			MarketSellerBean iobj =new MarketSellerBean();
			iobj.setProduct_id(rs.getString("product_id"));
			iobj.setProduct_name(rs.getString("product_name"));
			iobj.setProduct_area(rs.getString("product_area"));
			iobj.setPrice(rs.getInt("price"));
			iobj.setProduct_img(rs.getBlob("product_img"));
			iobj.setDescription(rs.getString("description"));
			
			list.add(iobj);
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
	
	//新增商品====================================================
	public int saveProduct(MarketSellerBean bean) {
		int n = 0;

		String sql1 = "INSERT INTO MARKET_PRODUCT_TOTAL "
				+ " (product_id,product_name, product_area,price) "
				+ " VALUES ((concat(\'a\',p1.nextval)), ?, ?, ?)";
		
        String sql2=  "INSERT INTO MARKET_PRODUCT_IMG "
				+ " (product_id,product_img,description) "
				+ " VALUES ((concat(\'a\',p1.currval)),?, ?)";
        InputStream blobStream = null;
		try (Connection connection = ds.getConnection(); PreparedStatement pStmt = connection.prepareStatement(sql1);) {
			pStmt.setString(1, bean.getProduct_name());
			pStmt.setString(2, bean.getProduct_area());
			pStmt.setDouble(3, bean.getPrice());
			n = pStmt.executeUpdate();
			
			
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("saveProduct()發生例外: " + ex.getMessage());
		} 
		
		try (Connection connection = ds.getConnection(); PreparedStatement pStmt = connection.prepareStatement(sql2);) {
			if (bean.getProduct_img() != null)
				blobStream = bean.getProduct_img().getBinaryStream();
			pStmt.setBlob(1, blobStream);
			pStmt.setString(2, bean.getDescription());
			 pStmt.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("saveProduct()發生例外: " + ex.getMessage());
		} finally {
			if (blobStream != null) {
				try {
					blobStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return n;
	}
	// 刪除===============
	public void delete(String product_id ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql2="DELETE FROM MARKET_PRODUCT_TOTAL where PRODUCT_ID = ?";
		String sql1="DELETE FROM MARKET_PRODUCT_IMG where PRODUCT_ID = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, product_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} 		
		catch (SQLException se) {
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
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, product_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		}
		catch (SQLException se) {
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
	//查詢上架商品資訊===============
    public MarketSellerBean selectId(String product_id ) {
    	MarketSellerBean product =null;
    	Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select t.product_id,t.product_name,t.product_area,t.price "
				+ ",n.product_id,n.product_img,n.description "
				+ " from MARKET_PRODUCT_TOTAL t JOIN MARKET_PRODUCT_IMG n "
				+ " on( t.product_id=n.product_id) "
				+ "WHERE t.product_id=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				product = new MarketSellerBean();
				product.setProduct_id(rs.getString("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_area(rs.getString("product_area"));
				product.setPrice(rs.getInt("price"));
				product.setProduct_img(rs.getBlob("product_img"));
				product.setDescription(rs.getString("description"));

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
		return product ;
    }
  //修改商品table===========================================================

  	public void update(MarketSellerBean obj) {

  		Connection con = null;
  		PreparedStatement pstmt = null;
  		String sql1="UPDATE MARKET_PRODUCT_TOTAL set product_name=?,product_area=?,price=? where product_id = ?";
  		String sql2="UPDATE MARKET_PRODUCT_IMG set description=? where product_id = ?";
  		try {

  			con = ds.getConnection();
  			pstmt = con.prepareStatement(sql1);
  			
  			pstmt.setString(1,obj.getProduct_name());
  			pstmt.setString(2,obj.getProduct_area());
  			pstmt.setInt(3,obj.getPrice());
  			pstmt.setString(4, obj.getProduct_id());
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
  		try {

  			con = ds.getConnection();
  			pstmt = con.prepareStatement(sql2);
  			pstmt.setString(1,obj.getDescription());
  			pstmt.setString(2, obj.getProduct_id());
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
  	
	public MarketSellerBean getProduct(int productId) {
		// TODO Auto-generated method stub
		return null;
	}
  	
	
}
