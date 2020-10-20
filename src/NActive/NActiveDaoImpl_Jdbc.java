package NActive;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class NActiveDaoImpl_Jdbc implements Serializable, NActiveDAO{
	private static final long seialVersionUID = 1L;
	
	private String act_name = null; // 查詢單筆商品會用到此代號
	private int pageNo = 0; // 存放目前顯示之頁面的編號
	private int recordsPerPage = NGlobalService.RECORDS_PER_PAGE; // 預設值：每頁三筆
	private int totalPages = -1;
	DataSource ds = null;
	String selected="";
	
	public NActiveDaoImpl_Jdbc() {
		try {
			Context ctx =new InitialContext();
			ds = (DataSource) ctx.lookup(NGlobalService.JNDI_DB_NAME);			
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("NActiveDaoImpl_JDBC()#建構子發生例外:"
										+ex.getMessage());
		}
	
	}		
	
	//計算販售的商品總共有幾頁====================================================================================
	@Override
	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));

		return totalPages;
	}
	
	// 查詢某一頁的商品資料，執行本方法前，一定要先設定實例變數pageNo的初值
	@Override
	public List<NActiveBean> getPageActives(){
		List<NActiveBean> list = new ArrayList<NActiveBean>();
		
		String sql0= "SELECT * FROM Active ORDER BY act_id";
		String sql = sql0;
		// 由頁碼推算出該頁是由哪一筆紀錄開始(1 based)
		int startRecordNo = (pageNo - 1) * recordsPerPage + 1;
		int endRecordNo = (pageNo) * recordsPerPage;
		try (
				Connection connection = ds.getConnection(); 
				PreparedStatement ps = connection.prepareStatement(sql);
			) {
				ps.setBigDecimal(1, new BigDecimal(startRecordNo));
				ps.setBigDecimal(2, new BigDecimal(endRecordNo));
				try (
					ResultSet rs = ps.executeQuery();
				) {
					// 只要還有紀錄未取出，rs.next()會傳回true
					// 迴圈內將逐筆取出ResultSet內的紀錄
					while (rs.next()) {
						// 準備一個新的NActiveBean，將ResultSet內的一筆紀錄移植到NActiveBean內
						NActiveBean bean = new NActiveBean();    	
						bean.setAct_id(rs.getString("act_id"));
						bean.setAct_name(rs.getString("act_name"));
						bean.setAct_addr(rs.getString("act_addr"));
						bean.setTel(rs.getString("tel"));
						bean.setExp_num(rs.getInt("exp_num"));
						bean.setAct_num(rs.getInt("act_num"));
						bean.setSig_stat(rs.getString("sig_stat"));
						bean.setMember_no(rs.getString("member_no"));
						bean.setAct_date(rs.getDate("act_date"));
						bean.setPrice(rs.getInt("price"));
						bean.setAct_type(rs.getString("act_type"));
						bean.setDate_sta(rs.getDate("date_sta"));
						bean.setDate_end(rs.getDate("date_end"));
						bean.setAct_descri(rs.getClob("act_descri"));
						bean.setImg_name(rs.getString("img_name"));
						bean.setAct_img(rs.getBlob("act_img"));
						bean.setVid_name(rs.getString("Vid_name"));
						bean.setAct_video(rs.getBlob("act_video"));
						// 最後將NActiveBean物件放入大的容器內
						list.add(bean);
					}
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
				throw new RuntimeException("BookDaoImpl_Jdbc()#getPageBooks()發生例外: " 
											+ ex.getMessage());
			}
			return list;				
				
	}	
	
	//活動類型搜尋
	@Override
	public String getActTypeTag() {
		String ans = "";
		List<String> list = getActType();
		ans += "<SELECT name='act_type'";
		for(String actType:list) {
			if(actType.equals(selected)) {
				ans += "<option value='"+ actType +"'selected>"+ actType +"</option>";
			}else {
				ans += "<option value='" + actType + "'>" + actType + "</option>";
			}
		}
		ans +="</SELECT>";
		return ans;
	}
	
	//修改一筆資料=================================================================================================================
	//可更改活動名稱、地址、電話、活動人數、日期、價格、型態、開始日期、結束日期、描述、照片名稱、照片檔案、影片名稱、影片檔案 where活動ID
	@Override
	public int updateActive(NActiveBean bean, long sizeInBytes) {
		int n = 0;
		String sql = "UPDATE active set"
				+"act_name=?,act_addr=?,tel=?,exp_num=?,act_date=?,price=?,act_type=?,date_sta=?,date_end=?,"
				+"act_descri=?,img_name=?,act_img=?,vid_name=?,act_video=? where act_id = ?";
		if(sizeInBytes == -1) { //不修改照片
			n = updateActive(bean);
			return n;
		}
		InputStream blobStream1 = null;
		InputStream blobStream2 = null;
		try(
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);			
		){
			pstmt.setString(1,bean.getAct_name());
			pstmt.setString(2,bean.getAct_addr());
			pstmt.setString(3,bean.getTel());
			pstmt.setInt(4,bean.getExp_num());
			pstmt.setDate(5,(java.sql.Date) bean.getAct_date());
			pstmt.setInt(6,bean.getPrice());
			pstmt.setString(7,bean.getAct_type());
			pstmt.setDate(8,(java.sql.Date) bean.getDate_sta());
			pstmt.setDate(9, (java.sql.Date) bean.getDate_end());
			pstmt.setClob(10, bean.getAct_descri());
			pstmt.setString(11, bean.getImg_name());
			if(bean.getAct_img() != null)blobStream1 =bean.getAct_img().getBinaryStream();
			pstmt.setBlob(12, bean.getAct_img());
			pstmt.setString(13, bean.getVid_name());
			if(bean.getAct_video() != null)blobStream2 =bean.getAct_video().getBinaryStream();
			pstmt.setBlob(14, bean.getAct_video());	
			pstmt.setString(15, bean.getAct_id());
			n=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("???MemberDaoImpl_Jdbc()#updateActive(NActiveBean, long)發生例外: " 
					+ e.getMessage());
		}finally {
			if(blobStream1 !=null || blobStream2 !=null) {
				try {
					blobStream1.close();
					blobStream2.close();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		return n;	
	}
	
	// 修改一筆活動資料，不改圖片
	@Override
	public int updateActive(NActiveBean bean) {
		int n = 0;
		String sql = "UPDATE active set"
				+"act_name=?,act_addr=?,tel=?,exp_num=?,act_date=?,price=?,act_type=?,date_sta=?,date_end=?,"
				+"act_descri=? where act_id = ?";
				
		try (
				Connection connection = ds.getConnection(); 
				PreparedStatement pstmt = connection.prepareStatement(sql);
			) {
				pstmt.setString(1,bean.getAct_name());
				pstmt.setString(2,bean.getAct_addr());
				pstmt.setString(3,bean.getTel());
				pstmt.setInt(4,bean.getExp_num());
				pstmt.setDate(5,(java.sql.Date) bean.getAct_date());
				pstmt.setInt(6,bean.getPrice());
				pstmt.setString(7,bean.getAct_type());
				pstmt.setDate(8,(java.sql.Date) bean.getDate_sta());
				pstmt.setDate(9, (java.sql.Date) bean.getDate_end());
				pstmt.setClob(10, bean.getAct_descri());
				pstmt.setString(11, bean.getAct_id());

				n=pstmt.executeUpdate();			

			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("???MemberDaoImpl_Jdbc()#updateActive(NActiveBean)發生例外: " 
											+ e.getMessage());
			}
		return n;
	}

	
	//依Act_ID來刪除一筆資料=================================================================================================================
	@Override
	public int deleteActive(String act_id) {
		int n = 0;
		String sql ="DELETE FROM active where act_id = ?"; 
		
		try (
				Connection connection = ds.getConnection(); 
				PreparedStatement pStmt = connection.prepareStatement(sql);
			) {
				pStmt.setString(1, act_id);
				
				n = pStmt.executeUpdate();
			} catch (SQLException ex) {
				ex.printStackTrace();
				throw new RuntimeException("????MemberDaoImpl_Jdbc()#deleteActiv()發生例外: " 
											+ ex.getMessage());
			}
			return n;
	}
	
	
	//依新增一筆資料=======================================================================================================
	@Override
	public int insertActive(NActiveBean bean) {
		int n = 0;
		
		String sql ="INSERT INTO active"
				+ "(act_id,act_name,act_addr,tel,exp_num, act_date,price,act_type,date_sta,date_end,"
				+ "act_descri,img_name,act_img,vid_name,act_video) "
				+ "VALUES ('A'||LPAD(TO_CHAR(ACTIVE_SEQ.NEXTVAL),5,'0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
		InputStream blobStream1 = null;
		InputStream blobStream2 = null;
		try (
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);
		) {
			
			pstmt.setString(1,bean.getAct_name());
			pstmt.setString(2,bean.getAct_addr());
			pstmt.setString(3,bean.getTel());
			pstmt.setInt(4,bean.getExp_num());
			pstmt.setDate(5,(java.sql.Date) bean.getAct_date());
			pstmt.setInt(6,bean.getPrice());
			pstmt.setString(7,bean.getAct_type());
			pstmt.setDate(8,(java.sql.Date) bean.getDate_sta());
			pstmt.setDate(9, (java.sql.Date) bean.getDate_end());
			pstmt.setClob(10, bean.getAct_descri());
			pstmt.setString(11, bean.getImg_name());
			
			if(bean.getAct_img() != null)blobStream1 =bean.getAct_img().getBinaryStream();
			pstmt.setBlob(12, bean.getAct_img());
			pstmt.setString(13, bean.getVid_name());
			
			if(bean.getAct_video() != null)blobStream2 =bean.getAct_video().getBinaryStream();
			pstmt.setBlob(14, bean.getAct_video());	
			
			n=pstmt.executeUpdate();			
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("MemberDaoImpl_Jdbc()#saveBook()發生例外: " 
										+ ex.getMessage());
		}finally {
			if(blobStream1 != null || blobStream2 != null) {
				try {
					blobStream1.close();
					blobStream2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return n;
	}
	
	
	
	@Override
	public int getPageNo() {
		return pageNo;
	}

	
	@Override
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	@Override
	public void setSelected(String selected) {
		this.selected = selected;
	}
	

	@Override
	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	
	//查詢所有活動ByID==================================================================
	@Override
	public NActiveBean getActive(String act_id) {
		NActiveBean bean = null;
		String sql = "SELECT * FROM Active Where actid";
		try (
				Connection connection = ds.getConnection(); 
				PreparedStatement pstmt = connection.prepareStatement(sql);
			) {
				pstmt.setString(1, act_id);
				try (ResultSet rs = pstmt.executeQuery();) {
					if (rs.next()) {
						bean = new NActiveBean();
						bean.setAct_id(rs.getString("act_id"));
						bean.setAct_name(rs.getString("act_name"));
						bean.setAct_addr(rs.getString("act_addr"));
						bean.setTel(rs.getString("tel"));
						bean.setExp_num(rs.getInt("exp_num"));
						bean.setAct_num(rs.getInt("act_num"));
						bean.setSig_stat(rs.getString("sig_stat"));
						bean.setMember_no(rs.getString("member_no"));
						bean.setAct_date(rs.getDate("act_date"));
						bean.setPrice(rs.getInt("price"));
						bean.setAct_type(rs.getString("act_type"));
						bean.setDate_sta(rs.getDate("date_sta"));
						bean.setDate_end(rs.getDate("date_end"));
						bean.setAct_descri(rs.getClob("act_descri"));
						bean.setImg_name(rs.getString("img_name"));
						bean.setAct_img(rs.getBlob("act_img"));
						bean.setVid_name(rs.getString("Vid_name"));
						bean.setAct_video(rs.getBlob("act_video"));
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("MemberDaoImpl_Jdbc()#queryActive()發生例外: " 
											+ e.getMessage());
			}
			return bean;
		}
	

	//
	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String sql = "SELECT count(1) FROM Acitve";
		try (
			Connection connection = ds.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
		) {
			if (rs.next()) {
				count = rs.getLong(1);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			//待補
			throw new RuntimeException("????MemberDaoImpl_Jdbc()#getRecordCounts()發生例外: " 
										+ ex.getMessage());
		}
		return count;
	}
	
	
	//
	@Override
	public List<String> getActType(){
		String sql = "SELECT DISTINT Act_type FROM Active";
		List<String>list = new ArrayList<>();
		try (
				Connection connection = ds.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				){
				while(rs.next()) {
					String actType = rs.getString(1);
					if(actType != null) {
						list.add(actType);
					}
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("??MemberDaoImpl_Jdbc()#queryBook()發生例外: " 
					+ e.getMessage());
		}
		return list;
	}
	
}
