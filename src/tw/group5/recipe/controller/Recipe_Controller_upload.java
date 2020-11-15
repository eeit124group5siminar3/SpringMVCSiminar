package tw.group5.recipe.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes(names={"details","login_ok"})
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
	public String submitProcess(@ModelAttribute("details")Recipe_Bean bean,@RequestParam String action,
			 HttpServletRequest request,Model m) throws IllegalStateException, IOException {
	
		if (action.equals("送出")) {
			System.out.println("get value");
			m.addAttribute("name", bean.getName());
			m.addAttribute("cate", bean.getCate());
			m.addAttribute("desc", bean.getDesc());
			m.addAttribute("method", bean.getMethod());
			m.addAttribute("ingredients_A", bean.getIngredients_A());
			m.addAttribute("gram_A", bean.getGram_A());
			m.addAttribute("ingredients_B", bean.getIngredients_B());
			m.addAttribute("gram_B", bean.getGram_B());
			m.addAttribute("FileName", bean.getFileName());
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) +1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			String date=year + "-" + month + "-" + day;
			System.out.println("date: "+date);
			bean.setDate(date);
			
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
		Recipe_Bean bean=(Recipe_Bean)session.getAttribute("details");
		System.out.println(bean.getName());
		System.out.println(bean.getIngredients_A());
		
		if (action.equals("送出")) {
			service.insert(bean);
//			session.removeAttribute("details");
//			status.setComplete();
			return "recipe/upload_success";
		}
		if (action.equals("修改")) {
			return "recipe/recipe_upload_revise";
		} 
		if (action.equals("回首頁")) {
			return "recipe/recipe_workpage";
		} 
		return action;
	}
}
