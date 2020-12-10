package tw.group5.recipe.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes({"login_ok","blogBean","memBean","msgBean"})
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
		List<Blog_Bean> searchOpen=new ArrayList<Blog_Bean>();
		for(Blog_Bean b:searchAll) {
			if(b.getStatus()==1) {
				searchOpen.add(b);
			}
		}
//		int counts = service.BlogIdMsg(blog_id);
		
		m.addAttribute("searchAll",searchOpen);
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
		int counts=(int) service.BlogMsgCounts(blog_id);
		partSearch.setCounts(counts);
		m.addAttribute("partSearch",partSearch);
		
		//人氣排行
//		System.err.println("-----------------------------------");
//		List<Blog_Bean> popular=service.searchPopular(3);
//		for(Blog_Bean b:popular) {
//			System.out.println(b.getTitle());
//		}
//		m.addAttribute("popular",popular);
		
		//回文資料
		List<Msg_Blog_Bean> searchMsg=service.searchMsg(blog_id);
		m.addAttribute("searchMsg",searchMsg);
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
	
	//判斷開啟關閉
	@PostMapping(value="/checkStatus")
	@ResponseBody
	public boolean checkStatus(@RequestParam(name="blog_id")Integer blog_id) {
		Blog_Bean bean=service.blogBean(blog_id);
		Integer status=bean.getStatus();
		System.out.println(bean.getBlog_id()+" : "+bean.getStatus());
		if(status==1) {
			bean.setStatus(0);
			service.updateBlog(bean);
			return false;
		}else if (status==0) {
			bean.setStatus(1);
			service.updateBlog(bean);
			System.out.println(bean.getStatus());
			return true;
		}else {
			bean.setStatus(0);
			return false;
		}

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
//		Blog_Bean bean=(Blog_Bean) session.getAttribute("memBean");
		service.updateBlog(memBean);
		return "redirect:/blog_personal";
		
}
	
	@PostMapping(value="/blogPostDelete")
	public String blogPostDelete(@RequestParam(name="blog_id")Integer blog_id) {
		service.deleteBlog(blog_id);
		return "redirect:/blog_personal";
	}
	
	//搜尋單筆資料
	@GetMapping(value = "/getIdContent")
	public String getIdContent(Model m,@RequestParam(name="blog_id")Integer blog_id) {
		System.out.println(blog_id);
		Blog_Bean memBean=service.blogBean(blog_id);
		System.out.println("----------------------");
		m.addAttribute("memBean",memBean);
		return "recipe/test_edit";
	}
	
	//文章回文
	@PostMapping(value = "/msgContent")
	public String msgContent(@RequestParam(name="content")String content,
			@RequestParam(name="blog_id")Integer blog_id,Model m) {
		Msg_Blog_Bean bean=new Msg_Blog_Bean();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) +1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date=year + "-" + month + "-" + day;
		bean.setDate(date);
		Blog_Bean partSearch=service.blogBean(blog_id);
		bean.setBlog_Bean(partSearch);
		
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no=OK.getMember_no();
			String name=OK.getMember_name();
			bean.setMem_no(mem_no);
			bean.setName(name);
			bean.setContent(content);
			service.insertMsg(bean);
			int counts=(int) service.BlogMsgCounts(blog_id);
			List<Msg_Blog_Bean> searchMsg=service.searchMsg(blog_id);
			m.addAttribute("counts",counts);
			m.addAttribute("searchMsg",searchMsg);

			
			return "recipe/msgForm";
			
		}else if (session.getAttribute("login_ok") == null){
			bean.setName("訪問者");
			bean.setContent(content);
			service.insertMsg(bean);
			int counts=(int) service.BlogMsgCounts(blog_id);
			List<Msg_Blog_Bean> searchMsg=service.searchMsg(blog_id);
			m.addAttribute("counts",counts);
			m.addAttribute("searchMsg",searchMsg);
			return "recipe/msgForm";
		}
		
		return "recipe/recipe_blog";
	}
	
	@PostMapping(value = "/msgSearch")
	public boolean msgSearch(Model m,Integer blog_id) {
		List<Msg_Blog_Bean> list=service.searchMsg(blog_id);
		m.addAttribute("msgSearch",list);
		return true;
	}
	
}
