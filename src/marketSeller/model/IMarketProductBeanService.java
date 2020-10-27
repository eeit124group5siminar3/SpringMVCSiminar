package marketSeller.model;

import java.util.List;

public interface IMarketProductBeanService {
	public List<MarketProductTotalBean> selectAll();
	public boolean delete(int productId);
	public  MarketProductTotalBean insert(MarketProductTotalBean bean);
	public  MarketProductTotalBean update(MarketProductTotalBean bean);
	

}
