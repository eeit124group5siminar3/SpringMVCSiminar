package recipe.DAO;

import org.hibernate.Session;
import org.hibernate.query.Query;
import java.util.List;

import recipe.recipe_bean.Recipe_Bean;

public class Recipe_DAO_hibernate {
	// 取得Session
	private Session session;
	private java.util.List<Recipe_Bean> list;

	public Recipe_DAO_hibernate() {

	}

	public Recipe_DAO_hibernate(Session session) {
		this.session = session;
	}

	public boolean insert(Recipe_Bean bean) {
		try {
			session.save(bean);
			System.out.println("insert success");

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return true;
	}

	public Recipe_Bean update(String rec_id, Recipe_Bean bean) {
		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);

		if (result != null) {

			session.update(bean);
		}

		return result;
	}

	public List<Recipe_Bean> listOfJavaBean() {
		session.beginTransaction();
		String hql="From Recipe_Bean";
		Query query=session.createQuery(hql);
//		Query<Recipe_Bean> query = session.createQuery("From Recipe_Bean", Recipe_Bean.class);
		List<Recipe_Bean> list = query.list();
		System.out.println(2);
		System.out.println(list);
		session.getTransaction().commit();
		return list;

	}

	public List<Recipe_Bean> ListOfSearch(String cate) {
		String hql = "From Recipe_Bean where category like '%雞%'or '%牛%'or'%豬%'or'%蔬%'  ";
		Query<Recipe_Bean> query = session.createQuery(hql);
		query.setParameter(0, cate);
		List<Recipe_Bean> list = query.list();

		return list;

	}

	public boolean delete(String rec_id) {

		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);
		if (result != null) {
			session.delete(result);
			return true;
		}

		return false;

//		String hql = "DELETE Person WHERE id = ?";  
//		 
//	    Query q = session.createQuery(hql);  
//	    q.setString(0, id);  
//	    //执行更新语句  
//	    q.executeUpdate();  
//	    //提交事务  
//	    tran.commit();  

	}

//	public List<Recipe_Bean> partSearch(Recipe_Bean rec_id){
//		String hql="From Recipe_Bean where rec_id=?";
//		return list;
//		
//	}

}
