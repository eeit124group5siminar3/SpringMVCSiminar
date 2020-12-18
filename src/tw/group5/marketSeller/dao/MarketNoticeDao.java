package tw.group5.marketSeller.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.model.MarketNotice;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.IMarketNoticeService;

@Repository("MarketNoticeDao")
public class MarketNoticeDao implements IMarketNoticeService {
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public List<MarketNotice> selectBuyerNotice(Integer mid){
		Query<MarketNotice> query =getSession().createQuery("From MarketNotice where BUYER_ID=" + mid, MarketNotice.class);
		List<MarketNotice> list =query.list();
		return list;
	}
	
	//查詢單筆
	@Override
	public MarketNotice selectOne(int mId) {
		MarketNotice result= getSession().get(MarketNotice.class, mId);
		if (result != null) {
			return result;
		}
		return null;
//	    return bean;
	}
	
	
	//刪除
	@Override
	public boolean delete(int productId) {
		MarketNotice result =getSession().get(MarketNotice.class,productId);
		
		if (result!=null) {
			getSession().delete(result);
			return true;
		}
		return false;
	}
	
	//新增
	@Override
	public MarketNotice insert(MarketNotice bean) {
			getSession().save(bean);
			return bean;
	}
	
	//更新
	@Override
	public MarketNotice update(MarketNotice bean) {
		getSession().update(bean);
	    return bean;
		}
	
	

}
