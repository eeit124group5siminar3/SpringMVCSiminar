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

@Repository
//@Scope(value = "session")
public class OrderDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private String BuyerId = null;
	int orderNo = 0;
	private int pageNo = 1;
	private int recordsPerPage = 5;
	private int totalPages = -1;

	public ProductOrderBean insertOrder(ProductOrderBean ob) {
		Session session = sessionFactory.getCurrentSession();
		session.save(ob);
		return ob;
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

	public int getTotalPages(int buyerId) {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts(buyerId) / (double) recordsPerPage));
		return totalPages;
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
		String hql = "from ProductOrderBean where BuyerId = ?0 Order by orderDate desc ";
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		Query<ProductOrderBean> query = session.createQuery(hql, ProductOrderBean.class);
		query.setParameter(0, BuyerId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(recordsPerPage);
		List<ProductOrderBean> list = query.list();
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

	public ProductBean updateProductStock(ProductOrderItemBean oib) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean bean = (ProductBean) session.get(ProductBean.class, oib.getProductId());
		if (bean != null) {
			int stock = bean.getStock();
			System.out.println(stock);
			if (stock < oib.getAmount()) {
				throw new ProductStockException(
						"庫存數量不足: BookId: " + oib.getProductId() + ", 在庫量: " + stock + ", 訂購量: " + oib.getAmount());
			} else {
				bean.setStock(stock - oib.getAmount());
			}
			return bean;
		}
		return null;
	}

}
