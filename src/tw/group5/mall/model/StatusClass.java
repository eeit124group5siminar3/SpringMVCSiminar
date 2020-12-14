package tw.group5.mall.model;

import java.util.HashMap;
import java.util.Map;

public class StatusClass {
	private static final String STATUS_0 = "處理中";
//	private static final String STATUS_1 = "處理中";
	private static final String STATUS_2 = "已出貨";
	private static final String STATUS_3 = "拒絕接單";
	private static final String STATUS_4 = "訂單取消";
	private static final String STATUS_5 = "已評分";
	private static final String STATUS_6 = "訂單結束";
	public static final Map<Integer, String> STATUS_MAP = getStatusListMap();

	private static Map<Integer, String> getStatusListMap() {
		Map<Integer, String> statusListMap = new HashMap<Integer, String>();		
		statusListMap.put(-2, STATUS_4);
		statusListMap.put(-1, STATUS_3);
		statusListMap.put(0, STATUS_0);
//		statusListMap.put(1, STATUS_1);
		statusListMap.put(1, STATUS_2);
		statusListMap.put(3, STATUS_5);
		statusListMap.put(4, STATUS_6);
		return statusListMap;
	}
	
	public static String getStatus(Integer status) {
		return STATUS_MAP.get(status);
	}
}
