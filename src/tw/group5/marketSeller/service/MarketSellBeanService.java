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

	@Override
	public int sellerPages() {
		// TODO Auto-generated method stub
		return sDao.sellerPages();
	}


	@Override
	public List<MarketMallBean> selectAllmall(Integer page, Integer showData) {
		// TODO Auto-generated method stub
		return sDao.selectAllmall(page, showData);
	}

	@Override
	public List<MarketMallBean> selectmallname(String mallName) {
		// TODO Auto-generated method stub
		return sDao.selectmallname(mallName);
	}

}
