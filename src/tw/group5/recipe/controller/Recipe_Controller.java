package tw.group5.recipe.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Recipe_Controller {
	
	@RequestMapping(path = "/frontpage.controller",method =RequestMethod.GET)
	public String frontpage() {
			return "recipe/recipe_workpage";
	}
	
	
	@RequestMapping(path = "/workpage.controller",method = RequestMethod.POST)
	public String workpage(@RequestParam(name="back",required = false)String back) {
		if(back!=null) {
			return "recipe/recipe_workpage";
		}
		return back;
	}
	
	@RequestMapping(path = "/function.controller",method = RequestMethod.POST)
	public void funChoose(@RequestParam String action,HttpServletResponse response) throws IOException {
		if(action.equals("上傳食譜")) {
			response.sendRedirect("./uploadPage.controller");
		}
		if(action.equals("修改食譜")) {
			response.sendRedirect("./updatePage.controller");
		}
		if(action.equals("搜尋料理")) {
			response.sendRedirect("./searchPage.controller");
		}
	}
}
