package tw.group5.recipe.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.mall.model.ProductBean;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;

import java.util.List;

@Repository
public class Recipe_DAO_spring {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

//	public Recipe_DAO_spring() {
//
//	}

//	public Recipe_DAO_hibernate(Session session) {
//		this.session = session;
//	}

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
//			session.beginTransaction();
		bean.setRec_id(rec_id);
		System.out.println(bean.getName());
		session.update(bean);

//			session.getTransaction().commit();
		return bean;
	}

	// 取得資料庫所有資料
	public List<Recipe_Bean> listOfJavaBean() {
		Session session = sessionFactory.getCurrentSession();
//		session.beginTransaction();
		String hql = "From Recipe_Bean order by member_no";
		Query query = session.createQuery(hql, Recipe_Bean.class);
		List<Recipe_Bean> list = query.list();
//		session.getTransaction().commit();
		return list;

	}

	// 查詢某資料
	// Recipe_Servlet_search
	public List<Recipe_Bean_noImage> ListOfSearch(String name) {
		Session session = sessionFactory.getCurrentSession();
//		session.beginTransaction();
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
//		session.beginTransaction();
		String hql = "From Recipe_Bean_noImage where recipe_id=?0";
		Query<Recipe_Bean_noImage> query = session.createQuery(hql, Recipe_Bean_noImage.class);
		query.setParameter(0, rec_id);

		List<Recipe_Bean_noImage> list = query.list();
//		session.getTransaction().commit();
		return list;

	}

	// Recipe_Servlet_delete
	public boolean delete(String rec_id) {
		Session session = sessionFactory.getCurrentSession();
//		session.beginTransaction();
		Recipe_Bean result = session.get(Recipe_Bean.class, rec_id);
		if (result != null) {
			session.delete(result);
//			session.getTransaction().commit();
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
		
//		Bookmark_Bean result = session.get(Bookmark_Bean.class, rec_id);
//		if(result!=null) {
//			return true;
//		}
//		return false;
	}
	
	
	//-------------------取得分頁------------------------
	
	public final Integer RECORDS_PER_PAGE=5;
	
	private Integer pageNo=-1;
	private Integer maintainPageNo=0;
	//每頁顯示幾筆資料
	private Integer recordsPerPage=RECORDS_PER_PAGE; 
	private Integer totalPages=-1;
	private Integer totalPageWithSearch=-1;
	private String searchString;
	
	//計算總共幾頁
	public Integer getTotalPages() {
		totalPages=(int) Math.ceil(getRecordCounts()/(double)recordsPerPage);
		return totalPages;
	}
	
	//計算Search的總page
	public Integer getTotalPageWithSearch() {
		totalPageWithSearch=(int) Math.ceil(getRecordCounts()/(double)recordsPerPage);
		return totalPageWithSearch;
	}
	

	
	
	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getMaintainPageNo() {
		return maintainPageNo;
	}

	public void setMaintainPageNo(Integer maintainPageNo) {
		this.maintainPageNo = maintainPageNo;
	}

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
}
