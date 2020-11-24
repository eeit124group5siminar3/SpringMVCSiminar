package tw.group5.active.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import tw.group5.mall.model.ProductImageBean;

@Service
public class ActFarmerService {

	@Autowired
	private ActFarmerDAO actFarmerDAO;
	
	//排序所有活動列表+分頁
	public List<ActFarmer> getPageActFarmers(){
		return actFarmerDAO.getPageActFarmers();
	}
	
	//排序該廠商的活動列表+分頁
	public List<ActFarmer> getPageActFarmers(Integer sellerId){
		return actFarmerDAO.getPageActFarmers(sellerId);
	}
	
	//排序該廠商的活動列表
	public List<ActFarmer> getActFarmers(Integer sellerId){
		return actFarmerDAO.getActFarmers(sellerId);
	}
	
	
	// 查詢單筆資料ByName
	public List<ActFarmer> selectName(String actName){
		return actFarmerDAO.selectName(actName);	
	}
	
	//查詢單筆資料ByName seller
	public List<ActFarmer> selectNameSeller(String actName,Integer sellerId){
		return actFarmerDAO.selectName(actName);	
	} 
	
	//查詢單筆資料ById
	public ActFarmer getActFarmer(Integer actId) {
		return actFarmerDAO.getActFarmer(actId);
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
	
	//獲得頁數
	public Integer getPageNo() {
		return actFarmerDAO.getPageNo();
	}
	
	public void setPageNo(Integer pageNo) {
		actFarmerDAO.setPageNo(pageNo);
	}
	
	public void setSearchString(String searchString) {
		actFarmerDAO.setSearchString(searchString);
	}

	
	//獲得時間
	public String getTagTimeName() {
		return actFarmerDAO.getTagTimeName();
	}

	public void setTagTimeName(String tagTimeName) {
		actFarmerDAO.setTagTimeName(tagTimeName);
	}
		
	public int getSelected() {
		return actFarmerDAO.getSelected();
	}

	//列出所有時間
	public List<Clock> getClocks(){
		return actFarmerDAO.getClocks();
	}
	
	//獲得時間下拉式
	public String getSelectTag() {
		return actFarmerDAO.getSelectTag();
	}

	public Integer getActId() {
		return actFarmerDAO.getActId();
	}

	public void setActId(Integer actId) {
		actFarmerDAO.setActId(actId);
	}
}
