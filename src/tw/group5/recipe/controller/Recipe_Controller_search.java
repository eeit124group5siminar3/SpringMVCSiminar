package tw.group5.recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller_search {
	
	@Autowired 
	private recipe_Service_interface service;


	@RequestMapping(path = "/searchPage.controller",method = RequestMethod.GET)
	public String searchPage() {
		return "recipe/recipe_search";
	}
	
	@RequestMapping(path = "/searchSubmit.controller",method = RequestMethod.POST)
	public String submitProcess(@RequestParam(name = "input")String search,@RequestParam String action,Model m) {
		if (action.equals("查詢")) {
			System.out.println(search);
			List<Recipe_Bean> list = service.ListOfSearch(search);
			for (Recipe_Bean r : list) {
				System.out.println(r.getRec_id());
			m.addAttribute("List", list);

			return "recipe/recipe_search_display";
		}
		}
		if (action.equals("回首頁")) {
			return "recipe/recipe_workpage";
		}
		return action;
	}
}
