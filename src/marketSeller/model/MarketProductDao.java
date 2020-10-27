package marketSeller.model;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;

public class MarketProductDao {
	private Session session;
	
	public MarketProductDao(Session session) {
		this.session=session;
	}
	//顯示全部商品
	public List<MarketProductTotalBean> selectAll() {
		Query<MarketProductTotalBean> query =session.createQuery("From MarketProductTotalBean", MarketProductTotalBean.class);
		List<MarketProductTotalBean> list = query.list();
		return list;
	}
	
	public boolean delete(String productId) {
	MarketProductTotalBean result =session.get(MarketProductTotalBean.class,productId);
		
		if (result!=null) {
			session.delete(result);
			return true;
		}
		return false;
	}
	
	public MarketProductTotalBean insert(MarketProductTotalBean bean) {
		MarketProductTotalBean result =session.get(MarketProductTotalBean.class,bean.getProductId());
		
		if (result==null) {
			session.save(bean);
			return bean;
		}
		return null;
	}
}
