package mall.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.dao.OrderDAO;
import mall.dao.ProductDAO;
import mall.productModel.ProductOrderBean;
import mall.productModel.ProductOrderItemBean;
import util.HibernateUtil;

public class OrderService {
	private Session session;

	private OrderDAO odao;

	public OrderService(Session session) {
		this.odao = new OrderDAO(session);
	}

	// 這是一個交易
	public void persistOrder(ProductOrderBean ob) {
//		
			checkStock(ob);
//			
//			// 儲存訂單

			odao.insertOrder(ob);

	}

	public void checkStock(ProductOrderBean ob) {
		Set<ProductOrderItemBean> items = ob.getItems();
		for (ProductOrderItemBean oib : items) {
			odao.updateProductStock(oib);
		}
	}



	public OrderDAO getOdao() {
		return odao;
	}

	public void setOdao(OrderDAO odao) {
		this.odao = odao;
	}

	public ProductOrderBean getOrder(int orderNo) {
		return odao.getOrder(orderNo);
	}

	public List<ProductOrderBean> getAllOrders() {
		return odao.getAllOrders();
	}

	public List<ProductOrderBean> getMemberOrders(String memberId) {
		return odao.getMemberOrders(memberId);
	}
}
