package tw.group5.active.model;

import java.util.HashMap;
import java.util.Map;

public class ActSignStatusClass {

	private static final String ACTSIGNSTATUS_0 = "報名未開放";
	private static final String ACTSIGNSTATUS_1 = "活動報名中";
	private static final String ACTSIGNSTATUS_2 = "報名已截止";
	
	public static final Map<Integer, String> ACTSIGNSTATUS_MAP = getActSignStatusListMap();

	private static Map<Integer, String> getActSignStatusListMap() {
		Map<Integer, String> actSignStatusListMap = new HashMap<Integer, String>();
		
		actSignStatusListMap.put(0, ACTSIGNSTATUS_0);
		actSignStatusListMap.put(1, ACTSIGNSTATUS_1);
		actSignStatusListMap.put(2, ACTSIGNSTATUS_2);
		
		return actSignStatusListMap;
	}
	
	public static String getActSignStatus (Integer sigStat) {
		return ACTSIGNSTATUS_MAP.get(sigStat);
	}

}
