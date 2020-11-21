package tw.group5.mall.model;

import java.util.HashMap;
import java.util.Map;

public class CategoryClass {
	private static final String CATEGORY_1 = "葉菜類";
	private static final String CATEGORY_2 = "根莖類";
	private static final String CATEGORY_3 = "瓜果類";
	private static final String CATEGORY_4 = "茶葉類";
	private static final String CATEGORY_5 = "水果類";
	public static final Map<Integer, String> CATEGORY_MAP = getCategoryListMap();

	private static Map<Integer, String> getCategoryListMap() {
		Map<Integer, String> categoryListMap = new HashMap<Integer, String>();
		categoryListMap.put(1, CATEGORY_1);
		categoryListMap.put(2, CATEGORY_2);
		categoryListMap.put(3, CATEGORY_3);
		categoryListMap.put(4, CATEGORY_4);
		categoryListMap.put(5, CATEGORY_5);
		return categoryListMap;
	}

	public static String getCategory(Integer categoryId) {
		return CATEGORY_MAP.get(categoryId);
	}
}
