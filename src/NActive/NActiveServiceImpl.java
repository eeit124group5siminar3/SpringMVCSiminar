package NActive;

import java.util.List;

public class NActiveServiceImpl implements NActiveService {

	NActiveDAO dao;
	
	public NActiveServiceImpl() {
		this.dao = new NActiveDaoImpl_Jdbc();
	}
	
	@Override
	public int getTotalPages() {
		return dao.getTotalPages();
	}
	
	@Override
	public List<NActiveBean> getPageActives(){
		return dao.getPageActives();
	}
	
	@Override
	public int getPageNo() {
		return dao.getPageNo();
	}
	
	@Override
	public void setPageNo(int pageNo) {
		dao.setPageNo(pageNo);
	}
	
	@Override
	public int getRecordsPerPage() {
		return dao.getRecordsPerPage();
	}
	
	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		dao.setRecordsPerPage(recordsPerPage);
	}
	
	@Override
	public long getRecordCounts() {
		return dao.getRecordCounts();
	}
	
	@Override
	public NActiveBean getActive(String act_id) {
		return dao.getActive(act_id);
	}
	
	@Override
	public int updateActive(NActiveBean bean, long sizeInBytes) {
		return dao.updateActive(bean, sizeInBytes);
	}
	
	@Override
	public int updateActive(NActiveBean bean) {
		return dao.updateActive(bean);
	}
	
	@Override
	public int deleteActive(String act_id) {
		return dao.deleteActive(act_id);
	}
	
	@Override
	public int insertActive(NActiveBean bean) {
		return dao.insertActive(bean);
	}
	
	@Override
	public List<String> getActType(){
		return dao.getActType();
	}
	
	@Override
	public void setSelected(String act_type) {
		dao.setSelected(act_type);
	}
	
	@Override
	public String getActTypeTag() {
		return dao.getActTypeTag();
	}
	
	
	
	
}
