package tw.group5.active.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.Clock;



@Repository
public class ActFarmerDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

//=========================取得分頁==========================================

	// 抓分頁
	public final Integer RECORDS_PER_PAGE = 3;
	
	private Integer pageNo = 1;// 存放目前顯示之頁面的編號
	private Integer maintainPageNo = 0;
	private Integer recordsPerPage = RECORDS_PER_PAGE; // 每頁抓RECORDS_PER_PAGE
	private Integer totalPages = -1;
	private Integer totalPageWithSearch =-1;
	private String searchString;
	private String actType;

	
	private Integer actId = 0;

	
	//計算總共有幾頁
	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}
	
	//計算該廠商總共有幾頁
	public Integer getTotalPages(Integer sellerId) {
		totalPages = (int) (Math.ceil(getRecordCounts(sellerId) / (double) recordsPerPage));
		return totalPages;
	}
	
	//計算Search的總page
	public Integer getTotalPageWithSearch() {
		totalPageWithSearch = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
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
	
	public Integer getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(Integer recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}


	public Integer getActId() {
		return actId;
	}

	public void setActId(Integer actId) {
		this.actId = actId;
	}
	
	
	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	//計算所有活動的筆數
	public long getRecordCounts() {
		//hibernate Session
		Session session = sessionFactory.getCurrentSession();
		Integer count = 0; //必須使用long型態
		String hql = "select count(*) from ActFarmer";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}
	
	//計算該廠商擁有的活動總筆數
	public long getRecordCounts(Integer sellerId) {
		//hibernate Session
		Session session = sessionFactory.getCurrentSession();
		Integer count = 0; //必須使用long型態
		String hql = "select count(*) from ActFarmer where sellerId=?0";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		query.setParameter(0, sellerId);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}
	
//	public long getRecordCountScarch() {
//		Session session = sessionFactory.getCurrentSession();
//		Integer count = 0;
//		String hql = "select count(*) from ActFarmer";
//		Query<Long> query = null;
//		if(searchString == null) {
//			if(actName== null) {
//				query = session.createQuery(hql, java.lang.Long.class);
//			}else {
//				hql += " where actType=?0";
//				query = session.createQuery(hql, java.lang.Long.class);
//				query.setParameter(0, actType);
//			}
//		}else {
//			if(actType == null) {
//				hql += " where actType like ?0";
//				query = session.createQuery(hql, java.lang.Long.class);
//				query.setParameter(0, actType);
//			}
//		}
//		
//	}
	
	
	
	
//=========================CRUD==========================================

	//查詢一頁面活動
	public List<ActFarmer> getPageActFarmers(){
		Session session = sessionFactory.getCurrentSession();
		
		Integer startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ActFarmer ORDER BY actId";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(3);
		List<ActFarmer> list = query.list();
		return list;
	}
	
	//查詢某一廠商某頁面活動
	public List<ActFarmer> getPageActFarmers(Integer sellerId){
		Session session = sessionFactory.getCurrentSession();
		Integer startRecordNo = (maintainPageNo - 1) * recordsPerPage;
		String hql = "from ActFarmer where sellerId =?0 ORDER BY actId";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setParameter(0, sellerId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(recordsPerPage);
		if(query.getResultList().size() == 0) {
			return null;
		}else {
		List<ActFarmer> list = query.list();
		return list;
		}
	}
	

	
	//查詢該廠商的所有列表
	public List<ActFarmer> getActFarmers(Integer sellerId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActFarmer where sellerId =?0 ORDER BY actId";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setParameter(0, sellerId);
		List<ActFarmer> list = query.list();
		return list;
	}
	
	
	
	// 查詢單筆資料ByName
	public List<ActFarmer> selectName(String actName){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActFarmer where actName like?1";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setParameter(1, "%"+actName+"%");
		List<ActFarmer> list = query.getResultList();
		return list;		
	}
	
	// 查詢廠商單筆資料ByName
	public List<ActFarmer> selectNameSeller(String actName,Integer sellerId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActFarmer where actName like?1 && sellerId =?2";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setParameter(1, "%"+actName+"%");
		query.setParameter(2, sellerId);
		List<ActFarmer> list = query.getResultList();
		return list;
		
	}
	
	//獲得單筆資料ById
	public ActFarmer getActFarmer(Integer actId) {
		Session session = sessionFactory.getCurrentSession();
		ActFarmer actFarmer = session.get(ActFarmer.class, actId);
		return actFarmer;
	}
	
	//新增一日農夫資料
	public ActFarmer insertActFarmer(ActFarmer actFarmer) {
		Session session = sessionFactory.getCurrentSession();
//		ActFarmer result = session.get(ActFarmer.class, actFarmer.getActName());
		
//		if(result == null) {
			session.save(actFarmer);
			return actFarmer;
//		}
//		return null;
	}
	
	//刪除
	public boolean deletActFarmer(Integer actId) {
		Session session = sessionFactory.getCurrentSession();
		ActFarmer result = session.get(ActFarmer.class, actId);
		
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}
	
	//更新
	public ActFarmer updateActFarmer(ActFarmer actFarmer) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(actFarmer);
		return actFarmer;
	}

//=========================取得時間==========================================
	
	//時間欄位取得
	private String tagTimeName = "";
	private int selected = -1;

			
	public String getTagTimeName() {
		return tagTimeName;
	}

	public void setTagTimeName(String tagTimeName) {
		this.tagTimeName = tagTimeName;
	}
	
	
	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	//列出所有時間
	public List<Clock> getClocks(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Clock";
		Query<Clock> query = session.createQuery(hql,Clock.class);
		List<Clock> list = query.list();
		return list;
	}
	
	//獲得時間下拉式
	public String getSelectTag() {
		String ans = "";
		List<Clock> ck = getClocks();
		ans += "<SELECT timeName='" + getTagTimeName() + "'>";
		for (Clock cBean : ck) {
			Integer timeId = cBean.getTimeId();
			String timeName = cBean.getTimeName();
			if (timeId == selected) {
				ans += "<option value='" + timeId + "' selected>" + timeName + "</option>";
			} else {
				ans += "<option value='" + timeId + "'>" + timeName + "</option>";
			}
		}
		ans += "</SELECT>";
		return ans;
	}
}
