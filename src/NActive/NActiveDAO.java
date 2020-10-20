package NActive;

import java.util.List;

public interface NActiveDAO {

	//計算販售的商品總共有幾頁====================================================================================
	int getTotalPages();

	// 查詢某一頁的商品資料，執行本方法前，一定要先設定實例變數pageNo的初值
	List<NActiveBean> getPageActives();

	//活動類型搜尋
	String getActTypeTag();

	//修改一筆資料=================================================================================================================
	//可更改活動名稱、地址、電話、活動人數、日期、價格、型態、開始日期、結束日期、描述、照片名稱、照片檔案、影片名稱、影片檔案 where活動ID
	int updateActive(NActiveBean bean, long sizeInBytes);

	// 修改一筆活動資料，不改圖片
	int updateActive(NActiveBean bean);

	//依Act_ID來刪除一筆資料=================================================================================================================
	int deleteActive(String act_id);

	//依新增一筆資料=======================================================================================================
	int insertActive(NActiveBean bean);

	int getPageNo();

	void setPageNo(int pageNo);

	void setSelected(String selected);

	int getRecordsPerPage();

	void setRecordsPerPage(int recordsPerPage);

	//查詢所有活動ByID==================================================================
	NActiveBean getActive(String act_id);

	//
	long getRecordCounts();

	//
	List<String> getActType();

}