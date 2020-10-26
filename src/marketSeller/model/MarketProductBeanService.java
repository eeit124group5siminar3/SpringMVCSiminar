package marketSeller.model;

import java.util.List;

import com.sun.org.apache.bcel.internal.generic.Select;

public class MarketProductBeanService implements IMarketProductBeanService {
	private MarketProductDao mDao;

	@Override
	public List<MarketProductTotalBean> selectAll() {
		
		return mDao.selectAll();
	}

	@Override
	public MarketProductTotalBean select(String productId) {
		// TODO Auto-generated method stub
		return mDao.select(productId);
	}
	
	

}
