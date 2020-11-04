package tw.group5.marketSeller.model;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


@Repository("MarketProductDao")
public class MarketProductDao {
	
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	//顯示全部商品
	public List<MarketProductTotalBean> selectAll() {
		Query<MarketProductTotalBean> query =getSession().createQuery("From MarketProductTotalBean", MarketProductTotalBean.class);
		List<MarketProductTotalBean> list = query.list();
		return list;
	}
	
	//查詢單筆
	public MarketProductTotalBean select(int productId) {
		return getSession().get(MarketProductTotalBean.class, productId);
	}
	
	//刪除
	public boolean delete(int productId) {
	MarketProductTotalBean result =getSession().get(MarketProductTotalBean.class,productId);
		
		if (result!=null) {
			getSession().delete(result);
			return true;
		}
		return false;
	}
	//新增
	public MarketProductTotalBean insert(MarketProductTotalBean bean) {
		MarketProductTotalBean result =getSession().get(MarketProductTotalBean.class,bean.getProductId());
		
		if (result==null) {
			getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	//更新
	public MarketProductTotalBean update(MarketProductTotalBean bean) {
		getSession().update(bean);
	    return bean;
		}
	
}
