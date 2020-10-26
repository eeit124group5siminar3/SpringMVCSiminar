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
		session.beginTransaction();
//		System.out.println("rec_id  DAO= "+rec_id);
//		Recipe_Bean result = session.get(Recipe_Bean.class,rec_id );
//		
//		if(result!=null) {
			bean.setRec_id(rec_id);
			System.out.println(bean.getName());
			session.update(bean);
//		}
			session.getTransaction().commit();
		return bean;
	}

	public List<Recipe_Bean> listOfJavaBean() {
		session.beginTransaction();
		String hql="From Recipe_Bean";
		Query query=session.createQuery(hql);
		List<Recipe_Bean> list = query.list();
//		session.getTransaction().commit();
		return list;

	}

	public List<Recipe_Bean> ListOfSearch(String cate) {
		String hql = "From Recipe_Bean where category like '%雞%'or '%牛%'or'%豬%'or'%蔬%'  ";
		Query<Recipe_Bean> query = session.createQuery(hql);
		query.setParameter(0, cate);
		List<Recipe_Bean> list = query.list();

		return list;

	}
	
	public List<Recipe_Bean> partSearch(String rec_id){
		session.beginTransaction();
		String hql="From Recipe_Bean where recipe_id=?0";
		Query<Recipe_Bean> query=session.createQuery(hql);
		query.setParameter(0, rec_id);
		List<Recipe_Bean> list=query.list();
		session.getTransaction().commit();
		return list;
		
	}

	public boolean delete(String rec_id) {
		session.beginTransaction();
		
//		System.out.println(2);
//		System.out.println(rec_id);
//		String hql = "delete Recipe_Bean where recipe_id = ?0";  
//		System.out.println(3);
//		Query query = session.createQuery(hql);  
//		query.setParameter(0, rec_id);
//		session.delete(rec_id);
//		session.getTransaction().commit();
		System.out.println(rec_id);
//		return true;
		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);
//		Recipe_Bean result = session.get(rec_id,Recipe_Bean.class);
		System.out.println(rec_id);
			if(result!=null) {
			session.delete(result);
			session.getTransaction().commit();
			return true;
		}
			return false;
		}
		
	}

