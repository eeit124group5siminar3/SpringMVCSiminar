package tw.group5.marketSeller.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.marketSeller.dao.MarketOrderDao;
import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.model.MarketOrderDetailBean;
@Service
public class MarketOrderBeanService implements IMarketOrderBeanService {
    @Autowired
	private MarketOrderDao mDao;
	
	@Override
	public void insert(MarketOrderBean bean) {
		checkStock(bean);
		 mDao.insert(bean);
	}
    
	private void checkStock(MarketOrderBean bean) {
		Set<MarketOrderDetailBean> items =bean.getMarketOrderDetailBean();
		for (MarketOrderDetailBean mib : items) {
			mDao.updateStock(mib);
		}
		
	}

	@Override
	public List<MarketOrderBean> selectBuyerOrder(Integer mid) {
		return mDao.selectBuyerOrder(mid);
	}

}
