package marketSeller.model;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;

public class MarketProductDao {
	private Session session;
	
	public MarketProductDao(Session session) {
		this.session=session;
	}
	
	public List<MarketProductTotalBean> selectAll() {
		Query<MarketProductTotalBean> query =session.createQuery("From MarketProductTotalBean", MarketProductTotalBean.class);
		List<MarketProductTotalBean> list = query.list();
		return list;
	}
	
	public MarketProductTotalBean select(String productId) {
		return session.get(MarketProductTotalBean.class, productId);
	}
	

}
