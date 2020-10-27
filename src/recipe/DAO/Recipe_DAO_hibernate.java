package recipe.DAO;

import org.hibernate.Session;
import org.hibernate.query.Query;

import active.farmer.model.ActiveFarmer;

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

	//Recipe_Servlet_insert
	public boolean insert(Recipe_Bean bean) {
		try {
			System.out.println(bean.getRec_id());
			session.save(bean);
			System.out.println("insert success");

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return true;
	}

	//Recipe_Servlet_update
	public Recipe_Bean update(String rec_id, Recipe_Bean bean) {
			session.beginTransaction();
			bean.setRec_id(rec_id);
			System.out.println(bean.getName());
			session.update(bean);

			session.getTransaction().commit();
		return bean;
	}

	//取得資料庫所有資料
	public List<Recipe_Bean> listOfJavaBean() {
		session.beginTransaction();
		String hql="From Recipe_Bean";
		Query query=session.createQuery(hql);
		List<Recipe_Bean> list = query.list();
//		session.getTransaction().commit();
		return list;

	}

	//查詢某資料
	//Recipe_Servlet_search
	public List<Recipe_Bean> ListOfSearch(String cate) {
		session.beginTransaction();
		String hql = "From Recipe_Bean where category =?0 ";
		Query<Recipe_Bean> query = session.createQuery(hql);
		query.setParameter(0, cate);
		List<Recipe_Bean> list = query.list();

		return list;

	}
	
	//Recipe_Servlet_update
	//查詢使用者擁有食譜中,其中一筆資料
	public List<Recipe_Bean> partSearch(String rec_id){
		session.beginTransaction();
		String hql="From Recipe_Bean where recipe_id=?0";
		Query<Recipe_Bean> query=session.createQuery(hql);
		query.setParameter(0, rec_id);
		
		List<Recipe_Bean> list=query.list();
//		session.getTransaction().commit();
		return list;
		
	}

	//Recipe_Servlet_delete
	public boolean delete(String rec_id) {
		session.beginTransaction();
		System.out.println(rec_id);
		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);
		System.out.println(rec_id);
			if(result!=null) {
			session.delete(result);
			session.getTransaction().commit();
			return true;
		}
			return false;
		}
		
	}

