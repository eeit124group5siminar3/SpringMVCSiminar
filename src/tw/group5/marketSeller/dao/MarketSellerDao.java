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
//=========================CRUD==========================================
	//顯示賣家店家資訊
	@Override
	public List<MarketMallBean> selectmall(Integer mid){
		Query<MarketMallBean> query =getSession().createQuery("From MarketMallBean where memberNo=" + mid, MarketMallBean.class);
		if (query != null) {
			List<MarketMallBean> list =query.list();
			return list;			
		}
		return null;
	}
	//更新賣家店家資訊
	@Override
	public MarketMallBean update(MarketMallBean bean) {
		getSession().update(bean);
	    return bean;
	}
	//賣家店家資訊id
	@Override
	public MarketMallBean selectid(Integer mid) {
		MarketMallBean result =getSession().get(MarketMallBean.class, mid);
        System.out.println("我來了");		
		System.err.println("你要是空的:"+ result);
		if (result != null) {
			return result;
		}
		return null;
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
//=========================分頁==========================================
	//所有賣家(顯示資料)
	@Override
	public List<MarketMallBean> selectAllmall(Integer page,Integer showData){
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 5;
		}
		int startPosition =(page-1)*showData; //每頁從第幾筆開始
		Query<MarketMallBean> query =getSession().createQuery("From MarketMallBean", MarketMallBean.class);
			List<MarketMallBean> list =query.setFirstResult(startPosition)
		    .setMaxResults(showData)
			.setReadOnly(true) //DB分頁
			.getResultList();
			return list;			

	}
	// 總共頁數
	@Override
	public int sellerPages() {
		 Query query =getSession().createQuery("select count(*) From MarketMallBean");
		 System.out.println("我應該要是數字"+query);
		 long result = (long) query.uniqueResult();
		 return(int)result;
	}
}
