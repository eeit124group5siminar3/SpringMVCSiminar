package mall.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;

import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.Session;
import org.hibernate.query.Query;

import javassist.Loader.Simple;
import mall.productModel.CategoryBean;
import mall.productModel.ProductBean;


public class ProductDAO implements Serializable {
	private Session session;
	private static final long serialVersionUID = 1L;
	private int productId = 0; // 查詢單筆商品會用到此代號
	private int pageNo = 0; // 存放目前顯示之頁面的編號
	public final int RECORDS_PER_PAGE = 5;
	private int recordsPerPage = RECORDS_PER_PAGE; // 預設值：每頁三筆
	private int totalPages = -1;
	private int totalPagesWithoutZero = -1;
	private String tagName = "";
	private int selected = -1;
	private int id = 0;
	DataSource ds = null;

//	private String tagName = "";
//	String selected = "";

	public ProductDAO(Session session) {
		this.session = session;
	}

	// 計算販售的商品總共有幾頁

	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));

		return totalPages;
	}

	public int getTotalPages(String producterId) {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts(producterId) / (double) recordsPerPage));

		return totalPages;
	}

	public int getTotalPagesWithoutZero() {
		// 注意下一列敘述的每一個型態轉換
		totalPagesWithoutZero = (int) (Math.ceil(getRecordCountsWithoutZero() / (double) recordsPerPage));

		return totalPagesWithoutZero;
	}

	public int getTotalPagesWithoutZero(String searchString) {
		// 注意下一列敘述的每一個型態轉換
		totalPagesWithoutZero = (int) (Math.ceil(getRecordCountsWithoutZero(searchString) / (double) recordsPerPage));

		return totalPagesWithoutZero;
	}

	// 查詢某一頁的商品(書籍)資料，執行本方法前，一定要先設定實例變數pageNo的初值

	public List<ProductBean> getPageProducts() {
//		List<ProductBean> list = new ArrayList<ProductBean>();
//
//		String sql0 = "select * from(select rownum as rn ,productId,product,producterId,price,discount,stock,content,unit,addedDate,shelfTime,Filename,CoverImage,description,category from product ORDER BY productId) WHERE rn >= ? AND rn <= ?";
//
//		String sql0 = "SELECT  * FROM (SELECT  ROW_NUMBER() OVER (ORDER BY BOOKID)"
//				+ " AS RowNum, b.BookId, b.author, b.bookNo, b.category, b.TITLE, b.PRICE, "
//				+ " b.discount, b.companyID, b.fileName, b.coverImage, bc.name "
//				+ " FROM Book b JOIN BookCompany bc ON  b.companyID = bc.id )"
//				+ " AS NewTable WHERE RowNum >= ? AND RowNum <= ?";
//		String sql1 = "SELECT b.BookId, b.author, b.bookNo, b.category, b.TITLE, "
//				+ "b.PRICE, b.discount, b.companyID, b.fileName, b.coverImage, "
//				+ "bc.name FROM Book b JOIN BookCompany bc ON  b.companyID = bc.id "
//						+ " LIMIT ?, ?";
//		String sql = sql0;
////		 由頁碼推算出該頁是由哪一筆紀錄開始(1 based)
//		int startRecordNo = (pageNo - 1) * recordsPerPage + 1;
//		int endRecordNo = (pageNo) * recordsPerPage;
////		 由頁碼推算出該頁是由哪一筆紀錄開始(0 based)
//		int startRecordNo = (pageNo - 1) * recordsPerPage;
//		int endRecordNo = recordsPerPage;
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setBigDecimal(1, new BigDecimal(startRecordNo));
//			ps.setBigDecimal(2, new BigDecimal(endRecordNo));
//			try (ResultSet rs = ps.executeQuery();) {
//				// 只要還有紀錄未取出，rs.next()會傳回true
//				// 迴圈內將逐筆取出ResultSet內的紀錄
//				while (rs.next()) {
//					// 準備一個新的BookBean，將ResultSet內的一筆紀錄移植到BookBean內
//					ProductBean bean = new ProductBean();
//					bean.setProductId(rs.getInt("productId"));
//					bean.setProduct(rs.getString("product"));
//					bean.setProducterId(rs.getString("producterId"));
//					bean.setPrice(rs.getDouble("price"));
//					bean.setDiscount(rs.getDouble("discount"));
//					bean.setStock(rs.getInt("stock"));
//					bean.setContent(rs.getInt("content"));
//					bean.setUnit(rs.getString("unit"));
//					bean.setAddedDate(rs.getDate("addedDate"));
//					bean.setShelfTime(rs.getInt("shelfTime"));
//					bean.setFileName(rs.getString("Filename"));
//					bean.setCoverImage(rs.getBlob("CoverImage"));
//					bean.setDescription(rs.getString("description"));
//					bean.setCategory(rs.getInt("category"));
//					// 最後將BookBean物件放入大的容器內
//					list.add(bean);
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getPageProducts()發生例外: " + ex.getMessage());
//		}
//		return list;
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ProductBean ORDER BY ProductId";
		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public List<ProductBean> getPageProductsWithoutZero() {
//		List<ProductBean> list = new ArrayList<ProductBean>();
//		String sql0 = "select * from(select rownum as rn ,productId,product,producterId,member_name,price,discount,stock,content,unit,addedDate,shelfTime,Filename,CoverImage,description,category from (select * from product p,member_signup m where stock != 0 and producterId=member_no ORDER BY productId)) WHERE rn >= ? AND rn <= ?";
//		String sql = sql0;
//		int startRecordNo = (pageNo - 1) * recordsPerPage + 1;

//		int endRecordNo = (pageNo) * recordsPerPage;
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setBigDecimal(1, new BigDecimal(startRecordNo));
//			ps.setBigDecimal(2, new BigDecimal(endRecordNo));
//			try (ResultSet rs = ps.executeQuery();) {
//
//				while (rs.next()) {
//					ProductBean bean = new ProductBean();
//					bean.setProductId(rs.getInt("productId"));
//					bean.setProduct(rs.getString("product"));
//					bean.setProducterId(rs.getString("producterId"));
//					bean.setPrice(rs.getDouble("price"));
//					bean.setDiscount(rs.getDouble("discount"));
//					bean.setStock(rs.getInt("stock"));
//					bean.setContent(rs.getInt("content"));
//					bean.setUnit(rs.getString("unit"));
//					bean.setAddedDate(rs.getDate("addedDate"));
//					bean.setShelfTime(rs.getInt("shelfTime"));
//					bean.setFileName(rs.getString("Filename"));
//					bean.setCoverImage(rs.getBlob("CoverImage"));
//					bean.setDescription(rs.getString("description"));
//					bean.setCategory(rs.getInt("category"));
//					bean.setProducterName(rs.getNString("member_name"));
//					list.add(bean);
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getPageProducts()發生例外: " + ex.getMessage());
//		}
		int startRecordNo = (pageNo - 1) * recordsPerPage ;
		String hql = "from ProductBean where stock != 0 ORDER BY ProductId";
		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public List<ProductBean> getPageProductsWithoutZero(String searchString) {
//		List<ProductBean> list = new ArrayList<ProductBean>();
//		String sql0 = "select * from(select rownum as rn ,productId,product,producterId,member_name,price,discount,stock,content,unit,addedDate,shelfTime,Filename,CoverImage,description,category from "
//				+ "(select * from product p,member_signup m where stock != 0 and producterId=member_no and (member_name like ? or product like ?) ORDER BY productId))"
//				+ " WHERE rn >= ? AND rn <= ?";
//		String sql = sql0;
//		int endRecordNo = (pageNo) * recordsPerPage;
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setString(1, "%"+searchString+"%");
//			ps.setString(2, "%"+searchString+"%");
//			ps.setBigDecimal(3, new BigDecimal(startRecordNo));
//			ps.setBigDecimal(4, new BigDecimal(endRecordNo));
//			try (ResultSet rs = ps.executeQuery();) {
//
//				while (rs.next()) {
//					ProductBean bean = new ProductBean();
//					bean.setProductId(rs.getInt("productId"));
//					bean.setProduct(rs.getString("product"));
//					bean.setProducterId(rs.getString("producterId"));
//					bean.setPrice(rs.getDouble("price"));
//					bean.setDiscount(rs.getDouble("discount"));
//					bean.setStock(rs.getInt("stock"));
//					bean.setContent(rs.getInt("content"));
//					bean.setUnit(rs.getString("unit"));
//					bean.setAddedDate(rs.getDate("addedDate"));
//					bean.setShelfTime(rs.getInt("shelfTime"));
//					bean.setFileName(rs.getString("Filename"));
//					bean.setCoverImage(rs.getBlob("CoverImage"));
//					bean.setDescription(rs.getString("description"));
//					bean.setCategory(rs.getInt("category"));
//					bean.setProducterName(rs.getNString("member_name"));
//					list.add(bean);
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getPageProducts()發生例外: " + ex.getMessage());
//		}
//		return list;
		String hql = "from ProductBean where stock != 0 and  product like ?0 ORDER BY productId";
		int startRecordNo = (pageNo - 1) * recordsPerPage;

		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setParameter(0, "%" + searchString + "%");
//		query.setParameter(1, "%"+searchString+"%");
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public List<ProductBean> getPageProducts(String producterId) {
//		List<ProductBean> list = new ArrayList<ProductBean>();
//		String sql0 = "select * from(select rownum as rn ,productId,product,producterId,price,discount,stock,content,unit,addedDate,shelfTime,Filename,CoverImage,description,category from (select * from product where producterId=?ORDER BY productId)) WHERE rn >= ? AND rn <= ?";
//		String sql = sql0;
//		int startRecordNo = (pageNo - 1) * recordsPerPage + 1;
//		int endRecordNo = (pageNo) * recordsPerPage;
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setNString(1, producterId);
//			ps.setBigDecimal(2, new BigDecimal(startRecordNo));
//			ps.setBigDecimal(3, new BigDecimal(endRecordNo));
//			try (ResultSet rs = ps.executeQuery();) {
//
//				while (rs.next()) {
//					ProductBean bean = new ProductBean();
//					bean.setProductId(rs.getInt("productId"));
//					bean.setProduct(rs.getString("product"));
//					bean.setProducterId(rs.getString("producterId"));
//					bean.setPrice(rs.getDouble("price"));
//					bean.setDiscount(rs.getDouble("discount"));
//					bean.setStock(rs.getInt("stock"));
//					bean.setContent(rs.getInt("content"));
//					bean.setUnit(rs.getString("unit"));
//					bean.setAddedDate(rs.getDate("addedDate"));
//					bean.setShelfTime(rs.getInt("shelfTime"));
//					bean.setFileName(rs.getString("Filename"));
//					bean.setCoverImage(rs.getBlob("CoverImage"));
//					bean.setDescription(rs.getString("description"));
//					bean.setCategory(rs.getInt("category"));
//					list.add(bean);
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getPageProducts()發生例外: " + ex.getMessage());
//		}
//		return list;
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ProductBean where stock != 0 and producterId = ?0 ORDER BY ProductId";
		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setParameter(0, producterId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public long getRecordCounts() {
//		long count = 0; // 必須使用 long 型態
//		String sql = "SELECT count(1) FROM product";
//		try (Connection connection = ds.getConnection();
//				PreparedStatement ps = connection.prepareStatement(sql);
//				ResultSet rs = ps.executeQuery();) {
//			if (rs.next()) {
//				count = rs.getLong(1);
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getRecordCounts()發生例外: " + ex.getMessage());
//		}
//		return count;
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean";

		Query<Long> query = session.createQuery(hql,java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

	public long getRecordCounts(String producterId) {
//		long count = 0; // 必須使用 long 型態
//		String sql = "SELECT count(1) FROM product where producterId=?";
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setString(1, producterId);
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				count = rs.getLong(1);
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getRecordCounts()發生例外: " + ex.getMessage());
//		}
//		return count;
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean where producterId=?0";

		Query<Long> query = session.createQuery(hql,java.lang.Long.class);
		query.setParameter(0, producterId);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

	public long getRecordCountsWithoutZero() {
//		String sql = "SELECT count(1) FROM product where stock != 0";
//		try (Connection connection = ds.getConnection();
//				PreparedStatement ps = connection.prepareStatement(sql);
//				ResultSet rs = ps.executeQuery();) {
//			if (rs.next()) {
//				count = rs.getLong(1);
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getRecordCounts()發生例外: " + ex.getMessage());
//		}
//		count=(int)objectNumber;
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean where stock != 0";

		Query<Long> query = session.createQuery(hql,java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

	public long getRecordCountsWithoutZero(String searchString) {
//		long count = 0; // 必須使用 long 型態
//		String sql = "SELECT count(1) FROM product ,member_signup where stock != 0 and member_no=producterId and  (member_name like ? or product like ?)";
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setString(1, "%"+searchString+"%");
//			ps.setString(2, "%"+searchString+"%");
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				count = rs.getLong(1);
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getRecordCounts()發生例外: " + ex.getMessage());
//		}
//		return count;
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean where stock != 0 and  product like ?0";
		Query<Long> query = session.createQuery(hql,java.lang.Long.class);
		query.setParameter(0, "%" + searchString + "%");
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

	public CategoryBean getCategoryById() {
//		CategoryBean cb = null;
//
//		String sql = "SELECT * FROM productCategory WHERE id= ?";
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setInt(1, id);
//			try (ResultSet rs = ps.executeQuery();) {
//				if (rs.next()) {
//					cb = new CategoryBean(rs.getInt(1), rs.getString(2));
//				}
//			}
//
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("CompanyDaoImpl_Jdbc()#getCompanyById()發生例外: " + ex.getMessage());
//		}
//		return cb;
		String hql = "from CategoryBean where id =?0";
		Query<CategoryBean> query = session.createQuery(hql,CategoryBean.class);
		query.setParameter(0, id);
		CategoryBean cb = query.uniqueResult();
		return cb;
	}

	public List<CategoryBean> getCategory() {
//		List<CategoryBean> list = new ArrayList<>();
//		String sql = "SELECT * FROM ProductCategory";
//		try (Connection connection = ds.getConnection();
//				PreparedStatement ps = connection.prepareStatement(sql);
//				ResultSet rs = ps.executeQuery();) {
//			while (rs.next()) {
//				CategoryBean cb = new CategoryBean(rs.getInt(1), rs.getString(2));
//				list.add(cb);
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getCategory()發生例外: " + ex.getMessage());
//		}
//
//		return list;
		String hql = "from CategoryBean";
		Query<CategoryBean> query = session.createQuery(hql,CategoryBean.class);

		List<CategoryBean> list = query.list();
		return list;
	}

	public String getSelectTag() {
		String ans = "";
		List<CategoryBean> cb = getCategory();
		ans += "<SELECT name='" + getTagName() + "'>";
		for (CategoryBean bean : cb) {
			int id = bean.getId();
			String name = bean.getName();
			if (id == selected) {
				ans += "<option value='" + id + "' selected>" + name + "</option>";
			} else {
				ans += "<option value='" + id + "'>" + name + "</option>";
			}
		}
		ans += "</SELECT>";
		return ans;
	}

//	public List<String> getCategory() {
//		String sql = "SELECT DISTINCT Category FROM product";
//		List<String> list = new ArrayList<>();
//		try (Connection connection = ds.getConnection();
//				PreparedStatement ps = connection.prepareStatement(sql);
//				ResultSet rs = ps.executeQuery();) {
//			while (rs.next()) {
//				String cate = rs.getString(1);
//				if (cate != null) {
//					list.add(cate);
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getCategory()發生例外: " + ex.getMessage());
//		}
//		return list;
//	}

//	public String getCategoryTag() {
//		String ans = "";
//		List<String> list = getCategory();
//		ans += "<SELECT name='category'>";
//		for (String cate : list) {
//			if (cate.equals(selected)) {
//				ans += "<option value='" + cate + "' selected>" + cate + "</option>";
//			} else {
//				ans += "<option value='" + cate + "'>" + cate + "</option>";
//			}
//		}
//		ans += "</SELECT>";
//		return ans;
//	}

	// 修改一筆書籍資料

	public ProductBean updateProduct(ProductBean bean, long sizeInBytes) {
//		int n = 0;
//		String sql = "UPDATE Product SET " + " product=?, price=?, category = ?, coverImage = ?, "
//				+ " fileName=?, discount=?, stock=?, content=? , unit = ? ,shelfTime=?,description=?WHERE productID = ?";
//		if (sizeInBytes == -1) { // 不修改圖片
//			n = updateProduct(bean);
//			return n;
//		}
//		InputStream blobStream = null;
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setString(1, bean.getProduct());
//			ps.setDouble(2, bean.getPrice());
//			ps.setInt(3, bean.getCategory());
//			if (bean.getCoverImage() != null)
//				blobStream = bean.getCoverImage().getBinaryStream();
//			ps.setBlob(4, blobStream);
//			ps.setString(5, bean.getFileName());
//			ps.setDouble(6, bean.getDiscount());
//			ps.setInt(7, bean.getStock());
//			ps.setInt(8, bean.getContent());
//			ps.setString(9, bean.getUnit());
//			ps.setInt(10, bean.getShelfTime());
//			ps.setString(11, bean.getDescription());
//			ps.setInt(12, bean.getProductId());
//			n = ps.executeUpdate();
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("updateProduct()發生例外: " + ex.getMessage());
//		} finally {
//			if (blobStream != null) {
//				try {
//					blobStream.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		return n;
//		if (sizeInBytes == -1) { // 不修改圖片
//			System.out.println(sizeInBytes);
//			updateProduct(bean);
//
//		}
//		Blob blob=null;
////		InputStream blobStream = null;
//			if (bean.getCoverImage() != null) {
//				try {
//					blob=new SerialBlob(bean.getCoverImage());
//				} catch (SerialException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
////				byte [] buffer=new byte[1024];
////					blobStream = bean.getCoverImage().setBinaryStream(buffer);
//				}
////			try {
////				} catch (SQLException e) {
////					// 
////					e.printStackTrace();
////				}
//		bean.setCoverImage(blob);
//		ProductBean result = session.get(ProductBean.class, bean.getProductId());
//		System.out.println(bean.getProductId());
//		if (result != null) {
//			System.out.println(result.getProductId());
//			System.out.println(bean.getProductId());
		CategoryBean categoryBean = session.get(CategoryBean.class, bean.getCategory());
//		bean.setCategoryBean(categoryBean);
			session.update(bean);
//			bean.setCategory(bean.getCategory());
//			result.
//			result=bean;
//			System.out.println(result);
//			System.out.println(bean);
//			session.update(result);
			return bean;
//		}
//		return null;
	}

	// 修改一筆書籍資料，不改圖片
//	public ProductBean updateProduct(ProductBean bean) {
//		ProductBean result = session.get(ProductBean.class, bean.getProductId());
//		if (result != null) {
////			session.update(bean);
//			result=bean;
//			return bean;
////			return result;
//		}
//		return null;
//	}
//		int n = 0;
//		String sql = "UPDATE Product SET "
//				+ " product=?,  price=?, category = ?,  stock=?, content=? , unit = ? ,shelfTime=?,description=?,discount=? WHERE productID = ?";
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.clearParameters();
//			ps.setString(1, bean.getProduct());
//			ps.setDouble(2, bean.getPrice());
//
//			ps.setInt(3, bean.getCategory());
//			ps.setInt(4, bean.getStock());
//			ps.setInt(5, bean.getContent());
//			ps.setString(6, bean.getUnit());
//			ps.setInt(7, bean.getShelfTime());
//			ps.setString(8, bean.getDescription());
//			ps.setDouble(9, bean.getDiscount());
//			ps.setInt(10, bean.getProductId());
//
//			n = ps.executeUpdate();
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("updateProduct()發生例外: " + ex.getMessage());
//		}
//		return n;
//	}

	// 依bookID來刪除單筆記錄
	public ProductBean deleteProduct(int no) {
		ProductBean result = session.get(ProductBean.class, no);
		if (result != null) {
			session.delete(result);
			return result;
		}
		return null;
//		int n = 0;
//		String sql = "DELETE FROM product WHERE productId = ?";
//
//		try (Connection connection = ds.getConnection(); PreparedStatement pStmt = connection.prepareStatement(sql);) {
//			pStmt.setInt(1, no);
//			n = pStmt.executeUpdate();
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("deleteProduct()發生例外: " + ex.getMessage());
//		}
//		return n;
	}

	// 新增一筆記錄---

	public ProductBean saveProduct(ProductBean bean) {
//		Blob blob=null;
//		System.out.println(bean.getCoverImage());
//
//			if (bean.getCoverImage() != null) {
//				try {
//					blob=new SerialBlob(bean.getCoverImage());
//				} catch (SerialException e) {
//
//					e.printStackTrace();
//				} catch (SQLException e) {
//
//					e.printStackTrace();
//				}
//				}
//			bean.setCoverImage(blob);
		ProductBean result = session.get(ProductBean.class, bean.getProductId());
		if (result == null) {
			java.util.Date now=new java.util.Date();
			Date date=new Date(now.getTime());
			bean.setAddedDate(date);
//			bean.setCategoryBean(session.get(CategoryBean.class, bean.getCategory()));
			session.save(bean);
//			bean.setCategory(bean.getCategory());
			return bean;
		}
		return null;
//		int n = 0;
//
//		String sql = "INSERT INTO product "
//				+ " (product,  producterId, price, discount, coverImage, fileName,category,stock, content , unit ,addedDate ,shelfTime,description) "
//				+ " VALUES ( ?, ?, ?,1 ,?, ?,?, ?, ?,?,sysdate,?,?)";
//
//		InputStream blobStream = null;
//		try (Connection connection = ds.getConnection(); PreparedStatement pStmt = connection.prepareStatement(sql);) {
//			pStmt.setString(1, bean.getProduct());
//			pStmt.setString(2, bean.getProducterId());
//			pStmt.setDouble(3, bean.getPrice());
//
//			if (bean.getCoverImage() != null)
//				blobStream = bean.getCoverImage().getBinaryStream();
//			pStmt.setBlob(4, blobStream);
//			pStmt.setString(5, bean.getFileName());
//			pStmt.setInt(6, bean.getCategory());
//			pStmt.setInt(7, bean.getStock());
//			pStmt.setInt(8, bean.getContent());
//			pStmt.setString(9, bean.getUnit());
//			pStmt.setInt(10, bean.getShelfTime());
//			pStmt.setString(11, bean.getDescription());
//			n = pStmt.executeUpdate();
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("saveProduct()發生例外: " + ex.getMessage());
//		} finally {
//			if (blobStream != null) {
//				try {
//					blobStream.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		return n;
	}

//	public void setSelected(String selected) {
//		this.selected = selected;
//	}
	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public ProductBean getProduct(int productId) {
//		ProductBean bean = null;
//		String sql = "SELECT * FROM product WHERE productId = ?";
//
//		try (Connection connection = ds.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setInt(1, productId);
//			try (ResultSet rs = ps.executeQuery();) {
//				if (rs.next()) {
//					bean = new ProductBean();
//					bean.setProductId(rs.getInt("productId"));
//					bean.setProduct(rs.getString("product"));
//					bean.setProducterId(rs.getString("producterId"));
//					bean.setPrice(rs.getDouble("price"));
//					bean.setDiscount(rs.getDouble("discount"));
//					bean.setStock(rs.getInt("stock"));
//					bean.setContent(rs.getInt("content"));
//					bean.setUnit(rs.getString("unit"));
//					bean.setAddedDate(rs.getDate("addedDate"));
//					bean.setShelfTime(rs.getInt("shelfTime"));
//					bean.setFileName(rs.getString("Filename"));
//					bean.setCoverImage(rs.getBlob("CoverImage"));
//					bean.setDescription(rs.getString("description"));
//					bean.setCategory(rs.getInt("category"));
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getProduct()發生例外: " + ex.getMessage());
//		}
//		return bean;
//		String hql = "FROM ProductBean WHERE productId = ?0";
//		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
//		query.setParameter(0, productId);
//		ProductBean bean = (ProductBean) query.uniqueResult();
		ProductBean bean=session.get(ProductBean.class,productId);
//		session.get(CategoryBean.class, bean.getCategory());
//		System.out.println(session.get(CategoryBean.class, bean.getCategory()));
		System.out.println(bean.getCategory());
//		bean.setCategoryBean(session.get(CategoryBean.class, bean.getCategory()));
		return bean;

	}
}
