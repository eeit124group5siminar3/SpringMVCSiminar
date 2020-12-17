package tw.group5.mall.dao;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.mall.model.CategoryClass;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProductFavoriteBean;
import tw.group5.mall.model.ProductImageBean;

@Repository

public class ProductDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private int pageNo = 1;
	private int maintainPageNo = 0;
	private int recordsPerPage = 12;
	private int maintainPerPage = 10;
	private int totalPages = -1;
	private int totalPagesWithoutZero = -1;
	private String tagName = "";
	private int selected = -1;
	private Integer categoryId=0;
	private String searchString;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getMaintainPageNo() {
		return maintainPageNo;
	}

	public void setMaintainPageNo(int maintainPageNo) {
		this.maintainPageNo = maintainPageNo;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public int getMaintainPerPage() {
		return maintainPerPage;
	}

	public void setMaintainPerPage(int maintainPerPage) {
		this.maintainPerPage = maintainPerPage;
	}

	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));

		return totalPages;
	}

	public int getTotalPages(int producterId) {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts(producterId) / (double) maintainPerPage));
		return totalPages;
	}

	public int getTotalPagesWithoutZero() {
		// 注意下一列敘述的每一個型態轉換
		totalPagesWithoutZero = (int) (Math.ceil(getRecordCountsWithoutZero() / (double) recordsPerPage));
		return totalPagesWithoutZero;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

// 查詢一頁面的產品
	public List<ProductBean> getPageProducts() {
		Session session = sessionFactory.getCurrentSession();
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ProductBean ORDER BY ProductId";
		Query<ProductBean> query = session.createQuery(hql, ProductBean.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(recordsPerPage);
		List<ProductBean> list = query.list();
		return list;
	}

// 查詢已上架一頁面的產品
	public List<ProductBean> getPageProductsWithoutZero() {
		Session session = sessionFactory.getCurrentSession();
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ProductBean where status = 1";
		Query<ProductBean> query = null;
		if (searchString == null) {
			if (categoryId == null) {
				hql += " ORDER BY ProductId";
				query = session.createQuery(hql, ProductBean.class);
			} else {
				hql += " and category = ?0 ORDER BY ProductId";
				query = session.createQuery(hql, ProductBean.class);
				query.setParameter(0, categoryId);
			}
		} else {
			if (categoryId == null) {
				hql += " and product like ?0 ORDER BY ProductId";
				query = session.createQuery(hql, ProductBean.class);
				query.setParameter(0, "%" + searchString + "%");
			} else {
				hql += " and product like ?0 and  category = ?1 ORDER BY ProductId";
				query = session.createQuery(hql, ProductBean.class);
				query.setParameter(0, "%" + searchString + "%");
				query.setParameter(1, categoryId);
			}
		}
		query.setFirstResult(startRecordNo);
		query.setMaxResults(recordsPerPage);
		List<ProductBean> list = query.list();
		return list;
	}

//查詢某一生產者的一頁面產品
	public List<ProductBean> getPageProducts(int producterId) {
		Session session = sessionFactory.getCurrentSession();
		int startRecordNo = (maintainPageNo - 1) * maintainPerPage;
		String hql = "from ProductBean where status !=2 and producterId =?0 ORDER BY ProductId desc";
		Query<ProductBean> query = session.createQuery(hql, ProductBean.class);
		query.setParameter(0, producterId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(maintainPerPage);
		List<ProductBean> list = query.list();
		return list;
	}

// 查詢資料庫商品數
	public long getRecordCounts() {
		Session session = sessionFactory.getCurrentSession();
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

//查詢上架的商品數
	public long getRecordCountsWithoutZero() {
		Session session = sessionFactory.getCurrentSession();
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean where status = 1";
		Query<Long> query = null;
		if (searchString == null) {
			if (categoryId == null) {
				query = session.createQuery(hql, java.lang.Long.class);
			} else {
				hql += " and category = ?0";
				query = session.createQuery(hql, java.lang.Long.class);
				query.setParameter(0, categoryId);
			}
		} else {
			if (categoryId == null) {
				hql += " and product like ?0";
				query = session.createQuery(hql, java.lang.Long.class);
				query.setParameter(0, "%" + searchString + "%");
			} else {
				hql += " and product like ?0 and  category = ?1";
				query = session.createQuery(hql, java.lang.Long.class);
				query.setParameter(0, "%" + searchString + "%");
				query.setParameter(1, categoryId);
			}
		}
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

// 查詢資料庫某一生產者的商品數
	public long getRecordCounts(int producterId) {
		Session session = sessionFactory.getCurrentSession();
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductBean where status !=2 and producterId=?0";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		query.setParameter(0, producterId);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

// 獲得類別下拉式選單的JSP語法字串
	public String getSelectTag() {
		String ans = "";
//		List<CategoryBean> cb = getCategory();
		ans += "<select name='" + getTagName() + "'>";
//		for (CategoryBean bean : cb) {
		for (int i = 1; i <= (CategoryClass.CATEGORY_MAP.size() - 1); i++) {
			String name = CategoryClass.getCategory(i);
//			int id = bean.getId();
//			String name = bean.getName();
			if (i == selected) {
				ans += "<option value='" + i + "' selected>" + name + "</option>";
			} else {
				ans += "<option value='" + i + "'>" + name + "</option>";
			}
		}
		ans += "</select>";
		return ans;
	}

// 修改商品資料
	public ProductBean updateProduct(ProductBean bean) {
		Session session = sessionFactory.getCurrentSession();
		if (bean.getStock() <= 0) {
			bean.setStatus(0);
		}
		session.update(bean);
		return bean;
	}

// 刪除商品資料
	public ProductBean deleteProduct(int no) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean result = session.get(ProductBean.class, no);
		if (result != null) {
			session.delete(result);
			return result;
		}
		return null;
	}

// 新增商品資料
	public ProductBean saveProduct(ProductBean bean) {
		Session session = sessionFactory.getCurrentSession();
		java.util.Date now = new java.util.Date();
		Date date = new Date(now.getTime());
		bean.setAddedDate(date);
		if (bean.getStock()<= 0) {
			bean.setStatus(0);
		}
		session.save(bean);
		return bean;
	}

// 查詢某一商品資料
	public ProductBean getProduct(int productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean bean = session.get(ProductBean.class, productId);
		return bean;
	}

// 查詢某一商品的圖片
	public ProductImageBean getProductImage(int productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductImageBean bean = session.get(ProductImageBean.class, productId);
		return bean;
	}

// 新增願望清單
	public ProductFavoriteBean savaFavorite(ProductFavoriteBean productFavorite) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productFavorite);
		return productFavorite;
	}

// 取得單筆願望
	public ProductFavoriteBean getFavorite(Integer userId, Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProductFavoriteBean where userId = :userId and productId= :productId";
		Query<ProductFavoriteBean> query = session.createQuery(hql, ProductFavoriteBean.class);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		ProductFavoriteBean pfb = query.uniqueResult();
		return pfb;
	}

// 取得願望清單
	public List<ProductBean> getFavoriteList(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String fhql = "from ProductFavoriteBean where userId = :userId and status=1";
		Query<ProductFavoriteBean> fquery = session.createQuery(fhql, ProductFavoriteBean.class);
		fquery.setParameter("userId", userId);
		List<ProductFavoriteBean> favoriteList = fquery.list();
		List<Integer> productIdList = new ArrayList<Integer>();
		for (ProductFavoriteBean favorite : favoriteList) {
			productIdList.add(favorite.getProductId());
		}
		String hql = "from ProductBean where productId in :productIdList";
		Query<ProductBean> query = session.createQuery(hql, ProductBean.class);
		query.setParameter("productIdList", productIdList);
		List<ProductBean> list = query.list();
		return list;
	}

// 取消願望清單
	public void cancelFavorite(Integer userId, Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProductFavoriteBean where userId = :userId and productId= :productId";
		Query<ProductFavoriteBean> query = session.createQuery(hql, ProductFavoriteBean.class);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		ProductFavoriteBean pfb = query.uniqueResult();
		pfb.setStatus(0);
		session.update(pfb);
	}

// 取得上一項商品的ID
	public Integer getPreProductId(Integer productId) {
		Integer preProductId = null;
		Session session = sessionFactory.getCurrentSession();
		String sql = "select pre from (select productId ,lag(productID) over(ORDER BY productId) pre from product where status !=2";
		Query<?> query = null;
		if (searchString == null) {
			if (categoryId == null) {
				sql += ") where productId= :productId";
				query = session.createSQLQuery(sql);
			} else {
				sql += " and category = :categoryId) where productId= :productId";
				query = session.createSQLQuery(sql);
				query.setParameter("categoryId", categoryId);
			}
		} else {
			if (categoryId == null) {
				sql += " and product like :searchString) where productId= :productId";
				query = session.createSQLQuery(sql);
				query.setParameter("searchString", "%" + searchString + "%");
			} else {
				sql += " and product like :searchString and  category = :categoryId) where productId= :productId";
				query = session.createSQLQuery(sql);
				query.setParameter("searchString", "%" + searchString + "%");
				query.setParameter("categoryId", categoryId);
			}
		}
		query.setParameter("productId", productId);
		BigDecimal uniqueResult = (BigDecimal) query.uniqueResult();
		if (uniqueResult != null) {
			preProductId = uniqueResult.intValue();
		}
		return preProductId;
	}

// 取得下一項商品的ID
	public Integer getNextProductId(Integer productId) {
		Integer preProductId = null;
		Session session = sessionFactory.getCurrentSession();
		String sql = "select next from (select productId ,lead(productID) over(ORDER BY productId) next from product where status !=2";
		Query<?> query = null;
		if (searchString == null) {
			if (categoryId == null) {
				sql += ") where productId= :productId";
				query = session.createSQLQuery(sql);
			} else {
				sql += " and category = :categoryId) where productId= :productId";
				query = session.createSQLQuery(sql);
				query.setParameter("categoryId", categoryId);
			}
		} else {
			if (categoryId == null) {
				sql += " and product like :searchString) where productId= :productId";
				query = session.createSQLQuery(sql);
				query.setParameter("searchString", "%" + searchString + "%");
			} else {
				sql += " and product like :searchString and  category = :categoryId) where productId= :productId";
				query = session.createSQLQuery(sql);
				query.setParameter("searchString", "%" + searchString + "%");
				query.setParameter("categoryId", categoryId);
			}
		}
		query.setParameter("productId", productId);
		BigDecimal uniqueResult = (BigDecimal) query.uniqueResult();
		if (uniqueResult != null) {
			preProductId = uniqueResult.intValue();
		}
		return preProductId;
	}

	public List<ProductBean> getExpiredProduct() {
		Session session = sessionFactory.getCurrentSession();
		String hql="from ProductBean where status !=2 and expiredDate < sysdate";
		Query<ProductBean> query=session.createQuery(hql,ProductBean.class);
		List<ProductBean> list =query.list();
		return list;
	}

}

//依照ID查詢類別
//	public CategoryBean getCategoryById() {
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from CategoryBean where id =?0";
//		Query<CategoryBean> query = session.createQuery(hql, CategoryBean.class);
//		query.setParameter(0, categoryId);
//		CategoryBean cb = query.uniqueResult();
//		return cb;
//	}

//查詢全部類別
//	public List<CategoryBean> getCategory() {
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from CategoryBean";
//		Query<CategoryBean> query = session.createQuery(hql, CategoryBean.class);
//		List<CategoryBean> list = query.list();
//		return list;
//	}