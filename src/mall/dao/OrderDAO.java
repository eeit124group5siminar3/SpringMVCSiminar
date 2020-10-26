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
//	private Connection con;
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
//		String sqlOrder = "Insert Into orderform "
//				+ " (buyerId,buyerName,Address,tel,"
//				+ " BNO, total, orderDate) "
//				+ " values(?, ?, ?, ?, ?, ?,?) ";
//
//		String sqlItem = "Insert Into Orderdetails (orderid, productId,ProducterId,"
//				+ " description, amount, unitPrice, discount,status) "
//				+ " values(?, ?, ?, ?, ?, ?,?,0) ";
//
//		ResultSet generatedKeys = null;
//
//		String generatedColumns[] = {"ORDERID"};
//		try (
//			PreparedStatement ps = con.prepareStatement(sqlOrder,
//					generatedColumns);
//		) {
//			ps.setString(1, ob.getBuyerId());
//			ps.setString(2, ob.getBuyerName());
//			ps.setString(3, ob.getAddress());
//			ps.setString(4, ob.getTel());
//			ps.setString(5, ob.getBNo());
//			ps.setDouble(6, ob.getTotal());
//			Timestamp ts = new Timestamp(ob.getOrderDate().getTime());
//			ps.setTimestamp(7, ts);
//			ps.executeUpdate();
//			ps.clearParameters();
//			int id = 0;
//			// 取回剛才新增之訂單的主鍵值
//			generatedKeys = ps.getGeneratedKeys();
//			if (generatedKeys.next()) {
//				id = generatedKeys.getInt(1);
//			} else {
//				throw new RuntimeException("insertOrder()無法取得新增之orders表格的主鍵");
//			}
//            int n = 0 ; 
//			Set<ProductOrderItemBean> items = ob.getItems();
//			try (PreparedStatement ps2 = con.prepareStatement(sqlItem);) {
//				for (ProductOrderItemBean oib : items) {
//					 //下列四個敘述為交易測試而編寫
////					 n++;
////					 if (n > 1) {
////					 	  System.out.println("發生例外 n>2");
////					 	  throw new RuntimeException("JDBC交易測試用");
////					 }
//					ps2.setInt(1, id);
//					ps2.setInt(2, oib.getProductId());
//					ps2.setNString(3, oib.getProducterId());
//					ps2.setString(4, oib.getDescription());
//					ps2.setDouble(5, oib.getAmount());
//					ps2.setDouble(6, oib.getUnitPrice());
//					ps2.setDouble(7, oib.getDiscount());
//					ps2.executeUpdate();
//					ps2.clearParameters();
//
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("insertOrder()發生SQL例外: " + ex.getMessage());
//		}
	}

	public ProductOrderBean getOrder(int orderNo2) {
//		ProductOrderBean ob = null;
//		DataSource ds = null;
//		Set<ProductOrderItemBean> set = null;
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xe");
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getOrder()-1發生例外: " + ex.getMessage());
//		}
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
//		String sql = "SELECT * FROM Orderform WHERE orderid = ? ";
//		String sql1 = "SELECT * FROM Orderdetails o,member_signup m WHERE orderid = ? and producterId=member_no";
//		try (
//			Connection con = ds.getConnection();
//			PreparedStatement ps = con.prepareStatement(sql);
//			PreparedStatement ps1 = con.prepareStatement(sql1);
//		) {
//			ps.setInt(1, orderNo2);
//			try (
//				ResultSet rs = ps.executeQuery();
//			) {
//				if (rs.next()) {
//					Integer no = rs.getInt("orderID");
//					//String cancel = rs.getString("cancelTag");
//					String bno = rs.getString("bno");
//					String buyerName = rs.getString("BUYERNAME");
//					String id = rs.getString("BUYERId");
//					String tel=rs.getNString("tel");
//					Timestamp orderDate = rs.getTimestamp("orderDate");
//					String shipAddr = rs.getString("Address");
//					
//					double totalAmount = rs.getDouble("total");
//					
//					ob = new ProductOrderBean(no, id, buyerName, shipAddr,tel, bno, totalAmount, orderDate, null);
//					
//				}
//			}
//			ps1.setInt(1, orderNo2);
//			try (
//				ResultSet rs = ps1.executeQuery();
//			) {
//				set = new HashSet<>();
//				while (rs.next()) {
//					int itemId = rs.getInt("ItemId");
//					int orderId2 = rs.getInt("orderId");
//					int ProductId = rs.getInt("ProductId");
//					String producterId=rs.getNString("ProducterId");
//					String description = rs.getString("description");
//					Integer amount = rs.getInt("amount");
//					Double uPrice = rs.getDouble("unitPrice");
//					Double discount = rs.getDouble("discount");
//					Date shipDate = rs.getDate("shippingDate");
//					String producterName=rs.getString("member_name");
//					int status=rs.getInt("status");
//					ProductOrderItemBean oi = new ProductOrderItemBean(itemId, orderId2, ProductId, producterId,
//							description, amount, uPrice, discount, shipDate,status);
//					oi.setProducterName(producterName);
//					set.add(oi);
//				}
//				ob.setItems(set);
//				
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getOrder()-2發生例外: " + ex.getMessage());
//		}
//		return ob;
	}

	public String getBuyerId() {
		return BuyerId;
	}

	public void setMemberId(String BuyerId) {
		this.BuyerId = BuyerId;
	}

//	public void setConnection(Connection con) {
//		this.con = con;
//	}

	public List<ProductOrderBean> getAllOrders() {
		String hql="from ProductOrderBean";
		Query query=session.createQuery(hql);
		List<ProductOrderBean> list=query.list();
		for(ProductOrderBean order:list) {
			order=getOrder(order.getOrderId());
		}

//		DataSource ds = null;
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xe");
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getOrder()-1發生例外: " + ex.getMessage());
//		}
//		List<ProductOrderBean> list = new ArrayList<ProductOrderBean>();
//		String sql = "SELECT OrderId FROM OrderForm";
//		try (
//			Connection con = ds.getConnection();
//			PreparedStatement ps = con.prepareStatement(sql);
//			ResultSet rs = ps.executeQuery();
//		) {
//			while (rs.next()) {
//				int no = rs.getInt(1);
//				list.add(getOrder(no));
//			}
//		} catch(SQLException ex){
//			throw new RuntimeException(ex);
//		}
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

//		DataSource ds = null;
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xe");
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("getOrder()-1發生例外: " + ex.getMessage());
//		}
//		List<ProductOrderBean> list = new ArrayList<ProductOrderBean>();
//		String sql = "SELECT OrderId FROM Orderform where BuyerId = ? Order by orderDate desc ";
//		try (
//				Connection con = ds.getConnection();
//				PreparedStatement ps = con.prepareStatement(sql);
//			) {
//				ps.setString(1, BuyerId);
//				try (
//					ResultSet rs = ps.executeQuery();
//				) {
//					while (rs.next()) {
//						int no = rs.getInt(1);
//						list.add(getOrder(no));
//					}
//				}
//		} catch(SQLException ex){
//			throw new RuntimeException(ex);
//		}
		return list;
	}
	public double findItemAmount(ProductOrderItemBean oib) {
		double subtotal = oib.getAmount() * oib.getUnitPrice() * oib.getDiscount();
		return subtotal;
	}
	

	public ProductBean updateProductStock(ProductOrderItemBean oib) {
//		int n = 0;
//		int stock = 0;
		
		ProductBean bean=(ProductBean)session.get(ProductBean.class, oib.getProductId());
		if (bean!=null) {
		int stock =bean.getStock();
//		String hql0="select stock from ProductBean where productId=?0";
//		Query query0=session.createQuery(hql0);
//		query0.setParameter(0, oib.getProductId());
//		int stock=(int)query0.uniqueResult();
		System.out.println(stock);
		if (stock < oib.getAmount()) {
			throw new ProductStockException("庫存數量不足: BookId: " 
					+ oib.getProductId() + ", 在庫量: " + stock+ ", 訂購量: " + oib.getAmount());
		} 	else {
			bean.setStock(stock-oib.getAmount());
		}
		return bean;}
		return null;
//		String sql0 = "SELECT stock FROM Product WHERE productId = ?";
//		String sql1 = "UPDATE Product SET stock = stock - ? WHERE productId = ?";
//		try (PreparedStatement ps = con.prepareStatement(sql0);) {
//			ps.setInt(1, oib.getProductId());
//			try (ResultSet rs = ps.executeQuery();) {
//				if (rs.next()) {
//					stock = rs.getInt(1);
//					if (stock < oib.getAmount()) {
//						throw new ProductStockException("庫存數量不足: BookId: " 
//								+ oib.getProductId() + ", 在庫量: " + stock+ ", 訂購量: " + oib.getAmount());
//					} else {
//						;
//					}
//					try (PreparedStatement ps1 = con.prepareStatement(sql1);) {
//						ps1.setInt(1, oib.getAmount());
//						ps1.setInt(2, oib.getProductId());
//						n = ps1.executeUpdate();
//					}
//				}
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("updateProductStock()發生SQL例外: " + ex.getMessage());
//		}
//		return n;
	}
	
}
