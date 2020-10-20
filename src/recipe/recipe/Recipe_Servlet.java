package recipe.recipe;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import javax.websocket.Decoder.BinaryStream;

import org.apache.catalina.Session;

import recipe.Recipe_Obj;
import recipe.DAO.Recipe_DAO;

/**
 * Servlet implementation class Recipe_Servlet
 */
@WebServlet("/Recipe_Servlet")
public class Recipe_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private static final int IMAGE_FILENAME_LENGTH = 20;
       
    public Recipe_Servlet() {
        super();
    }
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		HttpSession session = request.getSession(true); 
		session.setAttribute("memberID", "a21");
		response.setContentType("text/html;charser=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		
		if(request.getParameter("upload")!=null) {
			response.sendRedirect("recipe_upload.jsp");
		}
		if(request.getParameter("update")!=null) {
			Recipe_Servlet_update rsUpdate=new Recipe_Servlet_update();
			rsUpdate.doPost(request, response);	
			}
		if(request.getParameter("search")!=null) {
			response.sendRedirect("recipe_search.jsp");
		}
		if(request.getParameter("del")!=null) {
			Recipe_Servlet_delete rsDelete=new Recipe_Servlet_delete();
			rsDelete.doPost(request, response);	
		}
		
		
		//---------新增資料-----------
		if (request.getParameter("submit")!=null) {
			gotoSubmitProcess(request, response);
		}
		else if (request.getParameter("confirm")!=null) {
			gotoConfirmProcess(request, response);
		}
		
		//---------

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());

	}
	
	
	//---------新增資料-----------

	private void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		try {
//		System.out.println(request.getParameter("update_rec"));
		String name;
		String desc;
		String cate;
		String FileName;
		String ingredients_A;
		String ingredients_B;
		String ingredients_C;
		String ingredients_D;
		String rec_id;
		String method;
		String gram_A;
//		FileInputStream data;
//		Blob sb=null;
//		long sizeInBytes=0;
//		InputStream is = null;

//		String imgFileName;

//		Collection<Part> parts = request.getParts();	
//
//		// GlobalService.exploreParts(parts, request);
//		if (parts != null) { // 如果這是一個上傳資料的表單
//			for (Part p : parts) {
//				String fldName = p.getName();
////				System.out.println("fldName=" + fldName);
//				String value = request.getParameter(fldName);
//				if (p.getContentType() == null) { // 表示 p 為一般欄位而非上傳的表單
//					// 根據欄位名稱來讀取欄位的內容，然後存入適當的變數內
//					if (fldName.equals("name")) {
//						name = value;
//						
//					}else if (name == null || name.trim().length() == 0) {
//							errorMsgs.put("errDescription", "必須輸入描述");
//						}
//						request.setAttribute("description", name);
//				}
//				 else { // 表示此份資料是上傳的檔案
//					FileName = getFileName(p); // 由變數 p 中取出檔案名稱
//					FileName = adjustFile(FileName, IMAGE_FILENAME_LENGTH);
//				 }
//					if (FileName != null && FileName.trim().length() > 0) {
//						sizeInBytes = p.getSize();
//						is = p.getInputStream();
//					} else {
//						errorMsgs.put("errPicture", "必須挑選圖片檔");
//
//		} 
//			}
//		}else {
//			errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
//		}
//		if (!errorMsgs.isEmpty()) {
//			// 轉交給原輸入資料的網頁來顯示錯誤訊息
////			RequestDispatcher rd = request.getRequestDispatcher("ProductInsert.jsp");
////			rd.forward(request, response);
//			return;
//			}
		
		System.out.println("set value");
		desc=request.getParameter("desc").trim();
		cate=request.getParameter("cate").trim();
		name=request.getParameter("recipe_name").trim();
		ingredients_A=request.getParameter("ingredients_A").trim();
		ingredients_B=request.getParameter("ingredients_B").trim();
		ingredients_C=request.getParameter("ingredients_C").trim();
		ingredients_D=request.getParameter("ingredients_D").trim();
		method=request.getParameter("method").trim();
		gram_A=request.getParameter("gram_A").trim();
		System.out.println(request.getParameter("recipe_name"));
//		FileName=request.getParameter("img");
		
//		Recipe_Obj rObj=new Recipe_Obj();
//		rObj.setFileName("img");
		
		//呼叫fileToBlob fis轉換成blob 然後傳到資料庫  1
//		try {
//			sb=fileToBlob(FileName);
//		} catch (IOException | SQLException e) {
//			e.printStackTrace();
//			System.out.println("fileToBlob error");
//		}
//		FileInputStream fis = new FileInputStream(FileName);
//		System.out.println("fis= "+fis);
//		System.out.println(FileName);
		
		
		//2
		
//		if (FileName != null && FileName.trim().length() > 0) {
//			sizeInBytes = FileName.getBytes(FileName);
//			is = FileName.getInputStream();
//		} else {
//			errorMsgs.put("errPicture", "必須挑選圖片檔");
//		}
		
		
//		Recipe_Obj rObj=new Recipe_Obj();
//		rObj.setSb(sb);
//		sb=rObj.getSb();
//		System.out.println("rObj.getSb()= "+rObj.getSb());
		
		System.out.println("set values done");
		
		Recipe_Obj recipe_check=new Recipe_Obj(name,ingredients_A,ingredients_B,ingredients_C,ingredients_D,desc,cate,method,gram_A);
		request.getSession(true).setAttribute("recipe_check", recipe_check);
		response.sendRedirect("recipe_display.jsp");

//		}catch (Exception e) {
//			e.printStackTrace();
//			errorMsgs.put("Exception", e.getMessage());
//
//		}
		
	}

	//---------新增資料確認頁面--------
	private void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		Recipe_Obj rObj=new Recipe_Obj();
//		rObj.setRec_id("a001");
//		rObj.setName(request.getParameter("recipe_name").trim());
//		rObj.setDesc(request.getParameter("desc").trim());
//		rObj.setCate(request.getParameter("cate").trim());
//		rObj.setIngredients_A(request.getParameter("ingredients_A").trim());
//		rObj.setIngredients_B(request.getParameter("ingredients_B").trim());
//		rObj.setIngredients_C(request.getParameter("ingredients_C").trim());
//		rObj.setIngredients_D(request.getParameter("ingredients_D").trim());
//		rObj.setFileName(request.getParameter("img"));
//		rObj.setMethod(request.getParameter("method"));
//		System.out.println(request.getParameter("img"));
		Recipe_DAO rDAO=new Recipe_DAO();
//		rDAO.insert(rObj);
		
		System.out.println("call insert DAO");
		Recipe_Obj recipe_detail=(Recipe_Obj)request.getSession(true).getAttribute("recipe_check");

		if(rDAO.insert(recipe_detail)){

	          System.out.println("Get some SQL commands done!");
	          request.getSession(true).invalidate();
	          
		}
		System.out.println("over");
		response.sendRedirect("recipe_workpage.jsp");

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-----------圖片上傳-----------
	//BLOB 1
//	public static Blob fileToBlob(String imgFileName) throws IOException, SQLException {
//		File imageFile = new File(imgFileName);
//		System.out.println("imageFile= "+imageFile);
//		SerialBlob sb = null;
//		long size = imageFile.length();
//		byte[] b = new byte[(int) size];
//		try (FileInputStream fis = new FileInputStream(imageFile);) {
//			fis.read(b);
//			sb = new SerialBlob(b);
//		}
//		System.out.println();
//		System.out.println("sb= "+sb);
//		System.out.println(sb instanceof Blob);
//		
//		//把sb set到Recipe_Obj
//		Recipe_Obj rObj=new Recipe_Obj();
//		rObj.setSb(sb);
//		System.out.println("sb= "+sb.length());
//		System.out.println("sb.available()= "+sb.getBinaryStream().available());
//		System.out.println("sb.getBinaryStream= "+sb.getBinaryStream());
//		return sb;
//	}
	
	//BLOB 2
//	public static Blob fileToBlob(InputStream is, long size) throws IOException, SQLException {
//		byte[] b = new byte[(int) size];
//		SerialBlob sb = null;
//		is.read(b);
//		sb = new SerialBlob(b);
//		return sb;
//	}

	
//	public String adjustFile(String FileName, int maxLength) {
//		int length = FileName.length();
//		if (length <= maxLength) {
//			return FileName;
//		}
//		int n = FileName.lastIndexOf(".");
//		int sub = FileName.length() - n - 1;
//		FileName = FileName.substring(0, maxLength - 1 - sub) + "." + FileName.substring(n + 1);
//		return FileName;
//	}
//
//	public String getFile(final Part part) {
//		for (String content : part.getHeader("content-disposition").split(";")) {
//			if (content.trim().startsWith("filename")) {
//			}
//			return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
//		}
//		return null;
//	}




}