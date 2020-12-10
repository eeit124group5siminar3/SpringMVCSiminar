package tw.group5.active.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

import tw.group5.active.model.ActOrd;

@Repository
public class ActOrdDAO {
	public AllInOne all;
	
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private Integer memNo = null;
	private Integer pageNo = 1;
	private Integer recordsPerPage = 3;
	private Integer totalPages = -1;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(Integer recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	//計算該會員總共有幾頁
	public Integer getTotalPages(Integer memNO) {
		totalPages = (int) (Math.ceil(getRecordCounts(memNO) / (double) recordsPerPage));
		return totalPages;
	}
	

	// 計算該會員參與的活動筆數
	public long getRecordCounts(Integer memNo) {
		Session session = sessionFactory.getCurrentSession();
		Integer count = 0;
		String hql = "select count(*) from ActOrd where memNO=0?";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		query.setParameter(0, memNo);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;

	}

	// =========================消費者CRUD==========================================

	// 查詢該會員報名列表
	public List<ActOrd> getActOrds(Integer memNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActOrd where memNO =?0 ORDER BY actOrdId";
		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
		query.setParameter(0, memNo);
		List<ActOrd> list = query.list();
		return list;

	}
	
	// 查詢該會員報名列表+分頁
	public List<ActOrd> getPageActOrds(Integer memNo) {
		Session session = sessionFactory.getCurrentSession();
		Integer startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "from ActOrd where memNO =?0 ORDER BY ordId";
		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
		query.setParameter(0, memNo);
		query.setFirstResult(startRecordNo);
		query.setMaxResults(recordsPerPage);
		List<ActOrd> list = query.list();
		return list;

	}

	// 新增活動報名資訊
	public ActOrd insertActOrd(ActOrd actOrd) {
		Session session = sessionFactory.getCurrentSession();
		session.save(actOrd);
		return actOrd;

	}
	
	//查詢某一會員的訂單
	public List<ActOrd> getActOrdsByMember(Integer memNo){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActOrd where memNo =?0 ORDER BY actOrdId";
		Query<ActOrd> query = session.createQuery(hql,ActOrd.class);
		query.setParameter(0, memNo);
		List<ActOrd> list = query.list();
		return list;
	}
	
// =========================廠商CRUD==========================================
	
	//查詢某一活動的報名列表
	public List<ActOrd> getActOrdsById(Integer actId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActOrd where actId =?0 ORDER BY actOrdId";
		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
		query.setParameter(0, actId);
		List<ActOrd> list = query.list();
		return list;
	}
	
//	//查詢某一活動的某一筆報名
//	public List<ActOrd> getActOrdsByOrdId(Integer actOrdId){
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from ActOrd where actOrdId =?0 ORDER BY actOrdId";
//		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
//		query.setParameter(0, actOrdId);
//		List<ActOrd> list = query.list();
//		return list;
//		}
		
	
	//獲得單筆資料ById
	public ActOrd getActOrdOne(Integer actOrdId) {
		Session session = sessionFactory.getCurrentSession();
		ActOrd actOrd = session.get(ActOrd.class, actOrdId);
		return actOrd;
	}
	
	//刪除報名
	public boolean delectActOrd(Integer actOrdId) {
		Session session = sessionFactory.getCurrentSession();	
		ActOrd result = session.get(ActOrd.class, actOrdId);

		if(result!=null) {
			session.delete(result);
			return true;
		}
		return false;
	}
//		System.err.println(actOrdOne);
//		System.err.println(result);
//		System.err.println(result.getActOrdId());
//		if(actOrdId!=null) {
//			session.delete(actOrdId);
//			return true;
//		}
//		return false;
//	}
		
	
	//修改報名
	public ActOrd updateActOrd(ActOrd actOrd) {
		Session session = sessionFactory.getCurrentSession();
		session.update(actOrd);
		return actOrd;
	}
	
	
	//訂單信用卡結帳頁面生成
	public String payActSign(String tradeNo,String tradeDate,String tradeTotal,String tradeDesc,String tradeItem) {
		all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
//		InvoiceObj invoice = new InvoiceObj();

//		AioCheckOutOneTime obj = new AioCheckOutOneTime();
	
		obj.setMerchantTradeNo(tradeNo);
		obj.setMerchantTradeDate(tradeDate);
		obj.setTotalAmount(tradeTotal);
		obj.setTradeDesc("test Description");
		obj.setItemName(tradeItem);
		obj.setClientBackURL("http://localhost:8080/siminar/index");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		
//		obj.setMerchantTradeNo("testCompa454ny0008");
//		obj.setMerchantTradeDate("2017/01/01 08:05:23");
//		obj.setTotalAmount("50");
//		obj.setTradeDesc("test Description");
//		obj.setItemName("TestItem");
//		obj.setReturnURL("http://211.23.128.214:5000");
//		obj.setNeedExtraPaidInfo("N");
//		obj.setRedeem("Y");
				
		String form = all.aioCheckOut(obj, null);
		return form;	
		
	}
	
//	//======綠界付款又善的==========================
//			  
//			  public String payOrder(String orderId,String date,String totalPrice,String rbName) {
//			   all = new AllInOne("");
//			   AioCheckOutOneTime obj = new AioCheckOutOneTime();
//			   obj.setMerchantTradeNo(orderId);
//			   obj.setMerchantTradeDate(date);
//			   obj.setTotalAmount(totalPrice);
//			   obj.setTradeDesc("test Description");
//			   obj.setItemName(rbName);
//			   obj.setReturnURL("http://211.23.128.214:5000");
//			   obj.setClientBackURL("/homepage");
//			   obj.setNeedExtraPaidInfo("N");
//			   obj.setRedeem("Y");
//			   String form = all.aioCheckOut(obj, null);
//			   return form;  
//			  }
	
	
}
