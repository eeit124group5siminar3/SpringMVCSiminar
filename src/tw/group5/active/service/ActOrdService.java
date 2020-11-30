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

}
