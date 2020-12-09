package tw.group5.active.service;

import java.util.List;

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
		
		
	//訂單信用卡結帳頁面生成
		public String payActSign(String tradeNo,String tradeDate,String tradeTotal,String tradeDesc,String tradeItem) {
			return actOrdDAO.payActSign(tradeNo,tradeDate,tradeTotal,tradeItem,tradeDesc);	
		}	
	
//==============================================================================================================		
	//查詢某一活動的某一筆訂單
//	public List<ActOrd> getActOrdsByOrdId(Integer actOrdId){
//		return actOrdDAO.getActOrdsByOrdId(actOrdId);
//	}
	
	
	//獲得單筆資料ById
	public ActOrd getActOrdOne(Integer actOrdId) {
		return actOrdDAO.getActOrdOne(actOrdId);
	}
	
	//刪除報名
	public boolean delectActOrd(Integer actOrdId) {
		return actOrdDAO.delectActOrd(actOrdId);
	}
		
	//修改報名
	public ActOrd updateActOrd(ActOrd actOrd) {
		return actOrdDAO.updateActOrd(actOrd);
	}	
	
}
