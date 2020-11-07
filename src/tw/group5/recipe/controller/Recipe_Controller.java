package tw.group5.recipe.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import oracle.net.aso.m;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller {
	
//	@Autowired
//	private HttpSession session;
	
//	@PathVariable("xxx")    由下方uri中取變數
//	@RequestMapping(path = "/frontpage.controller/{xxx}/view")
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
	
	@RequestMapping(path = "/loginPage.controller",method = RequestMethod.POST)
	public String loginPage() {
		return "Member_SignUp/Member_Login";
	}
	
	@RequestMapping(path = "/function.controller",method = RequestMethod.POST)
	public void funChoose(@RequestParam String action,HttpServletResponse response,HttpSession session) throws IOException {
		Member_SignUp mbean=(Member_SignUp)session.getAttribute("login_ok");
		Integer mem_no=mbean.getMember_no();
		session.setAttribute("mem_no", mem_no);
		if (action.equals("上傳食譜")) {
			if (mbean.getMember_email() != null && mbean.getMember_password() != null) {
				System.out.println(session.getAttribute("mem_no"));
				response.sendRedirect("./uploadPage.controller");
			} 
//				response.sendRedirect("./loginPage.controller");
		}

		if (action.equals("修改食譜")) {
			if (mbean.getMember_email() != null && mbean.getMember_password() != null) {

				response.sendRedirect("./updatePage.controller");
			} 
//			else if(mem_no.getMember_email() == null || mem_no.getMember_password() == null){
//				response.sendRedirect("./loginPage.controller");
//			}
		}
		
		
		if(action.equals("搜尋料理")) {
			response.sendRedirect("./searchPage.controller");
		}
	}
}
