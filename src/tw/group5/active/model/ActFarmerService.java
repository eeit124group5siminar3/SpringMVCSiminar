package tw.group5.active.model;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActFarmerService {

	@Autowired
	private ActFarmerDAO actFarmerDAO;
	
	//排序所有活動列表
	public List<ActFarmer> getPageActFarmers(){
		return actFarmerDAO.getPageActFarmers();
	}
	
	//排序該廠商的活動列表
	public List<ActFarmer> getPageActFarmers(Integer sellerId){
		return actFarmerDAO.getPageActFarmers(sellerId);
	}
	
	
	
	// 查詢單筆資料ByName
	public List<ActFarmer> selectName(String actName){
		return actFarmerDAO.selectName(actName);
		
	}
	
	//新增一日農夫資料
	public ActFarmer insertActFarmer(ActFarmer actFarmer) {
		return actFarmerDAO.insertActFarmer(actFarmer);
	}
	
	//刪除ById
	public boolean deletActFarmer(Integer actId) {
		return actFarmerDAO.deletActFarmer(actId);
	}
	
	//更新
	public ActFarmer updateActFarmer(ActFarmer actFarmer) {
		return actFarmerDAO.updateActFarmer(actFarmer);
	}

	//計算頁數
	public void setMaintainPageNo(Integer maintainPageNo) {
		actFarmerDAO.setMaintainPageNo(maintainPageNo);
			
	} 
	
	//每頁幾筆
	public void setRecordsPerPage(int recordsPerPage) {
		actFarmerDAO.setRecordsPerPage(recordsPerPage);
	}
	
	//總頁數
	public int getTotalPages() {
		return actFarmerDAO.getTotalPages();
	}

	//廠商總頁數
	public int getTotalPages(Integer sellerId) {
		return actFarmerDAO.getTotalPages(sellerId);
	}
	
	
}
