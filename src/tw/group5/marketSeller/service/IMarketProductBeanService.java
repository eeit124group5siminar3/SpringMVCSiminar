package tw.group5.marketSeller.service;

import java.util.List;

import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;

public interface IMarketProductBeanService {
	public List<MarketProductTotalBean> selectAll(Integer mid);
	public boolean delete(int productId);
	public  MarketProductTotalBean insert(MarketProductTotalBean bean);
	public  MarketProductTotalBean update(MarketProductTotalBean bean);
	public MarketProductTotalBean select(int productId);
	public MarketProductImgBean selectImg(int productId);
	public List<MarketProductTotalBean> selectBuyerAll(Integer mid);
   
}
