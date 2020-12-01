package tw.group5.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.model.ProductBean;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller_search {
	
	@Autowired 
	private recipe_Service_interface service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Bookmark_Bean bean;
		
	@RequestMapping(path = "/searchPage.controller",method = RequestMethod.GET)
	public String searchPage(Model m) {
		List<Recipe_Bean> searchAll=service.listOfJavaBean();
		m.addAttribute("searchAll", searchAll);
		return "recipe/recipe_search";
	}
	
	
	@GetMapping(value="/searchSubmit.controller" ,produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Recipe_Bean_noImage> submitProcess(
			@RequestParam(name = "input",required = false)String search,
//			@RequestParam(required = false) String action,
//			@RequestParam(name="rec_id",required = false)String rec_id,
			Model m) {
		Map<String, Object> map = new HashMap<String, Object>();
//		Map<String, Object> json = new HashMap<String, Object>();
//		m.addAttribute("map", map);
		List<Recipe_Bean_noImage> list=new ArrayList<Recipe_Bean_noImage>();
//		if ("Search".equals(action)) {
			if (search !=null && search.length() != 0) {				
				search='%'+search+'%';
				System.out.println(search);
				list = service.ListOfSearch(search);
//				for (Recipe_Bean_noImage r : list) {
//					System.out.println(r.getRec_id());
//					list2.add(r);
//					m.addAttribute("List", list);
//					map.put("List", list);
			}
					System.out.println(list);
					return list;
//			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.CREATED);
//			}
//			m.addAttribute("map", map);
//			System.out.println(map.);
//			return new ModelAndView("recipe/recipe_search_display");
				
//		if (search==null || search.length()==0) {
//			errors.put("msg","請輸入");
//			return "redirect:/searchPage.controller";
//		}
//		}
		
//		if (rec_id !=null && rec_id.length() !=0) {
//			list=service.partSearch(rec_id);
//			m.addAttribute("List", list);
//			return "recipe/recipe_search_display";
//		}
		
//		if (action.equals("回首頁")) {
//			return "recipe/recipe_workpage";
//		}
//		return "成功!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";
	}
	
	//recipe is include or not  and search recipe
	@GetMapping(value="/recipeDetail.controller" ,produces = "application/json;charset=UTF-8")
	public String recipeDetail(@RequestParam(name="rec_id",required = false)String rec_id,Model m){
		
		//計算瀏覽量
		Recipe_Bean bean=service.getImage(rec_id);
		System.err.println("getViews(): "+bean.getViews());
		bean.setViews(bean.getViews()+1);
		service.update(rec_id, bean);
		
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no=OK.getMember_no();
			System.out.println("rec_id:"+rec_id);
			System.out.println("mem_no: "+mem_no);
			boolean flag=service.bookmarkExist(rec_id,mem_no);
			System.err.println("flag: "+flag);
			m.addAttribute("flag",flag);
			if(flag==true) {
				System.out.println("flag=true");
				
				List<Recipe_Bean_noImage> list=service.partSearch(rec_id);
				m.addAttribute("list", list);
				return "recipe/recipe_search_display";
			}
			if(flag!=true){
				System.out.println("flag=false");
				List<Recipe_Bean_noImage> list=service.partSearch(rec_id);
				m.addAttribute("list",list);
				System.out.println("list: "+list);
				return "recipe/recipe_search_display";	
			}
		}
		if (session.getAttribute("login_ok") == null) {
			if (rec_id != null && rec_id.length() != 0) {
				List<Recipe_Bean_noImage> list = service.partSearch(rec_id);
				System.err.println(list);
				m.addAttribute("List", list);
				return "recipe/recipe_search_display";
			}
	}
		return rec_id;
	}
	

	//add bookmark
	@GetMapping(value="/bookmark",produces ="text/plain;charset=UTF-8")
	@ResponseBody
	public String bookmarkLogin(@RequestParam(name="rec_id",required = false)String rec_id) {
		Map<String, Object> map=new HashMap<String, Object>();
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no=OK.getMember_no();
			Bookmark_Bean bean = new Bookmark_Bean();
			bean.setMember_no(mem_no);
			System.out.println(mem_no);
			bean.setRec_id(rec_id);
			System.out.println(rec_id);
			
			List<Bookmark_Bean> bookmark=service.listOfBookmark(mem_no);
			for(Bookmark_Bean b:bookmark) {
				System.out.println(b.getRec_id());
				if(b.getRec_id().equals(rec_id)) {
					System.err.println(1);
					return "已經新增過囉~";
				}else {
					service.bookmark(bean);
					return "新增成功~";				
				}
			}
			if(bookmark.isEmpty()) {
				service.bookmark(bean);
				return "新增成功~";	
			}
		}
		
		return  rec_id;
	}
	
	
	// search my bookmark
	@GetMapping(value="/myRecipe")
	public String myRecipe(Model m) {
		List<Recipe_Bean> searchLove=new ArrayList<Recipe_Bean>();
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no = mbean.getMember_no();	
			List<Recipe_Bean> searchAll=service.listOfJavaBean();
			List<Bookmark_Bean> bookmark=service.listOfBookmark(mem_no);
			List<Bookmark_Bean> myRecipe=new ArrayList<Bookmark_Bean>();
			List<Recipe_Bean> allRecipe=new ArrayList<Recipe_Bean>();
			for(Bookmark_Bean bBean:bookmark) {
				for(Recipe_Bean rBean:searchAll) {
					if(bBean.getRec_id().equals(rBean.getRec_id())) {
						allRecipe.add(rBean);
						System.out.println(rBean.getName());
					}
				}
			}
			
			m.addAttribute("allRecipe",allRecipe);
			return "recipe/recipe_bookmark";
		}else {
			return "redirect:/login.controller";
		}
	}
	
	
	//delete my bookmark
	@GetMapping(value = "/removeMyRecipe",produces ="text/plain;charset=UTF-8")
	public String removeMyRecipe(@RequestParam(name="rec_id",required = false)String rec_id,Model m) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no = mbean.getMember_no();	
			List<Bookmark_Bean> bookmark=service.listOfBookmark(mem_no);
			String id = null;
			for(Bookmark_Bean bBean:bookmark) {
				if(bBean.getRec_id().equals(rec_id)) {
					id=bBean.getId();
					System.out.println(bBean.getId());
				}
			}
			
			service.deleteBookmark(id);
			System.err.println("delete succccccccccccces");
		}
		return "redirect:/myRecipe";

	}
}