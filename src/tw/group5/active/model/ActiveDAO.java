package tw.group5.active.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.aop.interceptor.SimpleTraceInterceptor;

public class ActiveDAO {

	private Session session;

	public ActiveDAO(Session session) {
		this.session = session;
	}

	// 新增資料
	public Active insert(Active active) {
		Active result = session.get(Active.class, active.getActId());

		if (result == null) {
			session.save(active);
			return active;
		}
		return null;
	}

	// 查詢單筆資料ById
	public Active select(int actId) {
		return session.get(Active.class, actId);
	}
	
	// 查詢單筆資料ByName
	public List<Active> selectName(String actName) {
		Query<Active> queryName = session.createQuery("From Active where actName like?1",Active.class);
		queryName.setParameter(1, "%"+actName+"%");
		List<Active> activelist = queryName.getResultList();
		return activelist;
		
		
//		return session.get(Active.class, actName);
	}

	// 查詢多筆資料
	public List<Active> selectAll() {
		Query<Active> query = session.createQuery("From Active", Active.class);
		List<Active> list = query.list();
		return list;

	}

	// 更新
	public Active update(int actId ,Active active) {
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
		return null;

		
	}

	// 刪除ById
	public boolean delete(int actId) {
		Active result = session.get(Active.class, actId);

		if (result != null) {
			session.delete(result);
			return true;
		}

		return false;
	}
}
