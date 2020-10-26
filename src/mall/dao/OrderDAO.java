package mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.persistence.criteria.From;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;

import mall.ProductStockException;
import mall.productModel.ProductBean;
import mall.productModel.ProductOrderBean;
import mall.productModel.ProductOrderItemBean;


public class OrderDAO {
	private String BuyerId = null;
	int orderNo = 0;
	private Session session;


	public OrderDAO(Session session) {
		this.session=session;
	}


	public ProductOrderBean insertOrder(ProductOrderBean ob) {
		ProductOrderBean result=session.get(ProductOrderBean.class, ob.getOrderId());
		if (result==null) {
			session.save(ob);
			return ob;
		}
		return null;
	}

	public ProductOrderBean getOrder(int orderNo2) {
		ProductOrderBean pob=(ProductOrderBean)session.get(ProductOrderBean.class, orderNo2);
		Set<ProductOrderItemBean>items=new HashSet<ProductOrderItemBean>();
		String hql="From ProductOrderItemBean where orderId=?0";
		Query query=session.createQuery(hql);
		query.setParameter(0, orderNo2);
		List<ProductOrderItemBean> list=query.list();
		for(ProductOrderItemBean item:list) {
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


	public List<ProductOrderBean> getAllOrders() {
		String hql="from ProductOrderBean";
		Query query=session.createQuery(hql);
		List<ProductOrderBean> list=query.list();
		for(ProductOrderBean order:list) {
			order=getOrder(order.getOrderId());
		}

//		
		return list;
	}

	public List<ProductOrderBean> getMemberOrders(String BuyerId) {
		String hql="from ProductOrderBean where BuyerId = ?0 Order by orderDate desc ";
		Query query=session.createQuery(hql);
		query.setParameter(0, BuyerId);
		List<ProductOrderBean> list=query.list();
		for(ProductOrderBean order:list) {
			order=getOrder(order.getOrderId());
		}

//	
		return list;
	}
	public double findItemAmount(ProductOrderItemBean oib) {
		double subtotal = oib.getAmount() * oib.getUnitPrice() * oib.getDiscount();
		return subtotal;
	}
	

	public ProductBean updateProductStock(ProductOrderItemBean oib) {
		
		ProductBean bean=(ProductBean)session.get(ProductBean.class, oib.getProductId());
		if (bean!=null) {
		int stock =bean.getStock();
		System.out.println(stock);
		if (stock < oib.getAmount()) {
			throw new ProductStockException("庫存數量不足: BookId: " 
					+ oib.getProductId() + ", 在庫量: " + stock+ ", 訂購量: " + oib.getAmount());
		} 	else {
			bean.setStock(stock-oib.getAmount());
		}
		return bean;}
		return null;
	}
	
}
