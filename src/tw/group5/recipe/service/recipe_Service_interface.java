package tw.group5.recipe.service;

import java.util.List;

import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Subscribe_Bean;

public interface recipe_Service_interface {

	boolean insert(Recipe_Bean bean);

	Recipe_Bean update(Integer rec_id, Recipe_Bean bean);

	List<Recipe_Bean> ListOfSearch(String cate);

	List<Recipe_Bean> partSearch(Integer rec_id);

	boolean delete(Integer rec_id);

	List<Recipe_Bean> listOfJavaBean();

	 List<Recipe_Bean> getAllImage();
	
	Bookmark_Bean bookmark(Bookmark_Bean bean);

	List<Bookmark_Bean> listOfBookmark(Integer mem_no);

	long getRecordCounts();

	List<Recipe_Bean> searchAllRecipe(Integer page, Integer showData);

	List<Bookmark_Bean> partSearchBookmark(Integer mem_no, Integer rec_id);

	boolean deleteBookmark(Integer id);

	boolean bookmarkExist(Integer rec_id, Integer mem_no);

	List<Recipe_Bean> searchMyRecipe(Integer page, Integer showData, Integer mem_no);

	long getMyRecipeCounts(Integer mem_no);

	public Recipe_Bean recipeBean(Integer rec_id);

	Blog_Bean insert(Blog_Bean bean);

	List<Blog_Bean> searchAllOfBlog();

	Blog_Bean blogBean(Integer id);

	List<Blog_Bean> getMemBlog(Integer mem_no);

	Blog_Bean updateBlog(Blog_Bean bean);

	long BlogMsgCounts(Integer blog_id);

	boolean deleteBlog(Integer blog_id);

	Msg_Blog_Bean insertMsg(Msg_Blog_Bean bean);

	boolean deleteMsg(Integer blog_id);

	List<Msg_Blog_Bean> searchMsg(Integer blog_id);

	List<Blog_Bean> searchPopular();

	List<Blog_Bean> searchPartOfBlog(String title);

	Member_Detail insertDetail(Member_Detail bean);

	Member_Detail updateDetail(Member_Detail bean);

	boolean deleteDetail(Integer mem_no);

	Member_Detail detailBean(Integer mem_no);

	List<Recipe_Bean> categoryList(String cate);

	long categoryCounts(String cate);

	List<Blog_Bean> categoryBlogList(String cate);

	long blogCateCounts(String cate);

	List<String> cateList();

	List<Member_Detail> memDetailList();

//	Subscribe_Bean insertSub(Subscribe_Bean bean);

//	boolean deleteSub(Integer id);

//	List<Subscribe_Bean> searchSub(Integer mem_no);


}