package tw.group5.recipe.controller;

import java.io.ByteArrayOutputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.recipe.recipe_Bean.Recipe_Bean;
//import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
import tw.group5.recipe.service.recipe_Service_interface;
import tw.group5.mall.service.ProductService;

@Controller
public class Recipe_Controller {
	
	@Autowired
	private HttpSession session;
	
	@Autowired 
	private recipe_Service_interface service;
	
	@Autowired
	private ProductService mallService;

	@Autowired
	ServletContext ctx;	

	@RequestMapping(path = "/frontPage.controller",method =RequestMethod.GET)
	public String frontPage(Model m) {
		List<Recipe_Bean> searchAll=service.listOfJavaBean();
		m.addAttribute("searchAll", searchAll);
		return "recipe/recipe_workpage";
	}
	
	@GetMapping(value="/getPageInfo/{pageNo}")
	@ResponseBody
	public Map<String, Object> getPageInfo(@PathVariable(name="pageNo",required = false)Integer pageNo,Model m) {
		long count=service.getRecordCounts();
		System.out.println(count);
		System.err.println(pageNo);
		Integer page=(Integer) session.getAttribute("pageNo");
		int totalPages =(int) service.getRecordCounts();//總比數
		System.out.println("抓session 中的 page: "+page);
		if(pageNo!=null) {
			page=pageNo;
			System.out.println("page: "+page);
			session.setAttribute("pageNo", page);
		}
		List<Recipe_Bean> searchAllRecipe=service.searchAllRecipe(pageNo, null);
		int totalPage =(int) Math.ceil(totalPages*1.0 /2);//總頁數

//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("/recipe/recipe_workpage");
//		mav.addObject("selectAllRecipe",selectAllRecipe);
//		service.setPageNo(pageNo);
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("searchAllRecipe", searchAllRecipe);
		map.put("totalPage",totalPage);
		map.put("pageNo",pageNo);
		return map;
	}
	
	@GetMapping(value="/connectMall")
	public String connectMall(
			@RequestParam(value = "mall_pageNo", required = false) Integer pageNo,
			@RequestParam(value = "mall_searchString", required = false) String searchString) {
		session.setAttribute("mall_pageNo", pageNo);
		session.setAttribute("mall_searchString", searchString);
		mallService.setPageNo(pageNo);
		mallService.setSearchString(searchString);
		
		return "mall/mall_shop";	
		
	}
	
	

}		

