package tw.group5.recipe.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.mall.model.ProductBean;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;

import java.util.List;

@Repository
public class Recipe_DAO_spring {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// Recipe_Servlet_insert
	public boolean insert(Recipe_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
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

	// Recipe_Servlet_update
	public Recipe_Bean update(String rec_id, Recipe_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		bean.setRec_id(rec_id);
		System.out.println(bean.getName());
		session.update(bean);
		return bean;
	}

	// 取得資料庫所有資料
	public List<Recipe_Bean> listOfJavaBean() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean order by views";
		Query query = session.createQuery(hql, Recipe_Bean.class);
		List<Recipe_Bean> list = query.list();
		return list;
	}
	
	public Recipe_Bean recipeBean(String rec_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean ";
		Recipe_Bean bean = session.get(Recipe_Bean.class, rec_id);
		return bean;
	}
	
	
	

	// 查詢某資料
	// Recipe_Servlet_search
	public List<Recipe_Bean_noImage> ListOfSearch(String name) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean_noImage where recipe_name like:name";
		Query<Recipe_Bean_noImage> query = session.createQuery(hql, Recipe_Bean_noImage.class);
		query.setParameter("name", name);
		List<Recipe_Bean_noImage> list = query.list();

		return list;

	}

	// Recipe_Servlet_update
	// 查詢使用者擁有食譜中,其中一筆資料
	public List<Recipe_Bean_noImage> partSearch(String rec_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean_noImage where recipe_id=?0";
		Query<Recipe_Bean_noImage> query = session.createQuery(hql, Recipe_Bean_noImage.class);
		query.setParameter(0, rec_id);

		List<Recipe_Bean_noImage> list = query.list();
		return list;

	}

	// Recipe_Servlet_delete
	public boolean delete(String rec_id) {
		Session session = sessionFactory.getCurrentSession();
		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	
	//取得圖片
	public Recipe_Bean getImage(String rec_id) {
		Session session = sessionFactory.getCurrentSession();
		Recipe_Bean bean = session.get(Recipe_Bean.class, rec_id);
		return bean;

	}

	// 食材連結到商城
	public List<ProductBean> getProducts(String searchString) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProductBean where stock != 0";
		Query<ProductBean> query = null;

		hql += " and product like ?0 ORDER BY ProductId";
		query = session.createQuery(hql, ProductBean.class);
		query.setParameter(0, "%" + searchString + "%");

		List<ProductBean> list = query.list();
		return list;
	}

	// Bookmark
	public Bookmark_Bean bookmark(Bookmark_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Bookmark_Bean where member_no=:mem_no and recipe_id=:rec_id";
		Query<Bookmark_Bean> query = session.createQuery(hql, Bookmark_Bean.class);
		query.setParameter("mem_no", bean.getMember_no());
		query.setParameter("rec_id", bean.getRec_id());
		List<Bookmark_Bean> list = query.list();
		System.out.println("enter insert process");
		session.save(bean);

		return bean;
	}

	// search bookmark
	public List<Bookmark_Bean> listOfBookmark(Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Bookmark_Bean where member_no=:mem_no order by member_no";
		Query<Bookmark_Bean> query = session.createQuery(hql, Bookmark_Bean.class);
		query.setParameter("mem_no", mem_no);
		List<Bookmark_Bean> list = query.list();
		return list;
	}
	
	public List<Bookmark_Bean> partSearchBookmark(Integer mem_no,String rec_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Bookmark_Bean where recipe_id=:rec_id and member_no=:mem_no";
		Query<Bookmark_Bean> query = session.createQuery(hql, Bookmark_Bean.class);
		query.setParameter("rec_id", rec_id);
		query.setParameter("mem_no", mem_no);

		List<Bookmark_Bean> list = query.list();
		return list;
	}
	
	//delete bookmark
	public boolean deleteBookmark(String id) {
		Session session = sessionFactory.getCurrentSession();
		Bookmark_Bean result = session.get(Bookmark_Bean.class, id);
		System.out.println(id);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}
	
	//比對是否已經加入我的最愛
	public boolean bookmarkExist(String rec_id,Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Bookmark_Bean where recipe_id=:rec_id and member_no=:mem_no";
		Query<Bookmark_Bean> query=session.createQuery(hql);
		query.setParameter("rec_id", rec_id);
		query.setParameter("mem_no", mem_no);
		List<Bookmark_Bean> list = query.list();
		for(Bookmark_Bean bean:list) {
			if(bean.getRec_id().equals(rec_id)) {
				return true;
			}else {
				return false;
			}
		}
		return false;
	}
	
	
	//---------------------blog--------------------------
	
	//新增資料
	public Blog_Bean insert(Blog_Bean bean) {
		Session session=sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
		
	}
	
	
	public Blog_Bean updateBlog(Blog_Bean bean) {
		Session session=sessionFactory.getCurrentSession();
		session.update(bean);
		return bean;
		
	}
	
	public boolean deleteBlog(Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
		Blog_Bean result = session.get(Blog_Bean.class, blog_id);
		if(result!=null) {
			session.delete(result);
			return true;
		}
		return false;
	}
	
	//搜尋全部資料
	public List<Blog_Bean> searchAllOfBlog() {
		Session session=sessionFactory.getCurrentSession();
		Query<Blog_Bean> query=session.createQuery("From Blog_Bean order by views",Blog_Bean.class);
		List<Blog_Bean> list=query.list();
		return list;
		
	}
	
	//搜尋某個會員資料
	public List<Blog_Bean> getMemBlog(Integer mem_no) {
		Session session=sessionFactory.getCurrentSession();
		Query<Blog_Bean> query=session.createQuery("From Blog_Bean where member_no=:mem_no order by blog_id DESC ",Blog_Bean.class);
		query.setParameter("mem_no", mem_no);
		List<Blog_Bean> list=query.list();
		return list;
		
	}
	
	//搜尋某一文章資料
	public Blog_Bean blogBean(Integer blog_id) {
		Session session=sessionFactory.getCurrentSession();
		System.out.println("enter blogbean");
		Blog_Bean bean = session.get(Blog_Bean.class, blog_id);
		return bean;
	}
	
	
	
	//文章留言
	public Msg_Blog_Bean insertMsg(Msg_Blog_Bean bean) {
		Session session=sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}
	
	public boolean deleteMsg(Integer blog_id) {
		Session session=sessionFactory.getCurrentSession();
		Msg_Blog_Bean result=session.get(Msg_Blog_Bean.class, blog_id);
		if(result!=null) {
			session.delete(blog_id);
			return true;
		}else {
			return false;
		}
	}
	
	//搜尋某一文章 全部回文
	public List<Msg_Blog_Bean> searchMsg(Integer blog_id){
		Session session=sessionFactory.getCurrentSession();
		Query<Msg_Blog_Bean> query=session.createQuery("From Msg_Blog_Bean where blog_id=:blog_id order by msg_date",Msg_Blog_Bean.class);
		query.setParameter("blog_id", blog_id);
		List<Msg_Blog_Bean> list=query.list();
		return list;
	}
	
	//搜尋文章 最高瀏覽
	public List<Blog_Bean> searchPopular(Integer num){
		Session session=sessionFactory.getCurrentSession();
		String hql="from Blog_Bean order by views where rownum<3";
		Query<Blog_Bean> query=session.createQuery(hql,Blog_Bean.class);
//		query.setParameter("num", num);
		List<Blog_Bean> list=query.list();
		return list;
	}
	
	
	//計算某一文章回文數
	public long BlogMsgCounts(Integer blog_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(*) from Msg_Blog_Bean where blog_id=:blog_id";
		Query<Long> query=session.createQuery(hql);
		query.setParameter("blog_id",blog_id);
		long counts=(Long) query.uniqueResult();
		
		System.out.println("countsssssssssssssssssss: "+counts);
		return (int) counts;
	}
	
	
	
	
	//-------------------取得分頁------------------------
	
//	public final Integer RECORDS_PER_PAGE=5;
	
//	private Integer pageNo=-1;
//	private Integer maintainPageNo=0;
	//每頁顯示幾筆資料
//	private Integer recordsPerPage=RECORDS_PER_PAGE; 
//	private Integer totalPages=-1;
//	private Integer totalPageWithSearch=-1;
//	private String searchString;
	
	
	//計算總共幾頁  	//首頁分頁
//	public Integer getTotalPages() {
//		totalPages=(int) Math.ceil(getRecordCounts()/(double)recordsPerPage);
//		return totalPages;
//	}
	
	
	
	//計算Search的總page
//	public Integer getTotalPageWithSearch() {
//		totalPageWithSearch=(int) Math.ceil(getRecordCounts()/(double)recordsPerPage);
//		return totalPageWithSearch;
//	}
	

	
	
//	public Integer getPageNo() {
//		return pageNo;
//	}
//
//	public void setPageNo(Integer pageNo) {
//		this.pageNo = pageNo;
//	}

//	public Integer getMaintainPageNo() {
//		return maintainPageNo;
//	}
//
//	public void setMaintainPageNo(Integer maintainPageNo) {
//		this.maintainPageNo = maintainPageNo;
//	}

//	public String getSearchString() {
//		return searchString;
//	}
//
//	public void setSearchString(String searchString) {
//		this.searchString = searchString;
//	}

	//total
	public long getRecordCounts() {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(*) from Recipe_Bean";
		Query<Long> query = session.createQuery(hql);
		long count=(long) query.uniqueResult();
//		long longNumber = (long) getNumber;
//		Integer count=(int) longNumber;
		return (int) count;
	}
	
	//首頁分頁
	public List<Recipe_Bean_noImage> searchAllRecipe(Integer page,Integer showData){
		if(page==null) {
			page=1;
		}
		if(showData==null) {
			showData=2;
		}
		Session session=sessionFactory.getCurrentSession();
		Integer startPosition=(page-1)*showData; 
		Query<Recipe_Bean_noImage> query=session.createQuery("from Recipe_Bean_noImage",Recipe_Bean_noImage.class);
		List<Recipe_Bean_noImage> list=query.setFirstResult(startPosition)
				.setMaxResults(showData)
				.setReadOnly(true)
				.getResultList();
		return list;
	}
	
	
	//上傳食譜分頁
	public long getMyRecipeCounts(Integer mem_no) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(*) from Recipe_Bean where member_no=:mem_no";
		Query<Long> query = session.createQuery(hql);
		query.setParameter("mem_no", mem_no);
		long count=(long) query.uniqueResult();
//		long longNumber = (long) getNumber;
//		Integer count=(int) longNumber;
		System.out.println("計算總比數      DAOOOOOOOOOOOOOOOOOOOO");
		System.out.println( (int) count);
		return (int) count;
	}
	
	public List<Recipe_Bean> searchMyRecipe(Integer page,Integer showData,Integer mem_no){
		if(page==null) {
			page=1;
		}
		if(showData==null) {
			showData=2;
		}
		Session session=sessionFactory.getCurrentSession();
		Integer startPosition=(page-1)*showData; 
		String hql="from Recipe_Bean where member_no=:mem_no";
		Query<Recipe_Bean> query=session.createQuery(hql,Recipe_Bean.class);
		query.setParameter("mem_no", mem_no);
		List<Recipe_Bean> list=query.setFirstResult(startPosition)
				.setMaxResults(showData)
				.setReadOnly(true)
				.getResultList();
		return list;
	}
}
