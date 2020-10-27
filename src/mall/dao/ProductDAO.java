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
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ProductBean ORDER BY ProductId";
		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public List<ProductBean> getPageProductsWithoutZero() {
		int startRecordNo = (pageNo - 1) * recordsPerPage ;
		String hql = "from ProductBean where stock != 0 ORDER BY ProductId";
		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public List<ProductBean> getPageProductsWithoutZero(String searchString) {

		String hql = "from ProductBean where stock != 0 and  product like ?0 ORDER BY productId";
		int startRecordNo = (pageNo - 1) * recordsPerPage;

		Query<ProductBean> query = session.createQuery(hql,ProductBean.class);
		query.setParameter(0, "%" + searchString + "%");
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ProductBean> list = query.list();
		return list;
	}

	public List<ProductBean> getPageProducts(String producterId) {
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
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean";

		Query<Long> query = session.createQuery(hql,java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

	public long getRecordCounts(String producterId) {
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
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean where stock != 0";

		Query<Long> query = session.createQuery(hql,java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

	public long getRecordCountsWithoutZero(String searchString) {
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
		String hql = "from CategoryBean where id =?0";
		Query<CategoryBean> query = session.createQuery(hql,CategoryBean.class);
		query.setParameter(0, id);
		CategoryBean cb = query.uniqueResult();
		return cb;
	}

	public List<CategoryBean> getCategory() {
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



	// 修改一筆書籍資料

	public ProductBean updateProduct(ProductBean bean, long sizeInBytes) {
			session.update(bean);
			return bean;
	}

	

	// 依ProductID來刪除單筆記錄
	public ProductBean deleteProduct(int no) {
		ProductBean result = session.get(ProductBean.class, no);
		if (result != null) {
			session.delete(result);
			return result;
		}
		return null;
	}

	// 新增一筆記錄---

	public ProductBean saveProduct(ProductBean bean) {
		ProductBean result = session.get(ProductBean.class, bean.getProductId());
		if (result == null) {
			java.util.Date now=new java.util.Date();
			Date date=new Date(now.getTime());
			bean.setAddedDate(date);
			session.save(bean);
			return bean;
		}
		return null;
	}

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
		ProductBean bean=session.get(ProductBean.class,productId);
		return bean;

	}
}
