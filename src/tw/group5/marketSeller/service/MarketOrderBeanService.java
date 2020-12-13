package tw.group5.marketSeller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.marketSeller.dao.MarketOrderDao;
import tw.group5.marketSeller.model.MarketOrderBean;
@Service
public class MarketOrderBeanService implements IMarketOrderBeanService {
    @Autowired
	private MarketOrderDao mDao;
	
	
	@Override
	public MarketOrderBean insert(MarketOrderBean bean) {
		
		return mDao.insert(bean);
	}

}
