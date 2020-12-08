package tw.group5.mall.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.mall.ProductStockException;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProductOrderBean;
import tw.group5.mall.model.ProductOrderItemBean;
import tw.group5.mall.model.ProducterBean;

@Repository
//@Scope(value = "session")
public class OrderDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private String BuyerId = null;
	private int orderNo = 0;
	private int pageNo = 1;
	private int maintainPageNo = 0;
	private int maintainPerPage = 10;
	private int recordsPerPage = 5;
	private int totalPages = -1;
	private int maintainTotalPages = -1;

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

	public int getTotalPages(int buyerId) {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts(buyerId) / (double) recordsPerPage));
		return totalPages;
	}

	public int getMaintainTotalPages(int producterId) {
		// 注意下一列敘述的每一個型態轉換
		maintainTotalPages = (int) (Math.ceil(getMaintainRecordCounts(producterId) / (double) maintainPerPage));
		return maintainTotalPages;
	}

// 新增訂單
	public ProductOrderBean insertOrder(ProductOrderBean ob) {
		Session session = sessionFactory.getCurrentSession();
		session.save(ob);
		return ob;
	}

// 查詢資料庫某一消費者的訂單數
	public long getRecordCounts(int buyerId) {
		Session session = sessionFactory.getCurrentSession();
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductOrderBean where buyerId=?0";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		query.setParameter(0, buyerId);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

// 查詢某一消費者的訂單
	public List<ProductOrderBean> getMemberOrders(int BuyerId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProductOrderBean where buyerId = ?0 Order by orderDate desc ";
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		Query<ProductOrderBean> query = session.createQuery(hql, ProductOrderBean.class);
		query.setParameter(0, BuyerId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(recordsPerPage);
		List<ProductOrderBean> list = query.list();
		return list;
	}

// 查詢資料庫某一生產者的訂單數
	public long getMaintainRecordCounts(int producterId) {
		Session session = sessionFactory.getCurrentSession();
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from ProductOrderItemBean where producterId=?0";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		query.setParameter(0, producterId);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

// 查詢某一生產者的訂單
	public List<ProductOrderItemBean> getMaintainOrders(int producterId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProductOrderItemBean where producterId = ?0 Order by itemId";
		int startRecordNo = (maintainPageNo - 1) * maintainPerPage;
		Query<ProductOrderItemBean> query = session.createQuery(hql, ProductOrderItemBean.class);
		query.setParameter(0, producterId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(maintainPerPage);
		List<ProductOrderItemBean> list = query.list();
		return list;
	}

	public List<ProductOrderBean> getAllOrders() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProductOrderBean";
		Query<ProductOrderBean> query = session.createQuery(hql, ProductOrderBean.class);
		List<ProductOrderBean> list = query.list();
		for (ProductOrderBean order : list) {
			order = getOrder(order.getOrderId());
		}
		return list;
	}

	public ProductOrderBean getOrder(int orderNo2) {
		Session session = sessionFactory.getCurrentSession();
		ProductOrderBean pob = (ProductOrderBean) session.get(ProductOrderBean.class, orderNo2);
		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
		String hql = "From ProductOrderItemBean where orderId=?0";
		Query<ProductOrderItemBean> query = session.createQuery(hql, ProductOrderItemBean.class);
		query.setParameter(0, orderNo2);
		List<ProductOrderItemBean> list = query.list();
		for (ProductOrderItemBean item : list) {
			items.add(item);
		}
		pob.setItems(items);
		return pob;
	}

	public String getBuyerId() {
		return BuyerId;
	}

	public void setMemberId(String BuyerId) {
		this.BuyerId = BuyerId;
	}

	public double findItemAmount(ProductOrderItemBean oib) {
		double subtotal = oib.getAmount() * oib.getUnitPrice() * oib.getDiscount();
		return subtotal;
	}

// 修改商品庫存
	public ProductBean updateProductStock(ProductOrderItemBean oib) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean bean = (ProductBean) session.get(ProductBean.class, oib.getProductId());
		if (bean != null) {
			int stock = bean.getStock();
			System.out.println(stock);
			if (stock < oib.getAmount()) {
				throw new ProductStockException(
						"庫存數量不足: ProductId: " + oib.getProductId() + ", 在庫量: " + stock + ", 訂購量: " + oib.getAmount());
			} else {
				bean.setStock(stock - oib.getAmount());
				bean.setSold(bean.getSold() + oib.getAmount());
				if (stock - oib.getAmount() == 0) {
					bean.setStatus(2);
				}
			}
			return bean;
		}
		return null;
	}

// 取得會員姓名
	public ProducterBean getProducterId(Integer producterId) {
		Session session = sessionFactory.getCurrentSession();
		ProducterBean bean = session.get(ProducterBean.class, producterId);
		return bean;
	}

// 取得單筆訂單詳細資料
	public ProductOrderItemBean getOrderItem(Integer orderDetailId) {
		Session session = sessionFactory.getCurrentSession();
		ProductOrderItemBean poib=session.load(ProductOrderItemBean.class, orderDetailId);
		return poib;
	}

}
