package tw.group5.recipe.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes({"login_ok","blogBean","memBean"})
public class Recipe_blog {
	
	@Autowired
	private HttpSession session;
	
	@Autowired 
	private recipe_Service_interface service;
	
	@Autowired
	private Blog_Bean blogBean;
	
	//連到首頁
	@GetMapping(value = "/blogPage")
	public String blogPage(Model m) {
		List<Blog_Bean> searchAll=service.searchAllOfBlog();
//		int counts = service.BlogIdMsg(blog_id);
		m.addAttribute("searchAll",searchAll);
		return "recipe/recipe_blog";
	}
	
	//連到詳細頁面
	@GetMapping(value = "/SinglePage")
	public String SinglePage(Model m,@RequestParam(name="blog_id")Integer blog_id) {
		Blog_Bean bean=service.blogBean(blog_id);
		System.out.println(bean.getViews());
		bean.setViews(bean.getViews()+1);
		System.out.println(bean.getViews());
		
		service.updateBlog(bean);
		Blog_Bean partSearch=service.blogBean(blog_id);
		m.addAttribute("partSearch",partSearch);
		return "recipe/blog_single";
	}
	
	
	//member BlogPage 
	@GetMapping(value = "/blog_personal")
	public String blog_personal(Model m){
		Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
		Integer mem_no=OK.getMember_no();
		System.out.println(mem_no);
		blogBean.setMem_no(mem_no);
		
		List<Blog_Bean> list=service.getMemBlog(mem_no);
		m.addAttribute("user_blog",list);
		return "recipe/blog_personal";
	}
	
	//撰寫文章
	@GetMapping(value="/blogEdit")
	public String blogEdit(Model m) {
		
		m.addAttribute("blogBean",blogBean);
		return "recipe/blog_edit";
	}
	
	//送出新增
	@PostMapping(value="/blogContent")
	public String blogPostContent(@ModelAttribute("blogBean")Blog_Bean blogBean) {
		Blog_Bean bean=(Blog_Bean) session.getAttribute("blogBean");
		System.out.println(bean.getContent());
		
		Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
		Integer mem_no=OK.getMember_no();
		bean.setMem_no(mem_no);
		System.out.println(bean.getMem_no());
		
		String name=OK.getMember_name();
		bean.setName(name);
		System.out.println("bean.getName(): "+bean.getName());
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) +1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date=year + "-" + month + "-" + day;
		bean.setDate(date);
		System.out.println(bean.getDate());
		
		service.insert(bean);
		return "redirect:/blog_personal";
		
}
	
	
	//送出修改
	@PostMapping(value="/blogPostUpdate")
	public String blogPostUpdate(@ModelAttribute("memBean")Blog_Bean memBean) {
		Blog_Bean bean=(Blog_Bean) session.getAttribute("memBean");
		service.updateBlog(bean);
		return "redirect:/blog_personal";
		
}
	
	@PostMapping(value="/blogPostDelete")
	public String blogPostDelete(@RequestParam(name="blog_id")Integer blog_id) {
		service.deleteBlog(blog_id);
		return "redirect:/blog_personal";
	}
	
	//搜尋單筆資料
	@PostMapping(value = "/getIdContent")
	public String getIdContent(Model m,@RequestParam(name="id")Integer id) {
		System.out.println(id);
		Blog_Bean memBean=service.blogBean(id);
		System.out.println("----------------------");
		m.addAttribute("memBean",memBean);
		return "recipe/test_edit";
	}
	
}
