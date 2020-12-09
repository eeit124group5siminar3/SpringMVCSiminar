package tw.group5.active.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.active.dao.ActiveDAO;
import tw.group5.active.model.Active;

@Service("activeService")
public class ActiveService {

	@Autowired
	private ActiveDAO activeDAO;

	// 新增
	public Active insert(Active active) {
		return activeDAO.insert(active);
	}

	// 查詢單筆資料ById
	public Active select(int actId) {
		return activeDAO.select(actId);
	}

	// 查詢單筆資料ByName
	public List<Active> selectName(String actName) {
		return activeDAO.selectName(actName);
	}

	// 查詢多筆資料
	public List<Active> selectAll() {
		return activeDAO.selectAll();
	}

	// 更新
	public Active update(int actId, Active active) {
		return activeDAO.update(actId, active);
	}

	// 刪除ById
	public boolean delete(int actId) {
		return activeDAO.delete(actId);

	}
		
}
