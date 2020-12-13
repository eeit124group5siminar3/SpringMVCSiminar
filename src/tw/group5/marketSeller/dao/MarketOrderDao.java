package tw.group5.marketSeller.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.marketSeller.model.MarketOrderBean;
import tw.group5.marketSeller.service.IMarketOrderBeanService;

@Repository("MarketOrderDao")
public class MarketOrderDao implements IMarketOrderBeanService  {
	
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//新增
	@Override
	public MarketOrderBean insert(MarketOrderBean bean) {
		getSession().save(bean);
		return bean;
	}

}
