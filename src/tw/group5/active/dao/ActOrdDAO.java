package tw.group5.active.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Random;

import javax.sound.midi.Soundbank;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.stereotype.Repository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import oracle.net.aso.q;
import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActOrd;
import tw.group5.active.model.ActOrdNum;

@Repository
public class ActOrdDAO {
	public AllInOne all;
	
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private Integer memNo = null;
	private Integer pageNo = 1;
	private Integer memPageNo = 1;
	private Integer recordsPerPage = 3;
	private Integer totalPages = -1;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	
	public Integer getMemPageNo() {
		return memPageNo;
	}

	public void setMemPageNo(Integer memPageNo) {
		this.memPageNo = memPageNo;
	}

	public Integer getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(Integer recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	//計算該會員總共有幾頁
	public Integer getTotalPages(Integer memNo) {
		totalPages = (int) (Math.ceil(getRecordCounts(memNo) / (double) recordsPerPage));
		return totalPages;
	}
	
	// 計算所有參與的活動筆數
		public long getRecordCounts() {
			Session session = sessionFactory.getCurrentSession();
			Integer count = 0;
			String hql = "select count(*) from ActOrd";
			Query<Long> query = session.createQuery(hql, java.lang.Long.class);
			query.setParameter(0, memNo);
			Object objectNumber = query.uniqueResult();
			long longNumber = (long) objectNumber;
			count = (int) longNumber;
			return count;
		}
		
		
	// 計算該會員參與的活動筆數
	public long getRecordCounts(Integer memNo) {
		Session session = sessionFactory.getCurrentSession();
		Integer count = 0;
		String hql = "select count(*) from ActOrd where memNo=?0";
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
		String hql = "from ActOrd where memNO =?0 ORDER BY actOrdId";
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

	//計算報名人數做多的活動前五筆
	public List<ActFarmer> getPopularAct(){
		Session session = sessionFactory.getCurrentSession();
		List list = session.createSQLQuery("select * from(" 
				+"select f.actid, f.actname,f.actDateSta,f.actDateEnd, count(o.actordid),sum(o.ordactnum) as ordactsum from actord o ,actfarmer f where o.actid = f.actid GROUP BY f.actid, f.actname,f.actDateSta,f.actDateEnd order by count(o.actordid) DESC" 
				+")where ROWNUM <=5").setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
		System.out.println(list);
		return list;
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
	//查詢訂單中活動種類的分布
	public LinkedHashMap<String, Integer> countActType(){
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
		Object obj4 = q4.uniqueResult();
		Integer actType4 = Integer.parseInt(obj4.toString()); //綜合類
		
		
		ArrayList<Integer> actTypeList = new ArrayList<Integer>();
		actTypeList.add(actType1);
		actTypeList.add(actType2);
		actTypeList.add(actType3);
		actTypeList.add(actType4);
		
		
		LinkedHashMap<String, Integer> actTypeMap = new LinkedHashMap<String, Integer>(); 
		actTypeMap.put("exp", actType1); //體驗類
		actTypeMap.put("get", actType2); //採收類
		actTypeMap.put("art", actType3); //文藝類
		actTypeMap.put("sum", actType4); //綜合類
		
		return actTypeMap;
	}
	
	//查詢總金額、訂單數、參加人數	
	public LinkedHashMap<String, Integer> countTotal(){
		Session session = sessionFactory.getCurrentSession();	
		Query q1 = session.createSQLQuery("select sum(totalprice) from actord");
//		Query q2 = session.createSQLQuery("select sum(totalprice) from actord where to_date(to_char(ordtime,'YYYY/MM/DDHH24:MI:SS'),'MM')=to_date(sysdate,'MM')");
//		Query q2 = session.createSQLQuery("select sum(totalPrice) from actord where ordtime between '2020-12-01' and '2020-12-31' ");
		Query q3 = session.createSQLQuery("select count(*) from actord");
//		Query q4 = session.createSQLQuery("select count(*) from actord where to_date(to_char(ordtime,'YYYY/MM/DDHH24:MI:SS'),'MM')=to_date(sysdate,'MM')");
		Query q5 = session.createSQLQuery("select count(*) from actfarmer");
//		Query q6 = session.createSQLQuery("select count(*) from actfarmer where to_date(to_char(actdatesta,'YYYY/MM/DDHH24:MI:SS'),'MM')=to_date(sysdate,'MM')");
		Query q7 = session.createSQLQuery("select sum(ordactnum) from actord");
		
//		System.out.println("=============================================="+q2);
		Object obj1 = q1.uniqueResult();
		Integer ordpriceTP = Integer.parseInt(obj1.toString()); //訂單總金額
		System.out.println("說一下你後面那一位為什麼不行"+ordpriceTP);
//		Object obj2 = q2.uniqueResult();
//		System.out.println("=============================================="+obj2);
//		Integer ordpriceMonP = Integer.parseInt(obj2.toString()); //當月訂單總金額
		
		
		Object obj3 = q3.uniqueResult();
		Integer ordpriceTC = Integer.parseInt(obj3.toString()); //總訂單數數
//		Object obj4 = q4.uniqueResult();
//		Integer ordpriceMonC = Integer.parseInt(obj4.toString()); //當月總訂單數
		Object obj5 = q5.uniqueResult();
		Integer actTC = Integer.parseInt(obj5.toString()); //總活動數
//		Object obj6 = q6.uniqueResult();
//		Integer actMonC = Integer.parseInt(obj6.toString()); //當月舉辦的活動數
		Object obj7 = q7.uniqueResult();
		Integer actNumT = Integer.parseInt(obj7.toString()); //總活動數

		
		ArrayList<Integer> actTotal = new ArrayList<Integer>();
		actTotal.add(ordpriceTP);
//		actTotal.add(ordpriceMonP);
		actTotal.add(ordpriceTC);
//		actTotal.add(ordpriceMonC);
		actTotal.add(actTC);
//		actTotal.add(actMonC);
		actTotal.add(actNumT);
				
		LinkedHashMap<String, Integer> actTypeMap = new LinkedHashMap<String, Integer>(); 
		actTypeMap.put("ordTotalPrice", ordpriceTP);  //訂單總金額
//		actTypeMap.put("ordMonTolPrice", ordpriceMonP); //當月訂單總金額
		actTypeMap.put("ordCounts", ordpriceTC); //總訂單數數
//		actTypeMap.put("ordMonCounts", ordpriceMonC); //當月總訂單數
		actTypeMap.put("actTol", actTC); //總活動數
//		actTypeMap.put("actMon", actMonC); //當月舉辦的活動數
		actTypeMap.put("actNumT", actNumT); //累積參加人數
		
		return actTypeMap;
		
	}
	
//	每個月
//	public 
	
	
	
	
	
	
	// =========================Random==========================================
	public long random(long begin,long end){ 
		   long rtn = begin + (long)(Math.random() * (end - begin));
		   if(rtn == begin || rtn == end){ 
			   return random(begin,end); 
		   } 
		   	return rtn; 
		   } 
		  
	//===生成指定範圍內的亂數時間(年月日)==============
		  
		  public List<String> randomDate(String bgDate,String edDate) {
		   try {
		   SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		   Date start = format.parse(bgDate);//轉換字串 開始日期 
		   Date end = format.parse(edDate);//轉換字串 結束日期
		    if(start.getTime() >= end.getTime()){ 
		     return null; // getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以來此 Date 物件表示的毫秒數。 
		    }
		   long date = random(start.getTime(),end.getTime()); 
		   Date d=new Date(date);
		   
		   List<String> dateList = new ArrayList<String>();
		   String dateText = format.format(d);
		   dateList.add(dateText);
		   return dateList;
		    }catch (Exception e) {
		     e.printStackTrace(); 
		    }
		   return null;
		  }
	
	


	
}
