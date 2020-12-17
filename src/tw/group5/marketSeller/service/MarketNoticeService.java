package tw.group5.marketSeller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.marketSeller.dao.MarketNoticeDao;
import tw.group5.marketSeller.model.MarketNotice;
@Service
public class MarketNoticeService implements IMarketNoticeService {

    @Autowired
	private MarketNoticeDao mDao;
	
	@Override
	public List<MarketNotice> selectBuyerNotice(Integer mid) {
		// TODO Auto-generated method stub
		return mDao.selectBuyerNotice(mid);
	}

	@Override
	public boolean delete(int productId) {
		// TODO Auto-generated method stub
		return mDao.delete(productId);
	}

	@Override
	public MarketNotice insert(MarketNotice bean) {
		// TODO Auto-generated method stub
		return mDao.insert(bean);
	}

	@Override
	public MarketNotice update(MarketNotice bean) {
		// TODO Auto-generated method stub
		return mDao.update(bean);
	}

	@Override
	public MarketNotice selectOne(int mId) {
		// TODO Auto-generated method stub
		return mDao.selectOne(mId);
	}

//	@Override
//	public MarketNotice selectOne(int productId, int mid) {
//		// TODO Auto-generated method stub
//		return mDao.selectOne(productId, mid);
//	}

}
