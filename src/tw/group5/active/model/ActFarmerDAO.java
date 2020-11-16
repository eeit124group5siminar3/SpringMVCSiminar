package tw.group5.active.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class ActFarmerDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 抓分頁
	public final Integer RECORDS_PER_PAGE = 5;
	
	private Integer pageNo = 0;// 存放目前顯示之頁面的編號
	private Integer maintainPageNo = 0;
	private Integer recordsPerPage = RECORDS_PER_PAGE; // 每頁抓RECORDS_PER_PAGE
	private Integer totalPages = -1;
	
	private Integer actId = 0;
	
	//計算總共有幾頁
	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}
	
	//計算該廠商總共有幾頁
	public Integer getTotalPages(String sellerId) {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
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

	//計算所有活動的頁數
	public long getRecordCounts() {
		//hibernate Session
		Session session = sessionFactory.getCurrentSession();
		Integer count = 0; //必須使用long型態
		String hql = "select count(*) from ActFarmer";
		
		//??
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}
	
	//計算該廠商擁有的活動頁數
	public long getRecordCounts(String sellerId) {
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
	
	//排序所有活動列表
	public List<ActFarmer> getPageActFarmers(){
		Session session = sessionFactory.getCurrentSession();
		Integer startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ActFarmer ORDER BY actId";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
		List<ActFarmer> list = query.list();
		return list;
	}
	
	//排序該廠商的活動列表
	public List<ActFarmer> getPageActFarmers(String sellerId){
		Session session = sessionFactory.getCurrentSession();
		Integer startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ActFarmer sellerId =?0 ORDER BY actId";
		Query<ActFarmer> query = session.createQuery(hql, ActFarmer.class);
		query.setParameter(0, sellerId);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(5);
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
	
	//新增一日農夫資料
	public ActFarmer insertActFarmer(ActFarmer actFarmer) {
		Session session = sessionFactory.getCurrentSession();
		ActFarmer result = session.get(ActFarmer.class, actFarmer.getActId());
		
		if(result == null) {
			session.save(actFarmer);
			return actFarmer;
		}
		return null;
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
		session.update(actFarmer);
		return actFarmer;
	}

}
