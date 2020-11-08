package tw.group5.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller_update {
	
	@Autowired
	private recipe_Service_interface service;
	
	private Recipe_Bean bean;

	@RequestMapping(path = "/updatePage.controller",method = RequestMethod.GET)
	public String updatePage(Model m) {
		List<Recipe_Bean> list=service.listOfJavaBean();
		List<Recipe_Bean> user_recipe=new ArrayList<Recipe_Bean>();
		for (Recipe_Bean b : list) {
			System.out.println(b.getMember_no());
					if (b.getMember_no()==1) {
						user_recipe.add(b);
				}
			}
		m.addAttribute("user_recipe",user_recipe);
		return "recipe/recipe_update_choose";
	}
	
	@RequestMapping(path = "/updateProcess.controller",method = {RequestMethod.POST,RequestMethod.GET})
	public String updateProcess(
			@RequestParam(name="choose",required = false)String rec_id,
//			@RequestParam(name="action")String rec_id,
			@RequestParam(required = false)String action,Recipe_Bean bean,Model m) {
		if ("回首頁".equals(action)) {
			return "recipe/recipe_workpage";
		} 
		else {
		System.out.println(rec_id);
		List<Recipe_Bean> list = service.partSearch(rec_id);
		m.addAttribute("recipe_table", list);
		return "recipe/recipe_update";
		}

	}
	
	@RequestMapping(path = "/submitChoose.controller",method = RequestMethod.POST)
	public String submitChoose(@RequestParam String action,Recipe_Bean bean,String rec_id) {
		bean.setMember_no(1);
		if(action.equals("確認修改")) {
			service.update(rec_id, bean);
			return "recipe/update_success";
		}
		if(action.equals("刪除")) {
			service.delete(rec_id);
			return "recipe/delete_success";
		}
		if (action.equals("取消")) {
			return "recipe/recipe_workpage";
		}
		return rec_id;
	}
	
}
