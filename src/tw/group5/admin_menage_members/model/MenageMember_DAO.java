package tw.group5.admin_menage_members.model;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("menageMemberDao")
public class MenageMember_DAO {

	private SessionFactory sessionFactory;
	
	
	// 連線DB
	@Autowired
	public MenageMember_DAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	
	
	
	
	
}
