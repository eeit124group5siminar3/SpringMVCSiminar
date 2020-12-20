package tw.group5.active.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.active.dao.ActOrdDAO;
import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActOrd;
@Transactional
@Service
public class ActOrdService {
	
	@Autowired
	private ActOrdDAO actOrdDAO;
	
	private Map<Integer, String> actMonthMap;
	
	
	
	//查詢報名資料
	public List<ActOrd> getActOrds(Integer memNo){
		return actOrdDAO.getActOrds(memNo);		
	}
	
	//新增報名資料
	public ActOrd insertActOrd(ActOrd actOrd) {
		return actOrdDAO.insertActOrd(actOrd) ;

	}
	
	//查詢某一活動的訂單列表
	public List<ActOrd> getActOrdsById(Integer actId){			
			return actOrdDAO.getActOrdsById(actId);
	}
	
	
	//查詢某一會員的訂單
	public List<ActOrd> getActOrdsByMember(Integer memNo){
			return actOrdDAO.getActOrdsByMember(memNo);
	}

	//查詢某一會員的訂單+分頁
	public List<ActOrd> getPageActOrds(Integer memNo) {
		return actOrdDAO.getPageActOrds(memNo);
	}
		
		
	//訂單信用卡結帳頁面生成
		public String payActSign(String tradeNo,String tradeDate,String tradeTotal,String tradeDesc,String tradeItem) {
			return actOrdDAO.payActSign(tradeNo,tradeDate,tradeTotal,tradeItem,tradeDesc);	
		}	
		
	//訂單信用卡結帳頁面生成又善的
//		public String payOrder(String orderId,String date,String totalPrice,String rbName) {			   
//			   return actOrdDAO.payOrder(orderId, date, totalPrice, rbName);  
//			  }		
	
//==============================================================================================================		
	//查詢某一活動的某一筆訂單
//	public List<ActOrd> getActOrdsByOrdId(Integer actOrdId){
//		return actOrdDAO.getActOrdsByOrdId(actOrdId);
//	}
	
	
	//獲得單筆資料ById
	public ActOrd getActOrdOne(Integer actOrdId) {
		return actOrdDAO.getActOrdOne(actOrdId);
	}
	

		
	//修改報名
	public ActOrd updateActOrd(ActOrd actOrd) {
		return actOrdDAO.updateActOrd(actOrd);
	}	
	
	//計算報名人數做多的活動前五筆
	public List<ActFarmer> getPopularAct(){
		return actOrdDAO.getPopularAct();
	}
	
// =========================管理員==========================================

	//查詢所有報名訂單
	public List<ActOrd> getActAdminOrds(){
		return actOrdDAO.getActAdminOrds();
	}
		
	//刪除報名
	public void delectActAdminOrd(Integer actOrdId) {
//		return 
				actOrdDAO.delectActAdminOrd(actOrdId);
	}
	
// =========================訂單分析資料=========================================
	
	//活動類型的圓餅圖
	public LinkedHashMap<String, Integer> countActType(){
		return actOrdDAO.countActType();
	}
	
	public LinkedHashMap<String, Integer> countTotal(){
		return actOrdDAO.countTotal();
	}
	
	public ActOrdService() {
		actMonthMap = new HashMap<Integer, String>();
		actMonthMap.put(1, "1月");
		actMonthMap.put(2, "2月");
		actMonthMap.put(3, "3月");
		actMonthMap.put(4, "4月");
		actMonthMap.put(5, "5月");
		actMonthMap.put(6, "6月");
		actMonthMap.put(7, "7月");
		actMonthMap.put(8, "8月");
		actMonthMap.put(9, "9月");
		actMonthMap.put(10, "10月");
		actMonthMap.put(11, "11月");
		actMonthMap.put(12, "12月");
	}
	
	// 取得前半年的月份
		public List<String> getActMonthNameYear() {
			List<String> list = new ArrayList<String>();
			list.add("本月");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			for (int i = 1; i <= 11; i++) {
				calendar.add(Calendar.MONTH, -1);
				Integer MonthNum = calendar.get(Calendar.MONTH) + 1;
				list.add(actMonthMap.get(MonthNum));
			}
			return list;
		}
	//獲得活動的月銷售額
	public List<BigDecimal> getMonthlyActSales() {
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 11; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal actMonthlySales = actOrdDAO.getMonthlyActSales(last, start);
			if (actMonthlySales == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(actMonthlySales);
			}
		}
		return list;
	}
	
	
	//獲得活動的月訂單數
	public List<BigDecimal> getMonthlyActCounts() {
	
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 11; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal actMonthlySales = actOrdDAO.getMonthlyActCounts(last, start);
			if (actMonthlySales == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(actMonthlySales);
			}
		}
		return list;
	}
	
	//體驗類總營收
	public List<BigDecimal> getMonActTypeSalesOne() {
		
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 11; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monActTypeSalesOne = actOrdDAO.getMonActTypeSalesOne(last, start);
			if (monActTypeSalesOne == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monActTypeSalesOne);
			}
		}
		return list;
	}
	//各活動類型(採收類)每個月營收長條圖
	public List<BigDecimal> getMonActTypeSalesTwo() {
		
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 11; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monActTypeSalesTwo = actOrdDAO.getMonActTypeSalesTwo(last, start);
			if (monActTypeSalesTwo == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monActTypeSalesTwo);
			}
		}
		return list;
	}
	
	//各活動類型(文藝類)每個月營收長條圖
	public List<BigDecimal> getMonActTypeSalesThree() {
		
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 11; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monActTypeSalesThree = actOrdDAO.getMonActTypeSalesThree(last, start);
			if (monActTypeSalesThree == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monActTypeSalesThree);
			}
		}
		return list;
	}
	
	//各活動類型(綜合類)每個月營收長條圖
	public List<BigDecimal> getMonActTypeSalesFour() {
		
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 11; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monActTypeSalesFour = actOrdDAO.getMonActTypeSalesFour(last, start);
			if (monActTypeSalesFour == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monActTypeSalesFour);
			}
		}
		return list;
	}
	
// =========================隨機冠DB=========================================
		
//	public long random(long begin,long end){ 
//		 return actOrdDAO.random(begin, end); 
//	} 
//	
//	 public List<String> randomDate(String bgDate,String edDate) {
//		 return actOrdDAO.randomDate(bgDate, edDate);
//	}
// =========================分頁=========================================
	
	//計算該訂單總共有幾頁
	public Integer getTotalPages() {
		return actOrdDAO.getTotalPages();
	}

	//計算該會員訂單總共有幾頁
	public Integer getTotalPages(Integer memNo) {
		return actOrdDAO.getTotalPages(memNo);
	}
	
	//獲得頁數
	public Integer getPageNo() {
		return actOrdDAO.getPageNo();
	}
	
	public void setPageNo(Integer pageNo) {
		actOrdDAO.setPageNo(pageNo);
	}
	
	public void setMemPageNo(Integer memPageNo) {
		actOrdDAO.setMemPageNo(memPageNo);
	}
	
	public void setRecordsPerPage(Integer recordsPerPage) {
		actOrdDAO.setRecordsPerPage(recordsPerPage);
	}
}
