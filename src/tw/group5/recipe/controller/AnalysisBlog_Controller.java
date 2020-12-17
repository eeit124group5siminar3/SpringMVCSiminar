package tw.group5.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import tw.group5.recipe.DAO.AnalysisBLOG_DAO;

@Controller
public class AnalysisBlog_Controller {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AnalysisBLOG_DAO analysisService;
	
	
	@PostMapping(value = "/testAna")
	public int testAna() {
		int count=(int) analysisService.Pageviews("2020-12-17", 30);
		System.out.println(count);
		return count;
	}
}
