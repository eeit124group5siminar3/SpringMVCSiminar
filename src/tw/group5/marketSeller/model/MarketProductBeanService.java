package tw.group5.marketSeller.model;

import java.util.List;

import org.hibernate.Session;



public class MarketProductBeanService implements IMarketProductBeanService {
	private MarketProductDao mDao;
	private  Session session;
	
	public MarketProductBeanService(Session insession) {
		this.mDao=new MarketProductDao(insession);
	}

	@Override
	public List<MarketProductTotalBean> selectAll() {
		
		return mDao.selectAll();
	}
	@Override
	public boolean delete(int productId) {
		return mDao.delete(productId);
	}
	@Override
    public MarketProductTotalBean insert(MarketProductTotalBean bean) {
    	return mDao.insert(bean);
    }
	@Override
    public MarketProductTotalBean update(MarketProductTotalBean bean) {
    	return mDao.update(bean);
    }
	
	
}
