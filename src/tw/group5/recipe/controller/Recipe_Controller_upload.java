package tw.group5.recipe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.BeanFactoryAnnotationUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes(names={"recipe_check","details"})
public class Recipe_Controller_upload {
	@Autowired
	private recipe_Service_interface service;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(path = "/uploadPage.controller",method=RequestMethod.GET)
	public String uploadPage(Model m,HttpServletRequest request) {
//		if(request.getSession(true).getAttribute("name")==null) {
		Recipe_Bean bean=new Recipe_Bean();
		m.addAttribute("details",bean);
		System.out.println(session.getAttribute("mem_no"));
//		bean.setMember_no((Recipe_Bean)session.getAttribute("mem_no"));
//		}
		return "recipe/recipe_upload";
	}
	
	@RequestMapping(path="/uploadSubmit.controller" ,method = RequestMethod.POST )
	public String submitProcess(@ModelAttribute("details")Recipe_Bean bean,@RequestParam String action,Model m) {
		if (action.equals("送出")) {
			System.out.println("get value");
			m.addAttribute("name", bean.getName());
			m.addAttribute("cate", bean.getCate());
			m.addAttribute("desc", bean.getDesc());
			m.addAttribute("method", bean.getMethod());
			m.addAttribute("ingredients_A", bean.getIngredients_A());
			m.addAttribute("gram_A", bean.getGram_A());
//			session.setAttribute("recipe_check",bean);
			System.out.println("done");
			return "recipe/recipe_display";
			
		}
		
		if(action.equals("回首頁")) {
			return "recipe/recipe_workpage";
		}
		return action;
	}
	
	@RequestMapping(path="/uploadConfirm.controller" ,method = RequestMethod.POST)
	public String saveProcess(@RequestParam String action,SessionStatus status) {
//		System.out.println(session.getAttribute("recipe_check"));
		Recipe_Bean bean=(Recipe_Bean)session.getAttribute("details");
		System.out.println(bean.getName());
		System.out.println(bean.getIngredients_A());
		
		if (action.equals("送出")) {
			service.insert(bean);
//			session.removeAttribute("details");
//			status.setComplete();
			return "recipe/upload_success";
		}
		if (action.equals("回首頁")) {
			return "recipe/recipe_workpage";
		} 
		if(status==null) {
			return "recipe/recipe_workpage";
		}
		return action;
	}
}
