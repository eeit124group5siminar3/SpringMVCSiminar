//package tw.group5.mall.product;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import tw.group5.mall.model.ProductBean;
//import tw.group5.mall.service.ProductService;
//import tw.group5.member_SignUp.model.Member_SignUp;
//
////@WebServlet("/ProductInsertServlet")
//
//// 啟動檔案上傳的功能：
//// 1. <form>標籤的 method屬性必須是"post", 而且
//// enctype屬性必須是"multipart/form-data"
//// 注意：enctype屬性的預設值為"application/x-www-form-urlencoded"
//// 2. 定義可以挑選上傳檔案的表單欄位：
//// <input type='file' name='user-defined_name' />
//// 註: HTTP multipart request: 由Http客戶端(如瀏覽器)所建構的ㄧ種請求，用來
//// 同時上傳表單資料與檔案。
////
//// what-should-a-multipart-http-request-with-multiple-files-look-like?
//// http://stackoverflow.com/questions/913626/what-should-a-multipart-http-request-with-multiple-files-look-like
//
//// 在Servlet 3.0中，若要能夠處理瀏覽器送來的multipart request, Servlet必須
//// 以註釋『javax.servlet.annotation.MultipartConfig』來宣告。
////
//// MultipartConfig的屬性說明:
//// location: 上傳之表單資料與檔案暫時存放在Server端之路徑。此路徑必須存在。
//// fileSizeThreshold: 檔案的大小臨界值，超過此臨界值，上傳檔案會用存放在硬碟，
//// 否則存放在主記憶體。
//// maxFileSize: 上傳單一檔案之長度限制，如果超過此數值，Container會丟出例外
//// maxRequestSize: 上傳所有檔案的總長度限制，如果超過此數值，Container會丟出例外
////@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
////		* 1024 * 500 * 5)
//@Controller
//@SessionAttributes(names = { "successMsg", "SelectCategoryTag" })
//public class ProductInsertServlet {
//	public static final int IMAGE_FILENAME_LENGTH = 20;
//	@Autowired
//	private ProductService productService;
//
//	@PostMapping(value = "/ProductInsertServlet")
//	public String productInsertServlet(Model model, @ModelAttribute(value = "Insert") ProductBean insert,
//			@RequestParam(value = "categoryId") Integer category,
//			@SessionAttribute(value = "login_ok") Member_SignUp mb) {
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		Map<String, String> successMsgs = new HashMap<String, String>();
//		model.addAttribute("ErrMsg", errorMsgs);
//		model.addAttribute("successMsg", successMsgs);
//		productService.setId(category);
//		insert.setCategory(category);
//		productService.getCategoryById();
//		insert.setCategoryBean(productService.getCategoryById());
//		Integer producterId = mb.getMember_no();
//		insert.setProducterId(producterId);
//		productService.saveProduct(insert);
//		String categoryTag = productService.getSelectTag();
//		model.addAttribute("SelectCategoryTag", categoryTag);
//		successMsgs.put("success", "資料新增成功");
//		return "/mall/ProductInsert";
//	}
//}
//
////		request.setCharacterEncoding("UTF-8");
////		response.setContentType("text/html; charset=UTF-8");
////		Map<String, String> errorMsgs = new HashMap<String, String>();
////		Map<String, String> successMsgs = new HashMap<String, String>();
////		HttpSession session = request.getSession();
////		request.setAttribute("ErrMsg", errorMsgs);
////		session.setAttribute("successMsg", successMsgs);
//
////		try {
////			String product = "";
////			int producterId =0;
////			String priceStr = "";
////			double price = 0;
////			String categoryStr = "";
////			String fileName = "";
////			InputStream is = null;
////			long sizeInBytes = 0;
////			String unit = "";
////			String description = "";
////			String stockStr = "";
////			int stock = 0;
////			String shelfTimeStr = "";
////			int shelfTime = 0;
////			String contentStr = "";
////			int content = 0;
////
////			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
////			// javax.servlet.http.Part: 代表上傳到Server的資料，可以是正常的表單資料(form data)，
////			// 也可以上傳的檔案。
////			// Part介面可以:
////			// 1. 傳回欄位的名稱(<input>的name屬性)、大小、ContentType
////			// 2. 每個Part的Header
////			// 3. 刪除Part
////			// 4. 將Part寫入硬碟
////			Collection<Part> parts = request.getParts();
////
////			// GlobalService.exploreParts(parts, request);
////			if (parts != null) { // 如果這是一個上傳資料的表單
////				for (Part p : parts) {
////					String fldName = p.getName();
//////					System.out.println("fldName=" + fldName);
////					String value = request.getParameter(fldName);
////					if (p.getContentType() == null) { // 表示 p 為一般欄位而非上傳的表單
////						// 根據欄位名稱來讀取欄位的內容，然後存入適當的變數內
////						if (fldName.equals("product")) {
////							product = value;
////							if (value == null || product.trim().length() == 0) {
////								errorMsgs.put("errProduct", "必須輸入品名");
////							} else {
////								request.setAttribute("product", product);
////							}
////						}else if (fldName.equals("price")) {
////							priceStr = value;
////							priceStr = priceStr.trim();
////							if (priceStr == null || priceStr.trim().length() == 0) {
////								errorMsgs.put("errPrice", "必須輸入價格");
////							} else {
////								try {
////									price = Double.parseDouble(priceStr);
////								} catch (NumberFormatException e) {
////									errorMsgs.put("errPrice", "價格必須是數值");
////								}
////							}
////							request.setAttribute("price", priceStr);
////						} else if (fldName.equals("stock")) {
////							stockStr = value;
////							stockStr = stockStr.trim();
////							if (stockStr == null || stockStr.trim().length() == 0) {
////								errorMsgs.put("errStock", "必須輸入數量");
////							} else {
////								try {
////									stock = Integer.parseInt(stockStr);
////								} catch (NumberFormatException e) {
////									errorMsgs.put("errStock", "數量必須是數值");
////								}
////							}
////							request.setAttribute("stock", stockStr);
////						} else if (fldName.equals("shelfTime")) {
////							shelfTimeStr = value;
////							shelfTimeStr = shelfTimeStr.trim();
////							if (shelfTimeStr == null || shelfTimeStr.trim().length() == 0) {
////								errorMsgs.put("errShelfTime", "必須輸入保質期");
////							} else {
////								try {
////									shelfTime = Integer.parseInt(shelfTimeStr);
////								} catch (NumberFormatException e) {
////									errorMsgs.put("errShelfTime", "保質期必須是數值");
////								}
////							}
////							request.setAttribute("shelfTime", shelfTimeStr);
////						} else if (fldName.equals("content")) {
////							contentStr = value;
////							contentStr = contentStr.trim();
////							if (contentStr == null || contentStr.trim().length() == 0) {
////								errorMsgs.put("errContent", "必須輸入單位數量");
////							} else {
////								try {
////									content = Integer.parseInt(contentStr);
////								} catch (NumberFormatException e) {
////									errorMsgs.put("errContent", "單位數量必須是數值");
////								}
////							}
////							request.setAttribute("content", contentStr);
////						} else if (fldName.equals("unit")) {
////							unit = value;
////							;
////							if (unit == null || unit.trim().length() == 0) {
////								errorMsgs.put("errUnit", "必須輸入單位");
////							} else {
////								request.setAttribute("unit", unit);
////							}
////						} else if (fldName.equals("description")) {
////							description = value;
////							;
////							if (description == null || description.trim().length() == 0) {
////								errorMsgs.put("errDescription", "必須輸入描述");
////							}
////							request.setAttribute("description", description);
////						} else if (fldName.equals("categoryId")) {
////							categoryStr = value;
////							;
////							if (categoryStr == null || categoryStr.trim().length() == 0) {
////								errorMsgs.put("errCategory", "必須輸入類型");
////							}
////							request.setAttribute("category", categoryStr);
////						}
////
////					} else { // 表示此份資料是上傳的檔案
////						fileName = getFileName(p); // 由變數 p 中取出檔案名稱
////						System.out.println(fileName);
////						fileName = adjustFileName(fileName, IMAGE_FILENAME_LENGTH);
////						if (fileName != null && fileName.trim().length() > 0) {
////							sizeInBytes = p.getSize();
////							is = p.getInputStream();
////						} else {
////							errorMsgs.put("errPicture", "必須挑選圖片檔");
////						}
////					}
////				}
////			} else {
////				errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
////			}
////			// 如果輸入資料有錯誤
////			if (!errorMsgs.isEmpty()) {
////				// 轉交給原輸入資料的網頁來顯示錯誤訊息
////				RequestDispatcher rd = request.getRequestDispatcher("mall/ProductInsert.jsp");
////				rd.forward(request, response);
////				return;
////			}
////
//////			// 將上傳的檔案轉換為 Blob 物件
//////			Blob blob = SystemUtils2018.fileToBlob(is, sizeInBytes);
////////			SessionFactory factory = HibernateUtil.getSessionFactory();
////////			Session hibernateSession = factory.getCurrentSession();
////////			ProductService productService = new ProductService(hibernateSession);
//////			//
//////			int category=Integer.parseInt(categoryStr);
//////			productService.setId(category);
////			Member_SignUp mb=(Member_SignUp)session.getAttribute("login_ok");
////			producterId=mb.getMember_no();
//////			producterId="123";
////			ProductBean bb = new ProductBean(product, producterId, price, blob, fileName, stock, null, shelfTime,
////					content, unit, description, category);
////			productService.saveProduct(bb);
////			successMsgs.put("success", "資料新增成功");
////			// 新增成功，通知瀏覽器對新網址發出請求
////			response.sendRedirect(response.encodeRedirectURL("mall/ProductInsert.jsp"));
////			return;
////		} catch (Exception e) {
////			e.printStackTrace();
////			errorMsgs.put("Exception", e.getMessage());
////			RequestDispatcher rd = request.getRequestDispatcher("mall/ProductInsert.jsp");
////			rd.forward(request, response);
////		}
////	}
////
////	public String adjustFileName(String fileName, int maxLength) {
////		int length = fileName.length();
////		if (length <= maxLength) {
////			return fileName;
////		}
////		int n = fileName.lastIndexOf(".");
////		int sub = fileName.length() - n - 1;
////		fileName = fileName.substring(0, maxLength - 1 - sub) + "." + fileName.substring(n + 1);
////		return fileName;
////	}
////
////	public String getFileName(final Part part) {
////		for (String content : part.getHeader("content-disposition").split(";")) {
////			if (content.trim().startsWith("filename")) {
////			}
////			return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
////		}
////		return null;
////	}
////
////	// 本方法於主控台印出 parts 內的重要資訊，純粹為觀察用，沒有功能上的用途。
////	public void exploreParts(Collection<Part> parts, HttpServletRequest req) {
////		try {
////			for (Part part : parts) {
////				String name = part.getName();
////				String contentType = part.getContentType();
////				String value = "";
////				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
////				try (InputStream is = part.getInputStream();) {
////					if (contentType != null) { // 表示該part為檔案
////						// 取出上傳檔案的檔名
////						String filename = getFileName(part);
////						// 將上傳的檔案寫入到location屬性所指定的資料夾
////						part.write(filename);
////					} else { // 表示該part為一般的欄位
////						// 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
////						part.write("part_" + name);
////						value = req.getParameter(name);
////					}
////					System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
////				}
////			}
////		} catch (IOException e) {
////			e.printStackTrace();
////		}
////	}
////
////}
