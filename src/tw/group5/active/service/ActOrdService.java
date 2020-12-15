package tw.group5.active.service;

import java.util.ArrayList;
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
import tw.group5.active.model.ActOrd;
@Transactional
@Service
public class ActOrdService {
	
	@Autowired
	private ActOrdDAO actOrdDAO;
	
	
	
	
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
