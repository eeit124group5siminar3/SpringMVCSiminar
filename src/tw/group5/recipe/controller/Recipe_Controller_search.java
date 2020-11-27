package tw.group5.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller_search {
	
	@Autowired 
	private recipe_Service_interface service;
		
	@RequestMapping(path = "/searchPage.controller",method = RequestMethod.GET)
	public String searchPage(Model m) {
		List<Recipe_Bean> searchAll=service.listOfJavaBean();
		m.addAttribute("searchAll", searchAll);
		return "recipe/recipe_search";
	}
	
	
	@GetMapping(value="/searchSubmit.controller" ,produces = "application/json;charset=UTF-8")
//	@RequestMapping(path = "/searchSubmit.controller",method = {RequestMethod.POST,RequestMethod.GET})
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
	
	@GetMapping(value="/recipeDetail.controller" ,produces = "application/json;charset=UTF-8")
	public String recipeDetail(@RequestParam(name="rec_id",required = false)String rec_id,Model m){
		if (rec_id !=null && rec_id.length() !=0) {
			List<Recipe_Bean_noImage> list=service.partSearch(rec_id);
			m.addAttribute("List", list);
			return "recipe/recipe_search_display";
		}
		return rec_id;
	}
	

	
	
	
	}
