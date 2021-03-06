package tw.group5.recipe.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
//import tw.group5.recipe.recipe_Bean.Recipe_Bean_noImage;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes(names={"login_ok","updateBean"})
public class Recipe_Controller_update {
	
	@Autowired
	private recipe_Service_interface service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	ServletContext ctx;
	private Integer  mem_no;
	private	Integer fieldRec_id;
	
	@RequestMapping(path = "/updatePage.controller",method = RequestMethod.GET)
	public String updatePage(Model m) {
		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK=(Member_SignUp) session.getAttribute("login_ok");
			mem_no=OK.getMember_no();
			System.out.println(mem_no);
			
			Recipe_Bean updateBean=new Recipe_Bean();
			updateBean.setMember_no(mem_no);
			
			List<Recipe_Bean> list = service.listOfJavaBean();
			List<Recipe_Bean> user_recipe = new ArrayList<Recipe_Bean>();
			for (Recipe_Bean b : list) {
				System.out.println(b.getMember_no()); 
				
				if (b.getMember_no().equals(mem_no)) {
					user_recipe.add(b);
				} 
			}
			m.addAttribute("updateBean",updateBean);
			m.addAttribute("user_recipe", user_recipe);
			return "recipe/recipe_update_choose";
		} else
			return "Member_SignUp/Member_Login";
	}
	
	
	
	//update_choose ajax  頁面彈出浮動視窗
	@GetMapping(value = "/updateProcess.controller")
	public ModelAndView updateProcess(@RequestParam(name = "rec_id", required = false) Integer rec_id, Model m)
			throws FileNotFoundException, IOException, SQLException {
		fieldRec_id = rec_id;
		System.out.println(rec_id);
		List<Recipe_Bean> list = service.partSearch(rec_id);
		Recipe_Bean updateBean = service.recipeBean(rec_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/recipe/updateForm");
		mav.addObject("recipe_table", list);
		mav.addObject("updateBean", updateBean);
		return mav;
	}
	

	//update  
	@PostMapping(value = "/updateRecipe")
	public String updateRecipe(@ModelAttribute("updateBean")Recipe_Bean updateBean){
		System.out.println(fieldRec_id);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) +1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date=year + "-" + month + "-" + day;
		System.out.println("date: "+date);
		updateBean.setUpdate_date(date);
		service.update(fieldRec_id, updateBean);
		return "redirect:/updatePage.controller";

	}
	
	
	//delete ajax
	@GetMapping(value="/deleteConfirm")
	public  String deleteConfirm(@RequestParam(name="rec_id")Integer rec_id,Model m) {
		service.delete(rec_id);
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
	
	@GetMapping(value="/getImageA")
	@ResponseBody
	public ResponseEntity<byte[]> getImageA(@RequestParam(name="rec_id", required = false)Integer rec_id) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		List<Recipe_Bean> list=service.getAllImage();
		if (rec_id != null) {
			for (Recipe_Bean b : list) {
				if (b.getRec_id().equals(rec_id)) {
					blob = b.getData_A();
					fileName = b.getFileName_A();
				}
			}
		} else {
			for (Recipe_Bean b : list) {
				blob = b.getData_A();
				fileName = b.getFileName_A();
			}
		}
		
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
	
	@GetMapping(value="/getImageB")
	@ResponseBody
	public ResponseEntity<byte[]> getImageB(@RequestParam(name="rec_id", required = false)Integer rec_id) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		List<Recipe_Bean> list=service.getAllImage();
		if (rec_id != null) {
			for (Recipe_Bean b : list) {
				if (b.getRec_id().equals(rec_id)) {
					blob = b.getData_B();
					fileName = b.getFileName_B();
				}
			}
		} else {
			for (Recipe_Bean b : list) {
				blob = b.getData_B();
				fileName = b.getFileName_B();
			}
		}
		
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
	
	@GetMapping(value="/getImageC")
	@ResponseBody
	public ResponseEntity<byte[]> getImageC(@RequestParam(name="rec_id", required = false)Integer rec_id) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		List<Recipe_Bean> list=service.getAllImage();
		if (rec_id != null) {
			for (Recipe_Bean b : list) {
				if (b.getRec_id().equals(rec_id)) {
					blob = b.getData_C();
					fileName = b.getFileName_C();
				}
			}
		} else {
			for (Recipe_Bean b : list) {
				blob = b.getData_C();
				fileName = b.getFileName_C();
			}
		}
		
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
	
	@GetMapping(value="/getImageD")
	@ResponseBody
	public ResponseEntity<byte[]> getImageD(@RequestParam(name="rec_id", required = false)Integer rec_id) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		List<Recipe_Bean> list=service.getAllImage();
		if (rec_id != null) {
			for (Recipe_Bean b : list) {
				if (b.getRec_id().equals(rec_id)) {
					blob = b.getData_D();
					fileName = b.getFileName_D();
				}
			}
		} else {
			for (Recipe_Bean b : list) {
				blob = b.getData_D();
				fileName = b.getFileName_D();
			}
		}
		
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
	
	@GetMapping(value="/getImageE")
	@ResponseBody
	public ResponseEntity<byte[]> getImageE(@RequestParam(name="rec_id", required = false)Integer rec_id) throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		List<Recipe_Bean> list=service.getAllImage();
		if (rec_id != null) {
			for (Recipe_Bean b : list) {
				if (b.getRec_id().equals(rec_id)) {
					blob = b.getData_E();
					fileName = b.getFileName_E();
				}
			}
		} else {
			for (Recipe_Bean b : list) {
				blob = b.getData_E();
				fileName = b.getFileName_E();
			}
		}
		
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