package tw.group5.recipe.controller;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes({"details","login_ok"})
public class Recipe_Controller_upload {
	@Autowired
	private recipe_Service_interface service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	ServletContext ctx;

	@RequestMapping(path = "/uploadPage.controller",method=RequestMethod.GET)
	public String uploadPage(Model m,HttpServletRequest request) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no=OK.getMember_no();
			Recipe_Bean bean = new Recipe_Bean();
			bean.setMember_no(mem_no);
			m.addAttribute("details", bean);
			return "recipe/recipe_upload";
		} else
			return "Member_SignUp/Member_Login";
	}
	
	
	@RequestMapping(path="/uploadSubmit.controller" ,method = {RequestMethod.POST,RequestMethod.GET} )
	public String submitProcess(@ModelAttribute("details")Recipe_Bean details,
			 HttpServletRequest request,Model m) throws IllegalStateException, IOException {
			System.out.println("get value");
			Recipe_Bean bean=(Recipe_Bean) session.getAttribute("details");
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) +1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			String date=year + "-" + month + "-" + day;
			System.out.println("date: "+date);
			System.out.println(bean.getCate());
			bean.setDate(date);
			service.insert(bean);
			System.out.println("done");
			return "Member_Backstage/Member_Backstage";
		}
}