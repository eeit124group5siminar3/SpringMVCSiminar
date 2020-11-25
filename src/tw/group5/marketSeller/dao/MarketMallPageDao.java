//package tw.group5.marketSeller.dao;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class MarketMallPageDao {
//	
//	@Autowired
//	@Qualifier("sessionFactory")
//	private SessionFactory sessionFactory;
//	
//	private Session getSession() {
//		return sessionFactory.getCurrentSession();
//	}
//	//=========================取得分頁==========================================
//	public final Integer RECORDS_PER_PAGE = 5;
//	
//	private Integer pageNo = 1;// 存放目前顯示之頁面的編號
//	private Integer maintainPageNo = 0;
//	private Integer recordsPerPage = RECORDS_PER_PAGE; // 每頁抓RECORDS_PER_PAGE
//	private Integer totalPages = -1;
//	private String searchString;
//	private Integer actId = 0;
//	
//
//	
//	public Integer getPageNo() {
//		return pageNo;
//	}
//	public void setPageNo(Integer pageNo) {
//		this.pageNo = pageNo;
//	}
//	public Integer getMaintainPageNo() {
//		return maintainPageNo;
//	}
//	public void setMaintainPageNo(Integer maintainPageNo) {
//		this.maintainPageNo = maintainPageNo;
//	}
//	public Integer getRecordsPerPage() {
//		return recordsPerPage;
//	}
//	public void setRecordsPerPage(Integer recordsPerPage) {
//		this.recordsPerPage = recordsPerPage;
//	}
//	public Integer getTotalPages() {
//		return totalPages;
//	}
//	public void setTotalPages(Integer totalPages) {
//		this.totalPages = totalPages;
//	}
//	public String getSearchString() {
//		return searchString;
//	}
//	public void setSearchString(String searchString) {
//		this.searchString = searchString;
//	}
//	public Integer getActId() {
//		return actId;
//	}
//	public void setActId(Integer actId) {
//		this.actId = actId;
//	}
//	
//	//計算所有賣家數量
//	public long getSellerCounts() {
//	   Integer count=0;
//	   Query<Long> query=getSession().createQuery("select count(*) from MarketMallBean", java.lang.Long.class);
//	   Object objectNo =query.uniqueResult();
//	   
//	   return count;
//	}
//	
//}
