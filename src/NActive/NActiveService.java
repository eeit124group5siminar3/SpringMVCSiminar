package NActive;

import java.util.List;

public interface NActiveService {

	int getTotalPages();

	List<NActiveBean> getPageActives();

	int getPageNo();

	void setPageNo(int pageNo);

	int getRecordsPerPage();

	void setRecordsPerPage(int recordsPerPage);

	long getRecordCounts();

	NActiveBean getActive(String act_id);

	int updateActive(NActiveBean bean, long sizeInBytes);

	int updateActive(NActiveBean bean);

	int deleteActive(String act_id);

	int insertActive(NActiveBean bean);

	List<String> getActType();

	void setSelected(String act_type);

	String getActTypeTag();

}