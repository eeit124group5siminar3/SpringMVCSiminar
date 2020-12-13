package tw.group5.mall.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.service.AnalysisService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
public class MallAnalysisController {
	@Autowired
	private AnalysisService analysisService;

// 顯示月銷售額分析內容
	@PostMapping(value = "/MonthlySalesContent")
	public ModelAndView showMonthlySalesContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/monthlySales");
		return mav;
	}

// 顯示月銷售額圖表
	@PostMapping(value = "/MonthlySales")
	public @ResponseBody Map<String, Object> showMonthlySalesCharts(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(false);
		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
		analysisService.setUserId(mb.getMember_no());
		String productTag = analysisService.getUserProductListLastHalfYear();
		List<BigDecimal> monthlySalesLastHalfYear = analysisService.getMonthlySalesLastHalfYear();
		List<String> monthNameLastHalfYear = analysisService.getMonthNameLastHalfYear();
		List<BigDecimal> monthlySalesLastHalfYearForAll = analysisService.getMonthlySalesLastHalfYearForAll();
		map.put("month", monthNameLastHalfYear);
		map.put("sales", monthlySalesLastHalfYear);
		map.put("salesForAll", monthlySalesLastHalfYearForAll);
		map.put("productTag", productTag);
		return map;
	}

// 修改月銷售額圖表
	@PostMapping(value = "/SelectProduct")
	public @ResponseBody List<BigDecimal> updateMonthlySalesCharts(HttpServletRequest request,
			@RequestParam(value = "product") String product) {
		HttpSession session = request.getSession(false);
		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
		analysisService.setUserId(mb.getMember_no());
		analysisService.setProduct(product);
		if (product.equals("賣家平均")) {
			List<BigDecimal> monthlySalesLastHalfYearForAll = analysisService.getMonthlySalesLastHalfYearForAll();
			return monthlySalesLastHalfYearForAll;
		} else {
			List<BigDecimal> monthlyProductSalesLastHalfYear = analysisService.getMonthlyProductSalesLastHalfYear();
			return monthlyProductSalesLastHalfYear;
		}
	}

// 顯示產品銷售額分析內容
	@PostMapping(value = "/ProductSalesContent")
	public ModelAndView showProductSalesContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/productSales");
		return mav;
	}

// 顯示單月各產品營業額圖表
	@PostMapping(value = "/ProductSales")
	public @ResponseBody Map<String, Object> showProductSalesCharts(HttpServletRequest request,@RequestParam(value = "lastMonthOf")Integer lastMonthOf) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(false);
		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
		analysisService.setUserId(mb.getMember_no());
		String monthTag = analysisService.getMonthSelectTag();
		List<BigDecimal> userProductSalesOneMonth = analysisService.getUserProductSalesOneMonth(lastMonthOf);
		List<String> userProductListOneMonth = analysisService.getUserProductListOneMonth(lastMonthOf);
		map.put("productList", userProductListOneMonth);
		map.put("sales", userProductSalesOneMonth);
		map.put("monthTag", monthTag);
		return map;
	}
}
