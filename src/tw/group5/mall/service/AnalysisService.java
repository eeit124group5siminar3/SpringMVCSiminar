package tw.group5.mall.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.ObjectIdGenerators.StringIdGenerator;

import tw.group5.mall.dao.AnalysisDAO;
import tw.group5.mall.dao.OrderDAO;
import tw.group5.mall.model.CategoryClass;

@Service
@Transactional
public class AnalysisService {
	@Autowired
	private AnalysisDAO adao;
	private Map<Integer, String> monthMap;

	public AnalysisService() {
		monthMap = new HashMap<Integer, String>();
		monthMap.put(1, "1月");
		monthMap.put(2, "2月");
		monthMap.put(3, "3月");
		monthMap.put(4, "4月");
		monthMap.put(5, "5月");
		monthMap.put(6, "6月");
		monthMap.put(7, "7月");
		monthMap.put(8, "8月");
		monthMap.put(9, "9月");
		monthMap.put(10, "10月");
		monthMap.put(11, "11月");
		monthMap.put(12, "12月");
	}

// 取得個人前半年的營業額
	public List<BigDecimal> getMonthlySalesLastHalfYear() {
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 5; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monthlySales = adao.getMonthlySales(last, start);
			if (monthlySales == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monthlySales);
			}
		}
		return list;
	}

// 取得個人前半年的營業額
	public List<BigDecimal> getMonthlyProductSalesLastHalfYear() {
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 5; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monthlySales = adao.getMonthlyProductSales(last, start);
			if (monthlySales == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monthlySales);
			}
		}
		return list;
	}

// 取得個人前半年售出產品清單tag
	public String getUserProductListLastHalfYear() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		Date start = calendar.getTime();
		calendar.add(Calendar.MONTH, -5);
		Date last = calendar.getTime();
		List<String> list = adao.getUserProductList(last, start);
		String productTag = getSelectTag(list);
		return productTag;
	}

// 取得產品下拉式選單tag
	private String getSelectTag(List<String> list) {
		String ans = "";
		ans += "<select id='productList' onchange='singleProduct()'><option value='賣家平均' selected>賣家平均</option>";
		for (String product : list) {
			ans += "<option value='" + product + "'>" + product + "</option>";
		}
		ans += "</select>";
		return ans;
	}

// 取得全站平均前半年的營業額
	public List<BigDecimal> getMonthlySalesLastHalfYearForAll() {
		List<BigDecimal> list = new ArrayList<BigDecimal>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1);
		for (int i = 0; i <= 5; i++) {
			Date start = calendar.getTime();
			calendar.add(Calendar.MONTH, -1);
			Date last = calendar.getTime();
			BigDecimal monthlySales = adao.getMonthlySalesForAll(last, start);
			if (monthlySales == null) {
				list.add(new BigDecimal(0));
			} else {
				list.add(monthlySales);
			}
		}
		return list;
	}

// 取得前半年的月份
	public List<String> getMonthNameLastHalfYear() {
		List<String> list = new ArrayList<String>();
		list.add("本月");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		for (int i = 1; i <= 5; i++) {
			calendar.add(Calendar.MONTH, -1);
			Integer MonthNum = calendar.get(Calendar.MONTH) + 1;
			list.add(monthMap.get(MonthNum));
		}
		return list;
	}

// 取得個人某單一月份各商品的營業額
	public List<BigDecimal> getUserProductSalesOneMonth(Integer lastMonthOf){
		List<BigDecimal> list=new ArrayList<BigDecimal>();
		List<String> productList=getUserProductListOneMonth(lastMonthOf);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1-lastMonthOf);
		Date start = calendar.getTime();
		calendar.add(Calendar.MONTH, -1);
		Date last = calendar.getTime();
		if(productList.size()>10) {
			BigDecimal otherSales=new BigDecimal(0);
			for(int i=0;i<10;i++) {
				adao.setProduct(productList.get(i));
				list.add(adao.getMonthlyProductSales(last, start));	
			}	
			for(int i=10;i<productList.size();i++) {
				adao.setProduct(productList.get(i));
				otherSales=otherSales.add(adao.getMonthlyProductSales(last, start));
			}
			list.add(otherSales);
		}else {
		for(int i=0;i<productList.size();i++) {
			adao.setProduct(productList.get(i));
			list.add(adao.getMonthlyProductSales(last, start));	
		}
		}
		return list;
	}
// 取得個人某單一月份的產品售出清單
	public List<String> getUserProductListOneMonth(Integer lastMonthOf) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.MONTH, 1-lastMonthOf);
		Date start = calendar.getTime();
		calendar.add(Calendar.MONTH, -1);
		Date last = calendar.getTime();
		List<String> list = adao.getUserProductList(last, start);
		if(list.size()>10) {
			do {
				list.remove(10);
			}while(list.size()>10);
			list.add("其他");
		}
		return list;
	}
	
// 取的前半年月份下拉式選單
	public String getMonthSelectTag() {
		List<String> list=getMonthNameLastHalfYear();
		String ans = "";
		ans += "<select id='lastMonthOf' onchange='monthlyProduct()'>";
		for (int i=0;i<6;i++) {
			ans += "<option value='" + i + "'>" + list.get(i) + "</option>";
		}
		ans += "</select>";
		return ans;
	}

	public void setUserId(Integer member_no) {
		adao.setUserId(member_no);
	}

	public void setProduct(String product) {
		adao.setProduct(product);
	}
}