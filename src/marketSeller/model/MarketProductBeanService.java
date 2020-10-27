package marketSeller.model;

import java.util.List;

import org.hibernate.Session;

import com.sun.org.apache.bcel.internal.generic.Select;

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
	public boolean delete(String productId) {
		return mDao.delete(productId);
	}
	@Override
    public MarketProductTotalBean insert(MarketProductTotalBean bean) {
    	return mDao.insert(bean);
    }
	
}
