package marketSeller.model;

import java.util.List;

public interface IMarketProductBeanService {
	public List<MarketProductTotalBean> selectAll();
	public MarketProductTotalBean select(String productId);
}
