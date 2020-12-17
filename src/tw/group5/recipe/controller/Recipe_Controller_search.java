package tw.group5.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Bookmark_Bean;
import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller_search {

	@Autowired
	private recipe_Service_interface service;

	@Autowired
	private HttpSession session;

	@Autowired
	private Bookmark_Bean bean;

	@RequestMapping(path = "/searchPage.controller", method = RequestMethod.GET)
	public String searchPage(Model m) {
		List<Recipe_Bean> searchAll = service.listOfJavaBean();
		m.addAttribute("searchAll", searchAll);
		return "recipe/recipe_search";
	}

	@GetMapping(value = "/searchSubmit.controller", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Recipe_Bean> submitProcess(@RequestParam(name = "input", required = false) String search,
			Model m) {
		List<Recipe_Bean> list = new ArrayList<Recipe_Bean>();
		if (search != null && search.length() != 0) {
			search = '%' + search + '%';
			System.out.println(search);
			list = service.ListOfSearch(search);
		}
		return list;
	}

	// recipe is include or not and search recipe
	@GetMapping(value = "/recipeDetail.controller", produces = "application/json;charset=UTF-8")
	public String recipeDetail(@RequestParam(name = "rec_id", required = false) Integer rec_id, Model m) {

		// 計算瀏覽量
		Recipe_Bean bean = service.recipeBean(rec_id);
		System.err.println("getViews(): " + bean.getViews());
		bean.setViews(bean.getViews() + 1);
		service.update(rec_id, bean);
		Integer mem_no=bean.getMember_no();
		
		if (session.getAttribute("login_ok") != null) {
			System.out.println("rec_id:" + rec_id);
			System.out.println("mem_no: " + mem_no);
			boolean flag = service.bookmarkExist(rec_id, mem_no);
			
			//搜尋會員資料
			Member_Detail detailBean=service.detailBean(mem_no);
			System.err.println("flag: " + flag);
			m.addAttribute("flag", flag);
			if (flag == true) {
				System.out.println("flag=true");
				Recipe_Bean partSearch=service.recipeBean(rec_id);
				m.addAttribute("list", partSearch);
				m.addAttribute("detailBean",detailBean);
				return "recipe/recipe_search_display";
			}
			if (flag != true) {
				System.out.println("flag=false");
				Recipe_Bean partSearch=service.recipeBean(rec_id);
				m.addAttribute("list", partSearch);
				m.addAttribute("detailBean",detailBean);
				return "recipe/recipe_search_display";
			}
		}
		if (session.getAttribute("login_ok") == null) {
			if (rec_id != null) {
				Recipe_Bean partSearch=service.recipeBean(rec_id);
				Member_Detail detailBean=service.detailBean(mem_no);
				m.addAttribute("detailBean",detailBean);
				m.addAttribute("list", partSearch);
				return "recipe/recipe_search_display";
			}
		}
		return "recipe/recipe_workpage";
	}

	// add bookmark
	@GetMapping(value = "/bookmark", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String bookmarkLogin(@RequestParam(name = "rec_id", required = false) Integer rec_id) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK = (Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no = OK.getMember_no();
			Bookmark_Bean bean = new Bookmark_Bean();
			bean.setMember_no(mem_no);
			System.out.println(mem_no);
			bean.setRec_id(rec_id);
			System.out.println(rec_id);

			List<Bookmark_Bean> bookmark = service.listOfBookmark(mem_no);
			boolean flag = service.bookmarkExist(rec_id, mem_no);
			System.err.println("flag: " + flag);
			if (bookmark.isEmpty()) {
				service.bookmark(bean);
				return "加入成功";
			} else if (flag == true) {
				System.out.println("flag=true");
				return "已經有囉~";
			} else if (flag != true) {
				System.out.println("flag=false");
				service.bookmark(bean);
				return "加入成功~";
			}

		}

		return null;
	}

	// search my bookmark
	@GetMapping(value = "/myRecipe")
	public String myRecipe(Model m) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no = mbean.getMember_no();
			List<Recipe_Bean> searchAll = service.listOfJavaBean();
			List<Bookmark_Bean> bookmark = service.listOfBookmark(mem_no);
			List<Recipe_Bean> allRecipe = new ArrayList<Recipe_Bean>();
			
			for (Bookmark_Bean bBean : bookmark) {
				for (Recipe_Bean rBean : searchAll) {
					if (bBean.getRec_id().equals(rBean.getRec_id())) {
						rBean.setMem_name(service.detailBean(rBean.getMember_no()).getName());
						allRecipe.add(rBean);
					}
				}
			}

			m.addAttribute("allRecipe", allRecipe);
			return "recipe/recipe_bookmark";
		} else {
			return "redirect:/login.controller";
		}
	}

	// delete my bookmark
	@GetMapping(value = "/removeMyRecipe", produces = "text/plain;charset=UTF-8")
	public String removeMyRecipe(@RequestParam(name = "rec_id", required = false) Integer rec_id, Model m) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no = mbean.getMember_no();
			List<Bookmark_Bean> bookmark = service.listOfBookmark(mem_no);
			Integer id = null;
			for (Bookmark_Bean bBean : bookmark) {
				if (bBean.getRec_id().equals(rec_id)) {
					id = bBean.getId();
				}
			}

			service.deleteBookmark(id);
		}
		return "redirect:/myRecipe";

	}
}