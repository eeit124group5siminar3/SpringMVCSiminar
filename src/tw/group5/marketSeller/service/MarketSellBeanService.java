package tw.group5.marketSeller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.marketSeller.dao.MarketSellerDao;
import tw.group5.marketSeller.model.MarketMallBean;
@Service
public class MarketSellBeanService implements IMarketSellBeanService {
	@Autowired
	private MarketSellerDao sDao;

	@Override
	public List<MarketMallBean> selectmall(Integer mid) {
		// TODO Auto-generated method stub
		return sDao.selectmall(mid);
	}

	@Override
	public MarketMallBean update(MarketMallBean bean) {
		// TODO Auto-generated method stub
		return sDao.update(bean);
	}
	
	@Override
	public MarketMallBean insert(MarketMallBean bean) {
		// TODO Auto-generated method stub
		return sDao.insert(bean);
	}

	@Override
	public MarketMallBean selectid(Integer mid) {
		// TODO Auto-generated method stub
		return sDao.selectid(mid);
	}
	
	

}