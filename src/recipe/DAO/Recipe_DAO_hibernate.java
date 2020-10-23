package recipe.DAO;

import org.hibernate.Session;

import recipe.recipe_bean.Recipe_Bean;

public class Recipe_DAO_hibernate {
	//取得Session
	private Session session;
	public Recipe_DAO_hibernate() {
		
	}
	public Recipe_DAO_hibernate(Session session) {
		this.session=session;
	}
	
	public boolean insert(Recipe_Bean bean) {
		try {
			session.save(bean);
			
		}catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return true;
	}
	
//	public 
	
	
	
	
	
	
}
