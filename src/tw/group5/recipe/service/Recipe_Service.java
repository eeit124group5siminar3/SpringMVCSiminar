package tw.group5.recipe.service;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.recipe.DAO.Recipe_DAO_spring;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
//import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
import tw.group5.recipe.recipe_Bean.Subscribe_Bean;

@Service
public class Recipe_Service implements recipe_Service_interface {
	
	@Autowired
	private Recipe_DAO_spring rDAO;
	
	@Override
	public boolean insert(Recipe_Bean bean) {
		return rDAO.insert(bean);
	}
	
	@Override
	public Recipe_Bean update(Integer rec_id, Recipe_Bean bean) {
		return rDAO.update(rec_id, bean);
	}
	
//	------------------------noimage------------------------------
	@Override
	public List<Recipe_Bean> ListOfSearch(String name) {
		return rDAO.ListOfSearch(name);
	}
	
	@Override
	public List<Recipe_Bean> partSearch(Integer rec_id){
		return rDAO.partSearch(rec_id);
		
	}
	//----------------------------------------------------------
	
	@Override
	public boolean delete(Integer rec_id) {
		return rDAO.delete(rec_id);
	}
	
	@Override
	public List<Recipe_Bean> listOfJavaBean(){
		return rDAO.listOfJavaBean();
	}
	
	@Override
	public List<Recipe_Bean> getAllImage() {
		return rDAO.getAllImage();
	}
	
	@Override
	public Bookmark_Bean bookmark(Bookmark_Bean bean){
		return rDAO.bookmark(bean);
	}
	
	@Override
	public List<Bookmark_Bean> listOfBookmark(Integer mem_no){
		return rDAO.listOfBookmark(mem_no);
	}

	@Override
	public boolean deleteBookmark(Integer id) {
		return rDAO.deleteBookmark(id);
	}
	
	@Override
	public List<Bookmark_Bean> partSearchBookmark(Integer mem_no,Integer rec_id) {
		return rDAO.partSearchBookmark(mem_no, rec_id);
	}
	
	@Override
	public boolean bookmarkExist(Integer rec_id,Integer mem_no) {
		return rDAO.bookmarkExist(rec_id,mem_no);
	}
	
	@Override
	public Recipe_Bean recipeBean(Integer rec_id) {
		return rDAO.recipeBean(rec_id);
	}
	
	@Override
	public List<Recipe_Bean> categoryList(String cate){
		return rDAO.categoryList(cate);
	}
	
	@Override
	public long categoryCounts(String cate) {
		return rDAO.categoryCounts(cate);
	}
	
	//個人資料
	@Override
	public Member_Detail insertDetail(Member_Detail bean) {
		return rDAO.insertDetail(bean);

	}

	@Override
	public Member_Detail updateDetail(Member_Detail bean) {
		return rDAO.updateDetail(bean);
	}

	@Override
	public boolean deleteDetail(Integer mem_no) {
		return rDAO.deleteDetail(mem_no);
	}

	@Override
	public Member_Detail detailBean(Integer mem_no) {
		return rDAO.detailBean(mem_no);
	}

	
	//--------------blog------------------------------
	@Override
	public Blog_Bean insert(Blog_Bean bean) {
		return rDAO.insert(bean);
	}
	
	@Override
	public Blog_Bean updateBlog(Blog_Bean bean) {
		return rDAO.updateBlog(bean);
	}
	
	@Override
	public List<Blog_Bean> searchAllOfBlog() {
		return rDAO.searchAllOfBlog();
	}
	
	@Override
	public List<Blog_Bean> searchPartOfBlog(String title) {
		return rDAO.searchPartOfBlog(title);
	}
	
	@Override
	public Blog_Bean blogBean(Integer blog_id) {
		return rDAO.blogBean(blog_id);
	}
	
	@Override
	public List<Blog_Bean> getMemBlog(Integer mem_no) {
		return rDAO.getMemBlog(mem_no);
	}
	
	@Override
	public long BlogMsgCounts(Integer blog_id) {
		return rDAO.BlogMsgCounts(blog_id);
	}
	
	@Override
	public boolean deleteBlog(Integer blog_id) {
		return rDAO.deleteBlog(blog_id);
	}
	
	@Override
	public Msg_Blog_Bean insertMsg(Msg_Blog_Bean bean) {
		return rDAO.insertMsg(bean);
	}
	
	@Override
	public boolean deleteMsg(Integer blog_id) {
		return rDAO.deleteMsg(blog_id);
	}
	
	@Override
	public List<Msg_Blog_Bean> searchMsg(Integer blog_id){
		return rDAO.searchMsg(blog_id);
	}

	@Override
	public List<Blog_Bean> searchPopular(){
		return rDAO.searchPopular();
	}
	
	@Override
	public List<Blog_Bean> categoryBlogList(String cate){
		return rDAO.categoryBlogList(cate);
	}
	
	@Override
	public long blogCateCounts(String cate) {
		return rDAO.blogCateCounts(cate);
	}
	
	@Override
	public List<String> cateList(){
		return rDAO.cateList();
	}

	@Override
	public Subscribe_Bean insertSub(Subscribe_Bean bean) {
		return rDAO.insertSub(bean);
	}
	
	@Override
	public boolean deleteSub(Integer id) {
		return rDAO.deleteSub(id);
	}
	
	@Override
	public List<Subscribe_Bean> searchSub(Integer mem_no) {
		return rDAO.searchSub(mem_no);
	}
	
	//----------------------首頁分頁--------------------------------
	@Override
	public long getRecordCounts() {
		return rDAO.getRecordCounts();
		
	}
	
	@Override
	public List<Recipe_Bean> searchAllRecipe(Integer page,Integer showData){
		return rDAO.searchAllRecipe(page, showData);
	}
	
//	@Override
//	public Integer getTotalPages() {
//		return rDAO.getTotalPages();
//	}
	
//	@Override
//	public void setPageNo(Integer pageNo) {
//		rDAO.setPageNo(pageNo);
//	}
	
	
//  -----------------------修改食譜分頁-----------------------------
	@Override
	public List<Recipe_Bean> searchMyRecipe(Integer page,Integer showData,Integer mem_no){
		return rDAO.searchMyRecipe(page, showData, mem_no);
	}
	
	@Override
	public long getMyRecipeCounts(Integer mem_no) {
		return rDAO.getMyRecipeCounts(mem_no);
	}
	
}
