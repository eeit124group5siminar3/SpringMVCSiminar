package active.farmer.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class ActSignUpDAO {
	
	private Session session;
	
	
	public ActSignUpDAO(Session session) {
		this.session = session;
	}
	
	public ActSignUp insert(ActSignUp actSignUp) {
		ActSignUp result = session.get(ActSignUp.class, actSignUp.getActId());
		
		if (result == null) {
			session.save(actSignUp);
			return actSignUp;
		}
		return null;
	}
	
	
	public ActSignUp selectOne(int actId) {
		return session.get(ActSignUp.class, actId);
	}
	
	public List<ActSignUp> selectAll(){
		Query<ActSignUp> query = session.createNamedQuery("From ActSignUp", ActSignUp.class);
		List<ActSignUp>
		list = query.list();
		return list;
		
	}
	
	public ActSignUp update(ActSignUp actSignUp) {
		ActSignUp result = session.get(ActSignUp.class, actSignUp.getActId());
		
		if(result == null) {
			result.setSignStaDate(actSignUp.getSignStaDate());
			result.setSignStaTime(actSignUp.getSignStaTime());
			result.setSignEndDate(actSignUp.getSignEndDate());
			result.setSignEndTime(actSignUp.getSignEndTime());
			result.setActNum(actSignUp.getActNum());
			result.setSigStat(actSignUp.getSigStat());			
		}
		return null;
		
	}
	
	public boolean delete(int actId) {
		ActSignUp result = session.get(ActSignUp.class, actId);
		
		if(result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}
	

}
