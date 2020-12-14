package tw.group5.marketSeller.service;

import java.util.List;

import tw.group5.marketSeller.model.MarketOrderBean;

public interface IMarketOrderBeanService {

	void insert(MarketOrderBean bean);

	List<MarketOrderBean> selectBuyerOrder(Integer mid);

}