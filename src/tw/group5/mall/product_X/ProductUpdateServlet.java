package tw.group5.mall.product_X;
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
////@WebServlet("/ProductUpdateServlet")
////@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
////		* 1024 * 500 * 5)
//@Controller
//@SessionAttributes(names = { "successMsg", "MaintainPageNo", "bean" })
//public class ProductUpdateServlet {
//	public static final int IMAGE_FILENAME_LENGTH = 20;
//	@Autowired
//	private ProductService productService;
//
//	@PostMapping(value = "/ProductUpdateServlet")
//	public String productUpdateServlet(@ModelAttribute(value = "bean") ProductBean bb, Model model,
//			@RequestParam(value = "categoryId") Integer category,
//			@SessionAttribute(value = "login_ok") Member_SignUp mb,
//			@SessionAttribute(value = "MaintainPageNo") Integer maintainPageNo) {
//		System.err.println(bb.hashCode());
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		Map<String, String> successMsgs = new HashMap<String, String>();
//		model.addAttribute("ErrMsg", errorMsgs);
//		model.addAttribute("successMsg", successMsgs);
//		productService.setId(category);
//		bb.setCategoryBean(productService.getCategoryById());
//		productService.updateProduct(bb);
//
//		return "redirect:DisplayMaintainProduct?MaintainPageNo=" + maintainPageNo;
//	}
//}
////		request.setCharacterEncoding("UTF-8");
////		response.setContentType("text/html; charset=UTF-8");
////		HttpSession session = request.getSession();
////		if (!session.isNew()) {
////			bb = (ProductBean) session.getAttribute("bean");
////		} else {
////			bb = new ProductBean();
////		}
////		String pageNo = "1";
////		Map<String, String> errorMsgs = new HashMap<String, String>();
////		Map<String, String> successMsgs = new HashMap<String, String>();
////		request.setAttribute("ErrMsg", errorMsgs);
////		session.setAttribute("successMsg", successMsgs);
////		try {
////			String product = "";
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
////			String discountStr="";
////			double discount=0;
////			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
////			// javax.servlet.http.Part: 代表上傳到Server的，可以是正常的表單資料(form data)，
////			// 也可以上傳的檔案。
////			// Part介面可以:
////			// 1. 傳回欄位的名稱(<input>的name屬性)、大小、ContentType
////			// 2. 每個Part的Header
////			// 3. 刪除Part
////			// 4. 將Part寫入硬碟
////			Collection<Part> parts = request.getParts();
////			// GlobalService.exploreParts(parts, request);
////
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
////						} else if (fldName.equals("price")) {
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
////						} else if (fldName.equals("discount")) {
////							discountStr = value;
////							discountStr = discountStr.trim();
////							if (discountStr == null || discountStr.trim().length() == 0) {
////								errorMsgs.put("errDiscount", "必須輸入折扣");
////							} else {
////								try {
////									discount = Double.parseDouble(discountStr);
////								} catch (NumberFormatException e) {
////									errorMsgs.put("errDiscount", "折扣必須是數值");
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
////							request.setAttribute("categoryId", categoryStr);
////						}
////
////					} else {
////						fileName = getFileName(p); // 由變數 p 中取出檔案名稱
////						System.out.println(fileName);
////						fileName = adjustFileName(fileName, IMAGE_FILENAME_LENGTH);
////						if (fileName != null && fileName.trim().length() > 0) {
////							sizeInBytes = p.getSize();
////							is = p.getInputStream();
////						} else {
////							sizeInBytes = -1;
////							fileName=adjustFileName(bb.getFileName(), IMAGE_FILENAME_LENGTH);
////						}
////					}
////				}
////			} else {
////				errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
////			}
////			if (!errorMsgs.isEmpty()) {
////				RequestDispatcher rd = request.getRequestDispatcher("mall/ProductUpdate.jsp");
////				rd.forward(request, response);
////				return;
////			}
//
////			SessionFactory factory = HibernateUtil.getSessionFactory();
////			Session hibernateSession = factory.getCurrentSession();
////			ProductService productService = new ProductService(hibernateSession);
////			int category=Integer.parseInt(categoryStr);
////			productService.setId(category);
////			Blob blob = null;
////			if (sizeInBytes != -1) {
////				blob = SystemUtils2018.fileToBlob(is, sizeInBytes);
////			}else {
////				blob=bb.getCoverImage();
//////				fileName=bb.getFileName();
////			}
////			bb.setProduct(product);
////			bb.setPrice(price);
////			bb.setDiscount(discount);
////			bb.setCoverImage(blob);
////			bb.setFileName(fileName);
////			bb.setStock(stock);
////			bb.setShelfTime(shelfTime);
////			bb.setCategory(category);
////			bb.setContent(content);
////			bb.setUnit(unit);
////			bb.setDescription(description);
////			ProductBean newBean = new ProductBean(bb.getProductId(), product, bb.getProducterId(), price, discount, blob, fileName,
////					stock, bb.getAddedDate(), shelfTime, content, unit, description, category);
//
////			productService.updateProduct(bb, sizeInBytes);
//
////			hibernateSession.getTransaction().commit();
////			hibernateSession.beginTransaction();
////			response.sendRedirect("./DisplayMaintainProduct");
////	RequestDispatcher rd = request
////			.getRequestDispatcher("DisplayMaintainProduct?pageNo=" + pageNo);rd.forward(request,response);return;}catch(
////	Exception e){e.printStackTrace();errorMsgs.put("errDBMessage",e.getMessage());
////	RequestDispatcher rd = request.getRequestDispatcher("mall/ProductUpdate.jsp");rd.forward(request,response);
////	}}
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
////	private String getFileName(final Part part) {
////		for (String content : part.getHeader("content-disposition").split(";")) {
////			if (content.trim().startsWith("filename")) {
////				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
////			}
////		}
////		return null;
////	}
////
////}