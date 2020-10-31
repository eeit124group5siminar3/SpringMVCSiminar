package tw.group5.recipe.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.sql.Update;

import tw.group5.recipe.DAO.Recipe_DAO_hibernate;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;

public class Recipe_Service implements recipe_Service_interface {
	private Recipe_DAO_hibernate rDAO;
	
	public Recipe_Service(Session session) {
		rDAO=new Recipe_DAO_hibernate(session);
	}
	
	@Override
	//因為資料庫沒有設定自動新增所有會有問題
	public boolean insert(Recipe_Bean bean) {
		return rDAO.insert(bean);
	}
	
	@Override
	public Recipe_Bean update(String rec_id, Recipe_Bean bean) {
		return rDAO.update(rec_id, bean);
	}
	
	@Override
	public List<Recipe_Bean> ListOfSearch(String cate) {
		return rDAO.ListOfSearch(cate);
	}
	
	@Override
	public List<Recipe_Bean> partSearch(String rec_id){
		return rDAO.partSearch(rec_id);
		
	}
	
	@Override
	public boolean delete(String rec_id) {
		return rDAO.delete(rec_id);
	}
	
	@Override
	public List<Recipe_Bean> listOfJavaBean(){
		return rDAO.listOfJavaBean();
	}

	
}
