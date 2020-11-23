package tw.group5.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.mall.model.ProductBean;
import tw.group5.recipe.DAO.Recipe_DAO_spring;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;

@Service
public class Recipe_Service implements recipe_Service_interface {
	@Autowired
	private Recipe_DAO_spring rDAO;
	
//	public Recipe_Service(Session session) {
//		rDAO=new Recipe_DAO_hibernate(session);
//	}
	
	@Override
	public boolean insert(Recipe_Bean bean) {
		return rDAO.insert(bean);
	}
	
	@Override
	public Recipe_Bean update(String rec_id, Recipe_Bean bean) {
		return rDAO.update(rec_id, bean);
	}
	
	@Override
	public List<Recipe_Bean_noImage> ListOfSearch(String cate) {
		return rDAO.ListOfSearch(cate);
	}
	
	@Override
	public List<Recipe_Bean_noImage> partSearch(String rec_id){
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
	
	@Override
	public Recipe_Bean getImage(String rec_id) {
		return rDAO.getImage(rec_id);
	}
	
	@Override
	public List<ProductBean> getProducts(String searchString) {
		return rDAO.getProducts(searchString);
	}
	
}
