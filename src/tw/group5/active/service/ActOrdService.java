package tw.group5.active.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.active.dao.ActOrdDAO;
import tw.group5.active.model.ActOrd;

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
		
//	//查詢某一活動的某一筆訂單
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
		return updateActOrd(actOrd);
	}	
	
}
