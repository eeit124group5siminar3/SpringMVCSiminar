package tw.group5.active.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.aop.interceptor.SimpleTraceInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("activeDAO")
public class ActiveDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Autowired
	public ActiveDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 新增資料
	public Active insert(Active active) {
		Session session = sessionFactory.getCurrentSession();
		Active result = session.get(Active.class, active.getActId());

		if (result == null) {
			session.save(active);
			return active;
		}
		return null;
	}

	// 查詢單筆資料ById
	public Active select(int actId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Active.class, actId);
	}
	
	// 查詢單筆資料ByName
	public List<Active> selectName(String actName) {
		Session session = sessionFactory.getCurrentSession();
		Query<Active> queryName = session.createQuery("From Active where actName like?1",Active.class);
		queryName.setParameter(1, "%"+actName+"%");
		List<Active> activelist = queryName.getResultList();
		return activelist;
		
		
//		return session.get(Active.class, actName);
	}

	// 查詢多筆資料
	public List<Active> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<Active> query = session.createQuery("From Active", Active.class);
		List<Active> list = query.list();
		return list;

	}

	// 更新
	public Active update(int actId ,Active active) {
		Session session = sessionFactory.getCurrentSession();
		Active result = session.get(Active.class, actId);

		if (result != null) {
			
			result.setActName(active.getActName());
			result.setActType(active.getActType());
			result.setActAddr(active.getActAddr());
			result.setTel(active.getTel());
			result.setActDate(active.getActDate());
			result.setDateSta(active.getDateSta());
			result.setDateEnd(active.getDateEnd());
			result.setExpNum(active.getExpNum());
			result.setPrice(active.getPrice());
			result.setActDescri(active.getActDescri());
			
			return result ;
			
		}
//		return result ;
		return null;

		
	}

	// 刪除ById
	public boolean delete(int actId) {
		Session session = sessionFactory.getCurrentSession();
		Active result = session.get(Active.class, actId);

		if (result != null) {
			session.delete(result);
			return true;
		}

		return false;
	}
}
