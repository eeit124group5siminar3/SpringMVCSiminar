package tw.group5.marketSeller.model;

import java.util.List;

public interface IMarketProductBeanService {
	public List<MarketProductTotalBean> selectAll(Integer mid);
	public boolean delete(int productId);
	public  MarketProductTotalBean insert(MarketProductTotalBean bean);
	public  MarketProductTotalBean update(MarketProductTotalBean bean);
	public MarketProductTotalBean select(int productId);
	public MarketProductImgBean selectImg(int productId);
   
}
