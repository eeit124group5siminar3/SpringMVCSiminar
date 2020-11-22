package tw.group5.marketSeller.service;

import java.util.List;

import tw.group5.marketSeller.model.MarketMallBean;

public interface IMarketSellBeanService {

	//顯示賣家店家資訊
	List<MarketMallBean> selectmall(Integer mid);

	//更新賣家店家資訊
	MarketMallBean update(MarketMallBean bean);
    // 新增
	MarketMallBean insert(MarketMallBean bean);

	MarketMallBean selectid(Integer mid);

}