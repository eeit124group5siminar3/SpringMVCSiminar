package marketSeller.model;

import java.util.List;

public class MarketProductBeanService implements IMarketProductBeanService {
	private MarketProductDao mDao;

	@Override
	public List<MarketProductTotalBean> selectAll() {
		
		return mDao.selectAll();
	}

}
