package tw.group5.recipe.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
//import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
//import tw.group5.recipe.recipe_Bean.Subscribe_Bean;

import java.util.List;

@Repository
public class Recipe_DAO_spring {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public boolean insert(Recipe_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(bean);
			System.out.println("insert success");
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return true;
	}

	public Recipe_Bean update(Integer rec_id, Recipe_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		bean.setRec_id(rec_id);
		System.out.println(bean.getName());
		session.update(bean);
		return bean;
	}

	public boolean delete(Integer rec_id) {
		Session session = sessionFactory.getCurrentSession();
		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	// 模糊查詢某資料
	public List<Recipe_Bean> ListOfSearch(String name) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean where recipe_name like:name";
		Query<Recipe_Bean> query = session.createQuery(hql, Recipe_Bean.class);
		query.setParameter("name", name);
		List<Recipe_Bean> list = query.list();

		return list;

	}

	// 取得資料庫所有資料
	public List<Recipe_Bean> listOfJavaBean() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean order by recipe_id desc";
		Query<Recipe_Bean> query = session.createQuery(hql, Recipe_Bean.class);
		List<Recipe_Bean> list = query.list();
		return list;
	}

	// 取得某rec_id 資料
	public Recipe_Bean recipeBean(Integer rec_id) {
		Session session = sessionFactory.getCurrentSession();
		Recipe_Bean bean = session.get(Recipe_Bean.class, rec_id);
		return bean;
	}

	// 查詢使用者擁有食譜中,其中一筆資料
	public List<Recipe_Bean> partSearch(Integer rec_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean where recipe_id=?0";
		Query<Recipe_Bean> query = session.createQuery(hql, Recipe_Bean.class);
		query.setParameter(0, rec_id);

		List<Recipe_Bean> list = query.list();
		return list;

	}

	// 取得圖片
	public List<Recipe_Bean> getAllImage() {
		Session session = sessionFactory.getCurrentSession();
		Query<Recipe_Bean> query = session.createQuery("From Recipe_Bean order by recipe_id DESC", Recipe_Bean.class);
		List<Recipe_Bean> list = query.list();
		return list;
	}

	// 文章分類
	public List<Recipe_Bean> categoryList(String cate) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Recipe_Bean where category=:cate order by recipe_id desc";
		Query<Recipe_Bean> query = session.createQuery(hql, Recipe_Bean.class);
		query.setParameter("cate", cate);
		List<Recipe_Bean> list = query.list();
		return list;
	}

	// 文章分類個數
	public long categoryCounts(String cate) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Recipe_Bean where category=:cate";
		Query<Long> query = session.createQuery(hql);
		query.setParameter("cate", cate);
		long counts = query.uniqueResult();
		return (int) counts;
	}

	// --------------------訂閱某作者--------------------------
	
//	public Subscribe_Bean insertSub(Subscribe_Bean bean) {
//		Session session = sessionFactory.getCurrentSession();
//		session.save(bean);
//		return bean;
//	}
//
//	public boolean deleteSub(Integer id) {
//		Session session = sessionFactory.getCurrentSession();
//		Subscribe_Bean result=session.get(Subscribe_Bean.class, id);
//			if (result != null) {
//				session.delete(result);
//				return true;
//			}
//			return false;
//	}
//	
//	public List<Subscribe_Bean> searchSub(Integer mem_no) {
//		Session session = sessionFactory.getCurrentSession();
//		String hql="from Subscribe_Bean where member_no=:mem_no";
//		Query<Subscribe_Bean> query=session.createQuery(hql,Subscribe_Bean.class);
//		query.setParameter("mem_no", mem_no);
//		List<Subscribe_Bean> list=query.list();
//		return list;
//		
//	}

	// ------------------------個人資料---------------------------

	public Member_Detail insertDetail(Member_Detail bean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;

	}

	public Member_Detail updateDetail(Member_Detail bean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(bean);
		return bean;

	}

	public boolean deleteDetail(Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		Member_Detail result = session.get(Member_Detail.class, mem_no);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	// 搜尋個人資料
	public Member_Detail detailBean(Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		Member_Detail bean = session.get(Member_Detail.class, mem_no);
		return bean;
	}

	// -----------------------Bookmark------------------------

	public Bookmark_Bean bookmark(Bookmark_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
//		String hql = "From Bookmark_Bean where member_no=:mem_no and recipe_id=:rec_id";
//		Query<Bookmark_Bean> query = session.createQuery(hql, Bookmark_Bean.class);
//		query.setParameter("mem_no", bean.getMember_no());
//		query.setParameter("rec_id", bean.getRec_id());
//		System.out.println("enter insert process");
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

	public List<Bookmark_Bean> partSearchBookmark(Integer mem_no, Integer rec_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Bookmark_Bean where recipe_id=:rec_id and member_no=:mem_no";
		Query<Bookmark_Bean> query = session.createQuery(hql, Bookmark_Bean.class);
		query.setParameter("rec_id", rec_id);
		query.setParameter("mem_no", mem_no);

		List<Bookmark_Bean> list = query.list();
		return list;
	}

	// delete bookmark
	public boolean deleteBookmark(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Bookmark_Bean result = session.get(Bookmark_Bean.class, id);
		System.out.println(id);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	// 比對是否已經加入我的最愛
	public boolean bookmarkExist(Integer rec_id, Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Bookmark_Bean where recipe_id=:rec_id and member_no=:mem_no";
		Query<Bookmark_Bean> query = session.createQuery(hql);
		query.setParameter("rec_id", rec_id);
		query.setParameter("mem_no", mem_no);
		List<Bookmark_Bean> list = query.list();
		for (Bookmark_Bean bean : list) {
			if (bean.getRec_id().equals(rec_id)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	// ---------------------blog--------------------------

	// 新增資料 blog
	public Blog_Bean insert(Blog_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;

	}

	public Blog_Bean updateBlog(Blog_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(bean);
		return bean;

	}

	public boolean deleteBlog(Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
		Blog_Bean result = session.get(Blog_Bean.class, blog_id);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	// 搜尋全部資料
	public List<Blog_Bean> searchAllOfBlog() {
		Session session = sessionFactory.getCurrentSession();
		Query<Blog_Bean> query = session.createQuery("From Blog_Bean order by blog_id DESC", Blog_Bean.class);
		List<Blog_Bean> list = query.list();
		return list;

	}

	// 模糊查詢
	public List<Blog_Bean> searchPartOfBlog(String title) {
		Session session = sessionFactory.getCurrentSession();
		Query<Blog_Bean> query = session.createQuery("From Blog_Bean where title like:title order by blog_id DESC",
				Blog_Bean.class);
		System.out.println("title: " + title);
		query.setParameter("title", title);
		List<Blog_Bean> list = query.list();
		return list;

	}

	// 搜尋某個會員資料
	public List<Blog_Bean> getMemBlog(Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		Query<Blog_Bean> query = session.createQuery("From Blog_Bean where member_no=:mem_no order by blog_id DESC ",
				Blog_Bean.class);
		query.setParameter("mem_no", mem_no);
		List<Blog_Bean> list = query.list();
		return list;

	}

	// 搜尋某一文章資料
	public Blog_Bean blogBean(Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("enter blogbean");
		Blog_Bean bean = session.get(Blog_Bean.class, blog_id);
		return bean;
	}

	// 文章留言
	public Msg_Blog_Bean insertMsg(Msg_Blog_Bean bean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	public boolean deleteMsg(Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
		Msg_Blog_Bean result = session.get(Msg_Blog_Bean.class, blog_id);
		if (result != null) {
			session.delete(blog_id);
			return true;
		} else {
			return false;
		}
	}

	// 搜尋某一文章 全部回文
	public List<Msg_Blog_Bean> searchMsg(Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
		Query<Msg_Blog_Bean> query = session.createQuery("From Msg_Blog_Bean where blog_id=:blog_id order by msg_date",
				Msg_Blog_Bean.class);
		query.setParameter("blog_id", blog_id);
		List<Msg_Blog_Bean> list = query.list();
		return list;
	}

	// 依照日期排序
	public List<Blog_Bean> searchPopular() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Blog_Bean where status=1 order by blog_id DESC";
		Query<Blog_Bean> query = session.createQuery(hql, Blog_Bean.class);
		List<Blog_Bean> list = query.list();
		return list;
	}

	// 計算某一文章回文數
	public long BlogMsgCounts(Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Msg_Blog_Bean where blog_id=:blog_id";
		Query<Long> query = session.createQuery(hql);
		query.setParameter("blog_id", blog_id);
		long counts = (Long) query.uniqueResult();

		System.out.println("countsssssssssssssssssss: " + counts);
		return (int) counts;
	}

	// 部落格分類
	public List<Blog_Bean> categoryBlogList(String cate) {
		Session session = sessionFactory.getCurrentSession();
		Query<Blog_Bean> query = session.createQuery(
				"From Blog_Bean where category like:cate and status=1 order by blog_id DESC", Blog_Bean.class);
		query.setParameter("cate", cate);
		List<Blog_Bean> list = query.list();
		return list;
	}

	public long blogCateCounts(String cate) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Blog_Bean where category=:cate and status=1";
		Query<Long> query = session.createQuery(hql);
		query.setParameter("cate", cate);
		long counts = query.uniqueResult();
		return (int) counts;
	}

	// status=1 取得種類
	public List<String> cateList() {
		Session session = sessionFactory.getCurrentSession();
		Query<String> query = session.createQuery("select cate from Blog_Bean group by category");
		List<String> list = query.list();
		return list;
	}

	// -------------------取得分頁------------------------

//	public final Integer RECORDS_PER_PAGE=5;

//	private Integer pageNo=-1;
//	private Integer maintainPageNo=0;
	// 每頁顯示幾筆資料
//	private Integer recordsPerPage=RECORDS_PER_PAGE; 
//	private Integer totalPages=-1;
//	private Integer totalPageWithSearch=-1;
//	private String searchString;

	// 計算總共幾頁 //首頁分頁
//	public Integer getTotalPages() {
//		totalPages=(int) Math.ceil(getRecordCounts()/(double)recordsPerPage);
//		return totalPages;
//	}

	// 計算Search的總page
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

	// total
	public long getRecordCounts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Recipe_Bean";
		Query<Long> query = session.createQuery(hql);
		long count = (long) query.uniqueResult();
//		long longNumber = (long) getNumber;
//		Integer count=(int) longNumber;
		return (int) count;
	}

	// 首頁分頁
	public List<Recipe_Bean> searchAllRecipe(Integer page, Integer showData) {
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 6;
		}
		Session session = sessionFactory.getCurrentSession();
		Integer startPosition = (page - 1) * showData;
		Query<Recipe_Bean> query = session.createQuery("from Recipe_Bean order by recipe_id desc", Recipe_Bean.class);
		List<Recipe_Bean> list = query.setFirstResult(startPosition).setMaxResults(showData).setReadOnly(true)
				.getResultList();
		return list;
	}

	// 上傳食譜分頁
	public long getMyRecipeCounts(Integer mem_no) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Recipe_Bean where member_no=:mem_no";
		Query<Long> query = session.createQuery(hql);
		query.setParameter("mem_no", mem_no);
		long count = (long) query.uniqueResult();
//		long longNumber = (long) getNumber;
//		Integer count=(int) longNumber;
		System.out.println("計算總比數      DAOOOOOOOOOOOOOOOOOOOO");
		System.out.println((int) count);
		return (int) count;
	}

	public List<Recipe_Bean> searchMyRecipe(Integer page, Integer showData, Integer mem_no) {
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 2;
		}
		Session session = sessionFactory.getCurrentSession();
		Integer startPosition = (page - 1) * showData;
		String hql = "from Recipe_Bean where member_no=:mem_no";
		Query<Recipe_Bean> query = session.createQuery(hql, Recipe_Bean.class);
		query.setParameter("mem_no", mem_no);
		List<Recipe_Bean> list = query.setFirstResult(startPosition).setMaxResults(showData).setReadOnly(true)
				.getResultList();
		return list;
	}
}
