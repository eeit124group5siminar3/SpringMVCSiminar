package tw.group5.recipe.recipe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Recipe_Controller_search {
	
	@RequestMapping(path = "/searchPage.controller",method = RequestMethod.GET)
	public String searchProcess() {
		return "recipe/recipe_search";
	}
	
	
	
	
	
	
	
	
}
