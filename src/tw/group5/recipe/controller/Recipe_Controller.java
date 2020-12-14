package tw.group5.recipe.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;
import tw.group5.mall.service.ProductService;

@Controller
@SessionAttributes({ "bean", "memDetail" })
public class Recipe_Controller {

	@Autowired
	private HttpSession session;

	@Autowired
	private recipe_Service_interface service;

	@Autowired
	private ProductService mallService;

	@Autowired
	ServletContext ctx;

	@RequestMapping(path = "/frontPage.controller", method = RequestMethod.GET)
	public String frontPage(Model m) {
		List<Recipe_Bean> searchAll = service.listOfJavaBean();
		m.addAttribute("searchAll", searchAll);
		return "recipe/recipe_workpage";
	}

	@GetMapping(value = "/getPageInfo/{pageNo}")
	@ResponseBody
	public Map<String, Object> getPageInfo(@PathVariable(name = "pageNo", required = false) Integer pageNo, Model m) {
		long count = service.getRecordCounts();
		System.out.println(count);
		System.err.println(pageNo);
		Integer page = (Integer) session.getAttribute("pageNo");
		int totalPages = (int) service.getRecordCounts();// 總比數
		System.out.println("抓session 中的 page: " + page);
		if (pageNo != null) {
			page = pageNo;
			System.out.println("page: " + page);
			session.setAttribute("pageNo", page);
		}
		List<Recipe_Bean> searchAllRecipe = service.searchAllRecipe(pageNo, null);
		int totalPage = (int) Math.ceil(totalPages * 1.0 / 6);// 總頁數

//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("/recipe/recipe_workpage");
//		mav.addObject("selectAllRecipe",selectAllRecipe);
//		service.setPageNo(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchAllRecipe", searchAllRecipe);
		map.put("totalPage", totalPage);
		map.put("pageNo", pageNo);
		return map;
	}

	@GetMapping(value = "/connectMall")
	public String connectMall(@RequestParam(value = "mall_pageNo", required = false) Integer pageNo,
			@RequestParam(value = "mall_searchString", required = false) String searchString) {
		session.setAttribute("mall_pageNo", pageNo);
		session.setAttribute("mall_searchString", searchString);
		mallService.setPageNo(pageNo);
		mallService.setSearchString(searchString);

		return "mall/mall_shop";

	}
	@GetMapping(value = "/textttt")
	public String insertDetailttt() {
		System.err.println("111111111");
		return "Member_Backstage/Member_Backstage";
	}

	@PostMapping(value = "/insertDetail")
	public String insertDetail(@ModelAttribute("bean") Member_Detail bean) {
		service.insertDetail(bean);
		return "Member_Backstage/Member_Backstage";
	}

	@PostMapping(value = "/updateDetail")
	public String updateDetail(@ModelAttribute("memDetail") Member_Detail memDetail) {
		service.updateDetail(memDetail);
		return "Member_Backstage/Member_Backstage";
	}

	@GetMapping(value = "/completeDetail")
	public String completeDetail(@RequestParam(name = "mem_no", required = false) Integer mem_no, Model m) {
		Member_Detail memDetail = service.detailBean(mem_no);
		System.out.println("memDetail: " + memDetail);
		Member_Detail bean = new Member_Detail();
		bean.setMem_no(mem_no);
		m.addAttribute("memDetail", memDetail);
		m.addAttribute("bean", bean);
//		return "recipe/detailForm";
		return "redirect:/textttt";

	}
	
	@GetMapping(value="/getImageDetail")
	@ResponseBody
	public ResponseEntity<byte[]> getImageDetail(@RequestParam(name = "mem_no", required = false) Integer mem_no) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		Member_Detail bean=service.detailBean(mem_no);
		blob=bean.getData();
		fileName=bean.getFileName();
		
		String mimeType = ctx.getMimeType(fileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//				
				InputStream is = blob.getBinaryStream();
		
			byte[] b = new byte[81920];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			is.close();
			// 放入header,告知瀏覽器
			headers.setContentType(mediaType);
			//避免資料顯示錯誤.noCache()
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//				byte[] bytes = baos.toByteArray();
			re = new ResponseEntity<byte[]>(baos.toByteArray(), headers, HttpStatus.OK);

		return re;

	}
}
