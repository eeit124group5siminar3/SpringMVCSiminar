package tw.group5.mall.model;

import java.util.HashMap;
import java.util.Map;

public class ShippingTimeClass {
	private static final String SHIPPINGTIME_1 = "早上";
	private static final String SHIPPINGTIME_2 = "中午";
	private static final String SHIPPINGTIME_3 = "下午";
	private static final String SHIPPINGTIME_4 = "晚上";
	public static final Map<Integer, String> SHIPPINGTIME_MAP = getShippingTimeListMap();

	private static Map<Integer, String> getShippingTimeListMap() {
		Map<Integer, String> shippingTimeListMap = new HashMap<Integer, String>();		
		shippingTimeListMap.put(1, SHIPPINGTIME_1);
		shippingTimeListMap.put(2, SHIPPINGTIME_2);
		shippingTimeListMap.put(3, SHIPPINGTIME_3);
		shippingTimeListMap.put(4, SHIPPINGTIME_4);
		return shippingTimeListMap;
	}
	
	public static String getShippingTime(Integer shippingTime) {
		return SHIPPINGTIME_MAP.get(shippingTime);
	}
}
