package recipe.service;

import java.util.List;

import recipe.recipe_bean.Recipe_Bean;

public interface recipe_Service_interface {

	boolean insert(Recipe_Bean bean);

	Recipe_Bean update(String rec_id, Recipe_Bean bean);

	List<Recipe_Bean> ListOfSearch(String cate);

	List<Recipe_Bean> partSearch(String rec_id);

	boolean delete(String rec_id);

	List<Recipe_Bean> listOfJavaBean();

}