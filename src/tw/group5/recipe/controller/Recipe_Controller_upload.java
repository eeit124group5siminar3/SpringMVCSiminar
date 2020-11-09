package tw.group5.recipe.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes(names={"details"})
public class Recipe_Controller_upload {
	@Autowired
	private recipe_Service_interface service;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(path = "/uploadPage.controller",method=RequestMethod.GET)
	public String uploadPage(Model m,HttpServletRequest request) {
		if (session.getAttribute("mem_no") != null) {
			Recipe_Bean bean = new Recipe_Bean();
			bean.setMember_no((Integer) session.getAttribute("mem_no"));
			System.out.println(bean.getMember_no());
			m.addAttribute("details", bean);
			return "recipe/recipe_upload";
		} else
			return "Member_SignUp/Member_Login";
	}
	
	@RequestMapping(path="/uploadSubmit.controller" ,method = {RequestMethod.POST,RequestMethod.GET} )
	public String submitProcess(@ModelAttribute("details")Recipe_Bean bean,@RequestParam String action,
//			@RequestParam(name="img")MultipartFile mFile ,
			HttpServletRequest request,Model m) throws IllegalStateException, IOException {
	
		if (action.equals("送出")) {
			System.out.println("get value");
			m.addAttribute("name", bean.getName());
			m.addAttribute("cate", bean.getCate());
			m.addAttribute("desc", bean.getDesc());
			m.addAttribute("method", bean.getMethod());
			m.addAttribute("ingredients_A", bean.getIngredients_A());
			m.addAttribute("gram_A", bean.getGram_A());
//			System.out.println("-------------------------");
//			File file=new File(bean.getFileName());
//			System.out.println(bean.getFileName());
//			System.out.println(file.getPath());
			
			//圖片新增到資料庫
//			String FileName=mFile.getOriginalFilename();
//			System.out.println(FileName);
//			String FileTempDirPath=request.getServletContext().getRealPath("/")+"UploadTempDir\\";
//			System.out.println("FileTempDirPath: "+FileTempDirPath);
//
//			File dirPath=new File(FileTempDirPath);
//			if(!dirPath.exists()) {
//				//建立新的路徑資料夾
//				boolean status = dirPath.mkdir();
//				System.out.println("status: "+status);
//			}
//			
//			
//			//新的圖片
//			String FileSavePath=FileTempDirPath+FileName;
//			File file=new File(FileSavePath);
//			//把硬碟中圖片寫入系統資料庫
//			mFile.transferTo(file);
//			System.out.println("FileSavePath: "+FileSavePath);
//
//			try {
//				if (FileName != null && FileName.length() != 0) {
////					m.addAttribute("img", bean.getImg());
//					System.out.println(bean.getImg());
//					bean.setImg(FileName);
//					FileInputStream fis = new FileInputStream(FileSavePath);
//					byte[] b = new byte[fis.available()];
//					fis.read();
//					fis.close();
//					bean.setImgData(b);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
					
			
			System.out.println("done");
			return "recipe/recipe_display";
			
		}
		
		if(action.equals("回首頁")) {
			return "recipe/recipe_workpage";
		}
		return action;
	}
	
	@RequestMapping(path="/uploadConfirm.controller" ,method = RequestMethod.POST)
	public String saveProcess(@RequestParam String action,SessionStatus status) {
//		System.out.println(session.getAttribute("recipe_check"));
		Recipe_Bean bean=(Recipe_Bean)session.getAttribute("details");
		System.out.println(bean.getName());
		System.out.println(bean.getIngredients_A());
		
		if (action.equals("送出")) {
			service.insert(bean);
//			session.removeAttribute("details");
//			status.setComplete();
			return "recipe/upload_success";
		}
		if (action.equals("修改")) {
			return "recipe/recipe_upload_revise";
		} 
		if (action.equals("回首頁")) {
			return "recipe/recipe_workpage";
		} 
//		if(status==null) {
//			return "recipe/recipe_workpage";
//		}
		return action;
	}
}
