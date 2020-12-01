package tw.group5.recipe.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.input.ReaderInputStream;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.net.aso.m;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes(names={"login_ok"})
public class Recipe_Controller_update {
	
	@Autowired
	private recipe_Service_interface service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	ServletContext ctx;
	
	private Blob blob;
	private String FileName;
	private List<Recipe_Bean> list;
	private ByteArrayOutputStream baos;
	private Integer  mem_no;
	private Recipe_Bean bean;
	
	@RequestMapping(path = "/updatePage.controller",method = RequestMethod.GET)
	public String updatePage(Model m) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
			mem_no=OK.getMember_no();
			System.out.println(mem_no);
			bean = new Recipe_Bean();
			bean.setMember_no(mem_no);
			
			List<Recipe_Bean> list = service.listOfJavaBean();
			List<Recipe_Bean> user_recipe = new ArrayList<Recipe_Bean>();
			System.out.println("------------------------------------");
			for (Recipe_Bean b : list) {
				System.out.println(b.getMember_no());
				if (b.getMember_no().equals(bean.getMember_no())) {
					user_recipe.add(b);
				}
			}
			m.addAttribute("user_recipe", user_recipe);
			return "recipe/recipe_update_choose";
		} else
			return "Member_SignUp/Member_Login";
	}
	
	//update_choose
	@RequestMapping(path = "/updateProcess.controller",method = {RequestMethod.POST,RequestMethod.GET})
	public String updateProcess(
			@RequestParam(name="choose",required = false)String rec_id,Model m) throws FileNotFoundException, IOException, SQLException {
		
		if (rec_id!=null) {
			System.out.println(rec_id);
			List<Recipe_Bean_noImage> list = service.partSearch(rec_id);
			
			m.addAttribute("recipe_table", list);
			return "recipe/recipe_update";
		
		}else
			return "redirect:/updatePage.controller";
	}
	
	
	//update_choose ajax
	@GetMapping(value="/deleteConfirm")
	public  String deleteConfirm(@RequestParam(name="rec_id")String rec_id,Model m) {
		service.delete(rec_id);
		Integer mem_no=bean.getMember_no();
		System.out.println("mem_no: "+mem_no);
		List<Recipe_Bean> list=service.listOfJavaBean();
		List<Recipe_Bean> user_recipe=new ArrayList<Recipe_Bean>();

		for(Recipe_Bean r:list) {
			if(r.getMember_no()==(mem_no)) {
				user_recipe.add(r);

			}
		}
		m.addAttribute("user_recipe", user_recipe);	
//		return new ModelAndView("recipe/recipe_update_choose") ;
		return "redirect:/updatePage.controller";

	}
	
	//update
	@RequestMapping(path = "/submitChoose.controller",method = RequestMethod.POST)
	public String submitChoose(@RequestParam String action,@RequestParam MultipartFile multipartFile,
		Recipe_Bean bean,String rec_id) throws SerialException, IOException, SQLException {
		bean.setMember_no(mem_no);
		bean.setMultipartFile(multipartFile);
		if(action.equals("確認修改")) {
			service.update(rec_id, bean);
			return "redirect:/updatePage.controller";
		}
		if(action.equals("刪除")) {
			service.delete(rec_id);
			return "redirect:/updatePage.controller";
		}

		return rec_id;
	}
	
	
	//getImage
	@GetMapping("/getImage.controller")
	@ResponseBody
	public ResponseEntity<byte[]> getImage() throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		for (Recipe_Bean b : list) {
			blob = b.getData();
			FileName = b.getFileName();
		}
		System.out.println("----------------");
		System.out.println(blob);

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
	
}