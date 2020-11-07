package tw.group5.marketSeller.model;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MarketProductBeanService implements IMarketProductBeanService {
	@Autowired
	private MarketProductDao mDao;
	


	@Override
	public List<MarketProductTotalBean> selectAll() {
		
		return mDao.selectAll();
	}
	
	@Override
	public MarketProductTotalBean select(int productId) {
		
		return mDao.select(productId);
	}
	
	@Override
	public boolean delete(int productId) {
		return mDao.delete(productId);
	}
	

	
	@Override
    public MarketProductTotalBean insert(MarketProductTotalBean bean) {
    	return mDao.insert(bean);
    }
	@Override
    public MarketProductTotalBean update(MarketProductTotalBean bean) {
    	return mDao.update(bean);
    }

	@Override
	public MarketProductImgBean selectImg(int productId) {
		return mDao.selectImg(productId);
	}
	
	
}
