package active.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

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
	public Active selectName(String actName) {
		return session.get(Active.class, actName);
	}

	// 查詢多筆資料
	public List<Active> selectAll() {
		Query<Active> query = session.createQuery("From Active", Active.class);
		List<Active> list = query.list();
		return list;

	}

	// 更新
	public Active update(Active active) {
		Active result = session.get(Active.class, active.getActId());

		if (result == null) {
			session.saveOrUpdate(active);
			return active;
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
