package tw.group5.marketSeller.controller;

import java.util.List;

import tw.group5.marketSeller.model.MarketProductTotalBean;

public interface IMarketProductBeanService {
	public List<MarketProductTotalBean> selectAll();
	public boolean delete(int productId);
	public  MarketProductTotalBean insert(MarketProductTotalBean bean);
	public  MarketProductTotalBean update(MarketProductTotalBean bean);
	

}
