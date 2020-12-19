package tw.group5.marketSeller.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.model.MarketOrderDetailBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.IMarketOrderBeanService;
import tw.group5.util.SendMail;

@Repository("MarketOrderDao")
public class MarketOrderDao implements IMarketOrderBeanService  {
	
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<MarketOrderBean> selectBuyerOrder(Integer mid){
		Query<MarketOrderBean> query =getSession().createQuery("From MarketOrderBean where BUYERID=" + mid+" ORDER BY OID DESC", MarketOrderBean.class);
		List<MarketOrderBean> list =query.list();
		return list;
	}
	
	@Override
	public List<MarketOrderBean> selectSellerOrder(Integer mid){
		String sql="select * from MARKET_ORDER where  OID in (select OID from MARKET_ORDER_DETAIL where SELLERID = :sellerID)";
//		String sql = "From MarketOrderBean where marketOrderDetailBean =" + mid + ")";
		Query<MarketOrderBean> query =getSession().createSQLQuery(sql);
		System.out.println("賣家的ID在這"+mid);
		query.setParameter("sellerID", mid);
		List<MarketOrderBean> list =query.list();
		return list;
	}
	
//	@Override
//	public List<MarketOrderDetailBean> selectSellerOrder(Integer mid){
//		Query<MarketOrderDetailBean> query =getSession().createQuery("From MarketOrderDetailBean where SELLERID=" + mid,MarketOrderDetailBean.class);
//		List<MarketOrderDetailBean> list =query.list();
//		return list;
//	}
	
	@Override
	public List<MarketOrderDetailBean> selectBuyerOrderDetail(Integer oid){
		String hql ="From MarketOrderDetailBean where OID=?0 order by OID";
		Query<MarketOrderDetailBean> query =getSession().createQuery(hql, MarketOrderDetailBean.class);
		query.setParameter(0,oid);
		List<MarketOrderDetailBean> list =query.list();
		return list;
	}
	
	@Override
	public MarketOrderBean selectOneOrder(int oid) {
		return getSession().get(MarketOrderBean.class, oid);
	}

//	public List<MarketOrderBean> selectsellerOneOrder(int oid) {
//		Query<MarketOrderBean> query =getSession().createQuery("From MarketOrderBean where OID=" + oid, MarketOrderBean.class);
//		List<MarketOrderBean> list =query.list();
//		return list;
//	}
	
	
	public MarketProductTotalBean updateStock(MarketOrderDetailBean mib) {
		Session session = sessionFactory.getCurrentSession();
		MarketProductTotalBean pBean=(MarketProductTotalBean) session.get(MarketProductTotalBean.class, mib.getMarketProductTotalBean().getProductId());
		int stock =pBean.getQuantity();
		pBean.setQuantity(stock-mib.getQuantity());
		if (stock-mib.getQuantity()==0) {
			String who = pBean.getMarketMallBean().getMallName(); //會員名稱
			String email = pBean.getMarketMallBean().getMail(); //會員E-mail
			String productName = pBean.getProductName(); 
			String title = "農郁預購系統通知";
			String text= who + "您好:<br>"
					+"您的商品" + productName + "庫存為0了<br>";
			new SendMail(email, title, text);
		}
		return pBean;
	}

	@Override
	public void insert(MarketOrderBean bean) {
		getSession().save(bean);
	}

	@Override
	public MarketOrderDetailBean selectOneOrderDetail(int oid) {
		// TODO Auto-generated method stub
		return null;
	}


}
