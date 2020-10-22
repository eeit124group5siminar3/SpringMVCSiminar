package recipe.DAO;

import org.hibernate.Session;

import recipe.recipe_bean.Recipe_Bean;

public class Recipe_DAO_hibernate {
	//取得Session
	private Session session;
	public Recipe_DAO_hibernate(Session session) {
		this.session=session;
	}
	
	public Recipe_Bean insert(Recipe_Bean bean) {
		Recipe_Bean rb=null;
		Recipe_Bean insert=session.get(Recipe_Bean.class,bean.getRec_id());
		if(insert==null) {
			session.save(insert);
			
		}
		return rb;
	}
	
}
