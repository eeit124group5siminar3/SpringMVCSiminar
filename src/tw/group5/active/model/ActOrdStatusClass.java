package tw.group5.active.model;

import java.util.HashMap;
import java.util.Map;

public class ActOrdStatusClass {
	
	//ordStatus
	private static final String ACTORDSTATUS_0="尚未付款";
	private static final String ACTORDSTATUS_1="已付款";
	private static final String ACTORDSTATUS_2="訂單取消";
	
	//活動付款方式
	private static final String ACTPAYWAY_0="信用卡";
	private static final String ACTPAYWAY_1="網路ATM";
	private static final String ACTPAYWAY_2="ATM櫃員機";
	private static final String ACTPAYWAY_3="超商條碼";
	private static final String ACTPAYWAY_4="超商代碼";
	
	
//==============================  訂單狀態  =====================================================	
	public static final Map<Integer, String> ACTORDSTATUS_MAP = getActOrdStatusListMap();

	private static Map<Integer, String> getActOrdStatusListMap() {
		Map<Integer, String> actOrdStatusListMap = new HashMap<Integer, String>();
		
		actOrdStatusListMap.put(0, ACTORDSTATUS_0);
		actOrdStatusListMap.put(1, ACTORDSTATUS_1);
		actOrdStatusListMap.put(2, ACTORDSTATUS_2);
		
		return actOrdStatusListMap;
	}

	public static String getActOrdStatus(Integer ordState) {
		return ACTORDSTATUS_MAP.get(ordState);
	}
	
//===============================  活動付款方式  =====================================================	

	public static final Map<Integer, String> ACTPAYWAY_MAP = getActPayWayListMap();

	private static Map<Integer, String> getActPayWayListMap() {
		Map<Integer, String> actPayWayListMap = new HashMap<Integer, String>();
		
		actPayWayListMap.put(0, ACTPAYWAY_0);
		actPayWayListMap.put(1, ACTPAYWAY_1);
		actPayWayListMap.put(2, ACTPAYWAY_2);
		actPayWayListMap.put(3, ACTPAYWAY_3);
		actPayWayListMap.put(4, ACTPAYWAY_4);
		
		return actPayWayListMap;
	}
	
	public static String getActPayWay(Integer payWay) {
		return ACTPAYWAY_MAP.get(payWay);
	}
}
