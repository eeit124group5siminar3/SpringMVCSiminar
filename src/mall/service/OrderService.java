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
	private static final SessionFactory factory=HibernateUtil.getSessionFactory();
	private static final Session session=factory.getCurrentSession();

	private OrderDAO odao;
//	private MemberDao mdao;

	public OrderService() {
		this.odao = new OrderDAO(session);
	}

	// 這是一個交易
	public void persistOrder(ProductOrderBean ob) {
		Connection con = null;
		try {
			con = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex.getMessage());
		}
		try {
			// 交易開始
			con.setAutoCommit(false);
			// 檢查未付款餘額是否超過限額，並更新未付款餘額
//			mdao.setConnection(con);
//			mdao.updateUnpaidOrderAmount(ob);
//			
			// 檢查所有訂單明細所訂購之商品的庫存數量是否足夠
			checkStock(ob, con);
			
			// 儲存訂單
			odao.setConnection(con);
			odao.insertOrder(ob);
			con.commit();
		} catch (Exception e) {
			try {
				con.rollback();
				System.out.println("發生異常，交易回滾.....,原因: " + e.getMessage());
			} catch (SQLException e1) {
				throw new RuntimeException(e1);
			}
			throw new RuntimeException(e);
		} finally {
			try {
				con.setAutoCommit(true);
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e.getMessage());
			}
		}

	}

	public void checkStock(ProductOrderBean ob, Connection con) {
		Set<ProductOrderItemBean> items = ob.getItems();
		odao.setConnection(con);
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
