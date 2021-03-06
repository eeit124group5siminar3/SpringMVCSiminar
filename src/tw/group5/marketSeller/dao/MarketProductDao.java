package tw.group5.marketSeller.dao;


import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.IMarketProductBeanService;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


@Repository("MarketProductDao")
public class MarketProductDao implements IMarketProductBeanService {
	
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//=========================CRUD==========================================
	//顯示賣家全部商品
	@Override
	public List<MarketProductTotalBean> selectAll( Integer mid) {
		Query<MarketProductTotalBean> query =getSession().createQuery("From MarketProductTotalBean where MEMBER_NO=" + mid, MarketProductTotalBean.class);
		List<MarketProductTotalBean> list = query.list();
		return list;
	}
	//顯示賣家全部商品給買家看
	@Override
	public List<MarketProductTotalBean> selectBuyerAll( Integer mid) {
		Query<MarketProductTotalBean> query =getSession().createQuery("From MarketProductTotalBean where MEMBER_NO=" + mid +"AND PUT_OUT = 1", MarketProductTotalBean.class);
		List<MarketProductTotalBean> list = query.list();
		return list;
	}
	
	
	
	
	//查詢單筆
	@Override
	public MarketProductTotalBean select(int productId) {
		return getSession().get(MarketProductTotalBean.class, productId);
	}
	
	
	//查詢圖
	@Override
	public MarketProductImgBean selectImg(int productId) {
		return getSession().get(MarketProductImgBean.class, productId);
	}
	
	//刪除
	@Override
	public boolean delete(int productId) {
	MarketProductTotalBean result =getSession().get(MarketProductTotalBean.class,productId);
		
		if (result!=null) {
			getSession().delete(result);
			return true;
		}
		return false;
	}
	//新增
	@Override
	public MarketProductTotalBean insert(MarketProductTotalBean bean) {
			getSession().save(bean);
			return bean;
	}
	
	//更新
	@Override
	public MarketProductTotalBean update(MarketProductTotalBean bean) {
		getSession().update(bean);
	    return bean;
		}
	

}
