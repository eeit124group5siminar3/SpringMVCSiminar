//package tw.group5.mall.dao;
//
//import java.util.HashSet;
//import java.util.List;
//import java.util.Set;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.context.annotation.Scope;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//import tw.group5.mall.ProductStockException;
//import tw.group5.mall.model.ProductBean;
//import tw.group5.mall.model.ProductOrderBean;
//import tw.group5.mall.model.ProductOrderItemBean;
//
//@Repository
////@Scope(value = "session")
//public class OrderDAO2 {
//	private String BuyerId = null;
//	int orderNo = 0;
////	private Session session;
//	@Autowired
//	@Qualifier("sessionFactory")
//	private SessionFactory sessionFactory;
//
////	public OrderDAO(Session session) {
////		this.session=session;
////	}
//
//	public ProductOrderBean insertOrder(ProductOrderBean ob) {
//		Session session = sessionFactory.getCurrentSession();
//		
//			session.save(ob);
//			return ob;
//		
//	}
//
//	public ProductOrderBean getOrder(int orderNo2) {
//		Session session = sessionFactory.getCurrentSession();
//		ProductOrderBean pob = (ProductOrderBean) session.get(ProductOrderBean.class, orderNo2);
//		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
//		String hql = "From ProductOrderItemBean where orderId=?0";
//		Query<ProductOrderItemBean> query = session.createQuery(hql,ProductOrderItemBean.class);
//		query.setParameter(0, orderNo2);
//		List<ProductOrderItemBean> list = query.list();
//		for (ProductOrderItemBean item : list) {
//			items.add(item);
//		}
//		pob.setItems(items);
//		return pob;
//	}
//
//	public String getBuyerId() {
//		return BuyerId;
//	}
//
//	public void setMemberId(String BuyerId) {
//		this.BuyerId = BuyerId;
//	}
//
//	public List<ProductOrderBean> getAllOrders() {
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from ProductOrderBean";
//		Query<ProductOrderBean> query = session.createQuery(hql,ProductOrderBean.class);
//		List<ProductOrderBean> list = query.list();
//		for (ProductOrderBean order : list) {
//			order = getOrder(order.getOrderId());
//		}
//
////		
//		return list;
//	}
//
//	public List<ProductOrderBean> getMemberOrders(int BuyerId) {
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from ProductOrderBean where BuyerId = ?0 Order by orderDate desc ";
//		Query<ProductOrderBean> query = session.createQuery(hql,ProductOrderBean.class);
//		query.setParameter(0, BuyerId);
//		List<ProductOrderBean> list = query.list();
//		for (ProductOrderBean order : list) {
//			order = getOrder(order.getOrderId());
//		}
//
////	
//		return list;
//	}
//
//	public double findItemAmount(ProductOrderItemBean oib) {
//		double subtotal = oib.getAmount() * oib.getUnitPrice() * oib.getDiscount();
//		return subtotal;
//	}
//
//	public ProductBean updateProductStock(ProductOrderItemBean oib) {
//		Session session = sessionFactory.getCurrentSession();
//		ProductBean bean = (ProductBean) session.get(ProductBean.class, oib.getProductId());
//		if (bean != null) {
//			int stock = bean.getStock();
//			System.out.println(stock);
//			if (stock < oib.getAmount()) {
//				throw new ProductStockException(
//						"庫存數量不足: BookId: " + oib.getProductId() + ", 在庫量: " + stock + ", 訂購量: " + oib.getAmount());
//			} else {
//				bean.setStock(stock - oib.getAmount());
//			}
//			return bean;
//		}
//		return null;
//	}
//
//}
