package tw.group5.recipe.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
public class Recipe_Controller {
	
	@Autowired
	private HttpSession session;

	@RequestMapping(path = "/frontPage.controller",method =RequestMethod.GET)
	public String frontPage() {
			return "recipe/recipe_workpage";
	}
	
	
	@RequestMapping(path = "/workpage.controller",method = RequestMethod.POST)
	public String workpage(@RequestParam(name="back",required = false)String back) {
		if(back!=null) {
			return "recipe/recipe_workpage";
		}
		return back;
	}
	
	
	@RequestMapping(path = "/function.controller",method = RequestMethod.POST)
	public String funChoose(@RequestParam String action) {
		if (action.equals("上傳食譜")) {
			if (session.getAttribute("login_ok") != null) {
				Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
				Integer mem_no = mbean.getMember_no();
				session.setAttribute("mem_no", mem_no);
				if (mbean.getMember_email() != null && mbean.getMember_password() != null) {
					System.out.println(session.getAttribute("mem_no"));
					return "redirect:/uploadPage.controller";
				}
			} else if (session.getAttribute("login_ok") == null) {
				return "redirect:/login.controller";
			}

		}
		
		
		if (action.equals("修改食譜")) {
			if (session.getAttribute("login_ok") != null) {
				Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
				Integer mem_no = mbean.getMember_no();
				session.setAttribute("mem_no", mem_no);
				if (mbean.getMember_email() != null && mbean.getMember_password() != null) {
					System.out.println(session.getAttribute("mem_no"));
					return "redirect:/updatePage.controller";
				}
			} else if (session.getAttribute("login_ok") == null) {
				return "redirect:/login.controller";
			}
		}
		if ("搜尋料理".equals(action)) {
			return "redirect:/searchPage.controller";
		}
		return "recipe/recipe_workpage";
	}
}


		

