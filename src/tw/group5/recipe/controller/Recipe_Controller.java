package tw.group5.recipe.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
public class Recipe_Controller {
	
	@Autowired
	private HttpSession session;
	
	@Autowired 
	private recipe_Service_interface service;

	@Autowired
	ServletContext ctx;
	
	private Blob blob;
	private String FileName;
	private List<Recipe_Bean> list;
	private ByteArrayOutputStream baos;

	@RequestMapping(path = "/frontPage.controller",method =RequestMethod.GET)
	public String frontPage(Model m) {
		List<Recipe_Bean> searchAll=service.listOfJavaBean();
		m.addAttribute("searchAll", searchAll);
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
	public String funChoose(@RequestParam String action) {
		if (action.equals("上傳食譜")) {
			if (session.getAttribute("login_ok") != null) {
				Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
				Integer mem_no = mbean.getMember_no();
				session.setAttribute("mem_no", mem_no);
				if (mbean.getMember_email() != null && mbean.getMember_password() != null) {
					System.out.println(session.getAttribute("mem_no"));
					return "redirect:/uploadPage.controller";
				}
			} else if (session.getAttribute("login_ok") == null) {
				return "redirect:/login.controller";
			}

		}
		
		
		if (action.equals("修改食譜")) {
			if (session.getAttribute("login_ok") != null) {
				Member_SignUp mbean = (Member_SignUp) session.getAttribute("login_ok");
				Integer mem_no = mbean.getMember_no();
				session.setAttribute("mem_no", mem_no);
				if (mbean.getMember_email() != null && mbean.getMember_password() != null) {
					System.out.println(session.getAttribute("mem_no"));
					return "redirect:/updatePage.controller";
				}
			} else if (session.getAttribute("login_ok") == null) {
				return "redirect:/login.controller";
			}
		}
		if ("搜尋料理".equals(action)) {
			return "redirect:/searchPage.controller";
		}
		return "recipe/recipe_workpage";
	}
	
	@GetMapping("/getALLImage.controller")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(@RequestParam String rec_id) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Recipe_Bean bean=service.getImage(rec_id);
		Blob blob=bean.getData();
		String FileName=bean.getFileName();

		String mimeType = ctx.getMimeType(FileName);
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
	
	
	@GetMapping(value = "/blogPage.controller",produces ="text/plain;charset=UTF-8" )
	public String blogPage() {
		return "recipe/recipe_blog";
	}
	
	
}


		

