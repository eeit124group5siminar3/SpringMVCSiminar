package tw.group5.recipe.service;

import java.util.List;

import tw.group5.mall.model.ProductBean;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;

public interface recipe_Service_interface {

	boolean insert(Recipe_Bean bean);

	Recipe_Bean update(String rec_id, Recipe_Bean bean);

	List<Recipe_Bean_noImage> ListOfSearch(String cate);

	List<Recipe_Bean_noImage> partSearch(String rec_id);

	boolean delete(String rec_id);

	List<Recipe_Bean> listOfJavaBean();

	Recipe_Bean getImage(String rec_id);
	
	List<ProductBean> getProducts(String searchString);

	Bookmark_Bean bookmark(Bookmark_Bean bean);

	List<Bookmark_Bean> listOfBookmark(Integer mem_no);

	long getRecordCounts();

	List<Recipe_Bean_noImage> searchAllRecipe(Integer page, Integer showData);

//	Integer getTotalPages();

//	void setPageNo(Integer pageNo);

	List<Bookmark_Bean> partSearchBookmark(Integer mem_no, String rec_id);

	boolean deleteBookmark(String id);

	boolean bookmarkExist(String rec_id, Integer mem_no);

	List<Recipe_Bean> searchMyRecipe(Integer page, Integer showData, Integer mem_no);

	long getMyRecipeCounts(Integer mem_no);

	Recipe_Bean recipeBean(String rec_id);

	Blog_Bean insert(Blog_Bean bean);

	List<Blog_Bean> searchAllOfBlog();

	Blog_Bean blogBean(Integer id);

	List<Blog_Bean> getMemBlog(Integer mem_no);

	Blog_Bean updateBlog(Blog_Bean bean);

	long BlogIdMsg(Integer blog_id);

	boolean deleteBlog(Integer blog_id);

}