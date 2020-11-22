package tw.group5.marketSeller.dao;

import org.hibernate.query.Query;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.IMarketSellBeanService;


@Repository("MarketSellerDao")
public class MarketSellerDao implements IMarketSellBeanService {
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//顯示賣家店家資訊
	@Override
	public List<MarketMallBean> selectmall(Integer mid){
		Query<MarketMallBean> query =getSession().createQuery("From MarketMallBean where memberNo=" + mid, MarketMallBean.class);
		List<MarketMallBean> list =query.list();
		return list;
	}
	//更新賣家店家資訊
	@Override
	public MarketMallBean update(MarketMallBean bean) {
		getSession().update(bean);
	    return bean;
	}
	//
	@Override
	public MarketMallBean selectid(Integer mid) {
		
		return getSession().get(MarketMallBean.class, mid);
//	    return bean;
	}
	
	
	//新增
	@Override
	public MarketMallBean insert(MarketMallBean bean) {
		MarketMallBean result =getSession().get(MarketMallBean.class,bean.getMemberNo());
		
		 if (result==null) {
			getSession().save(bean);
			return bean;
		}
		return null;
	}



}
