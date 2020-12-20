package tw.group5.recipe.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.recipe.DAO.AnalysisBLOG_DAO;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;

@Controller
public class AnalysisBlog_Controller {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AnalysisBLOG_DAO analysisService;
	
	
	@GetMapping(value = "/getMonthData")
	public List<Msg_Blog_Bean> getMonthData(@RequestParam(name="month",required = false)int month) {
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		System.out.println(calendar.getTime());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		//重要
		calendar.set(Calendar.MONTH,4);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date start = calendar.getTime();
		System.out.println("start: "+start);
		
		Calendar calendarEnd = Calendar.getInstance();
		calendarEnd.setTime(new Date());
		calendarEnd.set(Calendar.MONTH,4);
		calendarEnd.set(Calendar.DAY_OF_MONTH, calendarEnd.getActualMaximum(Calendar.DAY_OF_MONTH));
		Date end = calendarEnd.getTime();
		System.out.println("end: "+end);
		
		
		List<Msg_Blog_Bean> viewsList= analysisService.PageviewsbyDate(30,start,end);
		return viewsList ;
	}
}
