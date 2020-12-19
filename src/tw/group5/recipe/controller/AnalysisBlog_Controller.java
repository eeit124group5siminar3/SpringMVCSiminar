package tw.group5.recipe.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.DAO.AnalysisBLOG_DAO;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.Recipe_Service;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes({ "login_ok" })
public class AnalysisBlog_Controller {

	@Autowired
	private HttpSession session;

	@Autowired
	private AnalysisBLOG_DAO analysisService;

	@Autowired
	private recipe_Service_interface service;

	@GetMapping(value = "/analysisPage")
	public String analysisPage(Model m) {
		Member_SignUp OK = (Member_SignUp) session.getAttribute("login_ok");
		List<Blog_Bean> blogList = service.getMemBlog(OK.getMember_no());
		int counts = 0;
		for (Blog_Bean b : blogList) {
			System.out.println(b.getBlog_id());
			counts = (int) service.BlogMsgCounts(b.getBlog_id());
			b.setCounts(counts);
		}
		m.addAttribute("blogList", blogList);
		return "recipe/blog_analysis";
	}

	// 找出某段時間內blog_id符合的所有資料
	@PostMapping(value = "/getMonthAnalysis")
	@ResponseBody
	public Map<String, Object> getMonthData(@RequestParam(name = "blog_id") Integer blog_id) {
		List<Msg_Blog_Bean> perMonthList = new ArrayList<Msg_Blog_Bean>();
		Map<String, Object> map = new HashedMap();
//		for(int month=1;month<=12;month++) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		System.out.println(calendar.getTime());
		// 重要
		calendar.set(Calendar.MONTH, calendar.JANUARY);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date start = calendar.getTime();
		System.out.println("start: " + start);

		Calendar calendarEnd = Calendar.getInstance();
		calendarEnd.setTime(new Date());
		calendarEnd.set(Calendar.MONTH, calendar.DECEMBER);
		calendarEnd.set(Calendar.HOUR_OF_DAY, 23);
		calendarEnd.set(Calendar.MINUTE, 59);
		calendarEnd.set(Calendar.SECOND, 59);
		calendarEnd.set(Calendar.MILLISECOND, 59);
		calendarEnd.set(Calendar.DAY_OF_MONTH, calendarEnd.getActualMaximum(Calendar.DAY_OF_MONTH));
		Date end = calendarEnd.getTime();
		System.out.println("end: " + end);
//		List<Msg_Blog_Bean> list=analysisService.PageviewsbyDate(5, start, end);
//		perMonthList.add((Msg_Blog_Bean) list);
//		}
		List<Msg_Blog_Bean> list = analysisService.PageviewsbyDate(blog_id, start, end);
		Integer month12 = 0;
		Integer month11 = 0;
		Integer month10 = 0;
		Integer month9 = 0;
		Integer month8 = 0;
		Integer month7 = 0;
		Integer month6 = 0;
		Integer month5 = 0;
		Integer month4 = 0;
		Integer month3 = 0;
		Integer month2 = 0;
		Integer month1 = 0;
		for (Msg_Blog_Bean b : list) {
			System.out.println(b.getDate());
			System.out.println(b.getDate().toString().substring(5, 7));
			String getMon = b.getDate().toString().substring(5, 7);
			if (getMon.equals("12")) {
				month12++;
			}
			if (getMon.equals("11")) {
				month11++;
			}
			if (getMon.equals("10")) {
				month10++;
			}
			if (getMon.equals("09")) {
				month9++;
			}
			if (getMon.equals("08")) {
				month8++;
			}
			if (getMon.equals("07")) {
				month7++;
			}
			if (getMon.equals("06")) {
				month6++;
			}
			if (getMon.equals("05")) {
				month5++;
			}
			if (getMon.equals("04")) {
				month4++;
			}
			if (getMon.equals("03")) {
				month3++;
			}
			if (getMon.equals("02")) {
				month2++;
			}
			if (getMon.equals("01")) {
				month1++;
			}
		}
		map.put("month1", month1);
		map.put("month2", month2);
		map.put("month3", month3);
		map.put("month4", month4);
		map.put("month5", month5);
		map.put("month6", month6);
		map.put("month7", month7);
		map.put("month8", month8);
		map.put("month9", month9);
		map.put("month10", month10);
		map.put("month11", month11);
		map.put("month12", month12);
		map.put("list", list);
		return map;
	}

	// 找出某段時間內某blog_id 的回文數
	@PostMapping(value = "/getReplyCounts")
	@ResponseBody
	public int getReplyCounts(@RequestParam(name = "month", required = false) int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		System.out.println(calendar.getTime());
		// 重要
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date start = calendar.getTime();
		System.out.println("start: " + start);

		Calendar calendarEnd = Calendar.getInstance();
		calendarEnd.setTime(new Date());
		calendarEnd.set(Calendar.MONTH, month);
		calendarEnd.set(Calendar.HOUR_OF_DAY, 23);
		calendarEnd.set(Calendar.MINUTE, 59);
		calendarEnd.set(Calendar.SECOND, 59);
		calendarEnd.set(Calendar.MILLISECOND, 59);
		calendarEnd.set(Calendar.DAY_OF_MONTH, calendarEnd.getActualMaximum(Calendar.DAY_OF_MONTH));
		Date end = calendarEnd.getTime();
		System.out.println("end: " + end);

		List<Msg_Blog_Bean> perMonthList = analysisService.PageviewsbyDate(30, start, end);
		int counts = 0;
		for (Msg_Blog_Bean b : perMonthList) {
			counts++;
			System.out.println(b.getName());
		}
		System.out.println("counts: " + counts);
		return counts;
	}
}
