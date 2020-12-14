package tw.group5.active.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.sound.midi.Soundbank;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import oracle.net.aso.q;
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

// =========================  消費者CRUD  ==========================================

	// 查詢該會員報名列表
	public List<ActOrd> getActOrds(Integer memNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActOrd where memNO =?0 ORDER BY actOrdId";
		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
		query.setParameter(0, memNo);

		if(query.getResultList().size() == 0) {
			return null;
		}else {
		List<ActOrd> list = query.list();
		return list;
		}
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
	
	//訂單信用卡結帳頁面生成
	public String payActSign(String tradeNo,String tradeDate,String tradeTotal,String tradeDesc,String tradeItem) {
		all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
//		InvoiceObj invoice = new InvoiceObj();
//		String s = UUID.randomUUID().toString(); 
		
		Timestamp time= new Timestamp(System.currentTimeMillis());//獲取系統當前時間 
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String timeStr = df.format(time); 
		String tardeDate1=tradeDate.replaceAll("-","/");
		
		System.out.println(timeStr+tradeNo);
		System.out.println(tardeDate1);
		System.out.println(tradeTotal);
		obj.setMerchantTradeNo(timeStr+tradeNo);
		obj.setMerchantTradeDate(tardeDate1);
		obj.setTotalAmount(tradeTotal);
		obj.setTradeDesc("test Description");
		obj.setItemName(tradeItem);
		obj.setClientBackURL("http://localhost:8080/siminar/actSendSignMail.do?actOrd=1&payWay=0&actOrdId="+tradeNo);
		obj.setReturnURL("https://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		
				
		String form = all.aioCheckOut(obj, null);
		return form;	
	}

	
// =========================  廠商CRUD  ==========================================
	
	//查詢某一活動的報名列表
	public List<ActOrd> getActOrdsById(Integer actId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActOrd where actId =?0 ORDER BY actOrdId";
		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
		query.setParameter(0, actId);
		if(query.getResultList().size() == 0) {
			return null;
		}else {
		List<ActOrd> list = query.list();
		return list;
		}
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
	

		
	
	//修改報名
	public ActOrd updateActOrd(ActOrd actOrd) {
		Session session = sessionFactory.getCurrentSession();
		session.update(actOrd);
		return actOrd;
	}
	
	

	
//=================  綠界付款又善的  ========================
			  
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
	
// =========================管理員==========================================

	//查詢所有報名訂單
	public List<ActOrd> getActAdminOrds(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActOrd ORDER BY actOrdId";
		Query<ActOrd> query = session.createQuery(hql, ActOrd.class);
		if(query.getResultList().size() == 0) {
			return null;
		}else {		
		List<ActOrd> list = query.list();
		return list;
		}
	}
	
	
	//刪除報名
	public void delectActAdminOrd(Integer actOrdId) {
		Session session = sessionFactory.getCurrentSession();	
//		ActOrd result = session.get(ActOrd.class, actOrdId);
		Query q = session.createSQLQuery("delete from actord where actordid ="+actOrdId);

		if(actOrdId!=null) {
			q.executeUpdate();
			System.out.println("成功"+actOrdId);
		}
	}

	
//============================  分析訂單  =================================	
	
	public Map<String, Integer> countActType(){
		Session session = sessionFactory.getCurrentSession();	
		Query q1 = session.createSQLQuery("select COUNT(*) from actord inner join actfarmer on actord.actid = actfarmer.actid where acttype='體驗類'");
		Query q2 = session.createSQLQuery("select COUNT(*) from actord inner join actfarmer on actord.actid = actfarmer.actid where acttype='採收類'");
		Query q3 = session.createSQLQuery("select COUNT(*) from actord inner join actfarmer on actord.actid = actfarmer.actid where acttype='文藝類'");
		Query q4 = session.createSQLQuery("select COUNT(*) from actord inner join actfarmer on actord.actid = actfarmer.actid where acttype='綜合類'");
		
		Object obj1 = q1.uniqueResult();
		Integer actType1 = Integer.parseInt(obj1.toString()); //體驗類
		Object obj2 = q2.uniqueResult();
		Integer actType2 = Integer.parseInt(obj2.toString()); //採收類
		Object obj3 = q3.uniqueResult();
		Integer actType3 = Integer.parseInt(obj3.toString()); //文藝類
		Object obj4 = q1.uniqueResult();
		Integer actType4 = Integer.parseInt(obj4.toString()); //綜合類
		
		
		ArrayList<Integer> actTypeList = new ArrayList<Integer>();
		actTypeList.add(actType1);
		actTypeList.add(actType2);
		actTypeList.add(actType3);
		actTypeList.add(actType4);
		
		
		Map<String, Integer> actTypeMap = new HashMap<String, Integer>(); 
		actTypeMap.put("體驗類", actType1);
		actTypeMap.put("採收類", actType2);
		actTypeMap.put("體驗類", actType3);
		actTypeMap.put("文藝類", actType4);
		
		return actTypeMap;
	}
	
	
	// =========================Random==========================================
//	public long random(long begin,long end){ 
//		   long rtn = begin + (long)(Math.random() * (end - begin));
//		   if(rtn == begin || rtn == end){ 
//		   return random(begin,end); 
//		   } 
//		   return rtn; 
//		   } 
		  
	//===生成指定範圍內的亂數時間(年月日)==============
		  
//		  public List<String> randomDate(String bgDate,String edDate) {
//		   try {
//		   SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		   Date start = format.parse(bgDate);//轉換字串 開始日期 
//		   Date end = format.parse(edDate);//轉換字串 結束日期
//		    if(start.getTime() >= end.getTime()){ 
//		     return null; // getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以來此 Date 物件表示的毫秒數。 
//		    }
//		   long date = random(start.getTime(),end.getTime()); 
//		   Date d=new Date(date);
//		   
//		   List<String> dateList = new ArrayList<String>();
//		   String dateText = format.format(d);
//		   dateList.add(dateText);
//		   return dateList;
//		    }catch (Exception e) {
//		     e.printStackTrace(); 
//		    }
//		   return null;
//		  }
//	
	


	
}
