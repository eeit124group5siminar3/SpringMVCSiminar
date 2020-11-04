package tw.group5.recipe.recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
//@SessionAttributes(names={"recipe_check"})
public class Recipe_Controller_upload {
	@Autowired
	private recipe_Service_interface service;
	
	@RequestMapping(path = "/uploadPage.controller",method=RequestMethod.GET)
	public String uploadPage(Model m) {
		Recipe_Bean bean=new Recipe_Bean();
		m.addAttribute("details",bean);
		return "recipe/recipe_upload";
	}
	
	@RequestMapping(path="/uploadSubmit.controller" ,method = RequestMethod.POST )
	public String submitProcess(@ModelAttribute("details")Recipe_Bean bean,Model m) {
		System.out.println("get value");
		
		m.addAttribute("name",bean.getName());
		m.addAttribute("cate", bean.getCate());
		m.addAttribute("desc", bean.getDesc());
		m.addAttribute("method", bean.getMethod());
		m.addAttribute("ingredients_A", bean.getIngredients_A());
		m.addAttribute("gram_A", bean.getGram_A());
		System.out.println("done");	
		
		System.out.println("enter saveProcess");
		saveProcess(bean);
		return "recipe/recipe_display";
	}
	
	@RequestMapping(path="/uploadConfirm.controller" ,method = RequestMethod.POST )
	public String saveProcess(Recipe_Bean bean) {
		service.insert(bean);
		return "recipe/upload_success";
	}
}