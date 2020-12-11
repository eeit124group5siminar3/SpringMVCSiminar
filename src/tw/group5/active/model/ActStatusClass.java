package tw.group5.active.model;

import java.util.HashMap;
import java.util.Map;

public class ActStatusClass {
	
	private static final String ACTSTATUS_0 = "待審核";
	private static final String ACTSTATUS_1 = "申請通過";
	private static final String ACTSTATUS_2 = "申請未通過";
	private static final String ACTSTATUS_3 = "活動封鎖";
	
	public static final Map<Integer, String> ACTSTATUS_MAP = getActStatusListMap();

	private static Map<Integer, String> getActStatusListMap() {
		Map<Integer, String> actStatusListMap = new HashMap<Integer, String>();
		actStatusListMap.put(0, ACTSTATUS_0);
		actStatusListMap.put(1, ACTSTATUS_1);
		actStatusListMap.put(2, ACTSTATUS_2);
		actStatusListMap.put(3, ACTSTATUS_3);
		return actStatusListMap;
	}
	
	public static String getActStatus(Integer actLock) {
		return ACTSTATUS_MAP.get(actLock);
	}
	
}
