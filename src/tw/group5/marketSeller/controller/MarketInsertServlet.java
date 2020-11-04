package tw.group5.marketSeller.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.group5.mall.SystemUtils2018;
import tw.group5.util.HibernateUtil;



/**
 * Servlet implementation class MarketSellerServlet
 */
@WebServlet("/marketSeller/model/MarketInsertServlet")
//啟動檔案上傳的功能：
//1. <form>標籤的 method屬性必須是"post", 而且
//enctype屬性必須是"multipart/form-data"
//注意：enctype屬性的預設值為"application/x-www-form-urlencoded"
//2. 定義可以挑選上傳檔案的表單欄位：
//<input type='file' name='user-defined_name' />
//註: HTTP multipart request: 由Http客戶端(如瀏覽器)所建構的ㄧ種請求，用來
//同時上傳表單資料與檔案。
//
//what-should-a-multipart-http-request-with-multiple-files-look-like?
//http://stackoverflow.com/questions/913626/what-should-a-multipart-http-request-with-multiple-files-look-like

//在Servlet 3.0中，若要能夠處理瀏覽器送來的multipart request, Servlet必須
//以註釋『javax.servlet.annotation.MultipartConfig』來宣告。
//
//MultipartConfig的屬性說明:
//location: 上傳之表單資料與檔案暫時存放在Server端之路徑。此路徑必須存在。
//fileSizeThreshold: 檔案的大小臨界值，超過此臨界值，上傳檔案會用存放在硬碟，
//否則存放在主記憶體。
//maxFileSize: 上傳單一檔案之長度限制，如果超過此數值，Container會丟出例外
//maxRequestSize: 上傳所有檔案的總長度限制，如果超過此數值，Container會丟出例外
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
* 1024 * 500 * 5)
public class MarketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int IMAGE_FILENAME_LENGTH = 20;
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
   
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		// 定義存放錯誤訊息訊息
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		HttpSession session = request.getSession();
		request.setAttribute("ErrMsg", errorMsgs);
		session.setAttribute("successMsg", successMsgs);
       System.out.println("有接到");
		try {
			String product_name = "";
			String product_area = "";
			String fileName = "";
			String priceStr = "";
			Integer price= 0;
			String quantityStr="";
			Integer quantity=0;
			String unit="";
			String description = "";
			long sizeInBytes = 0;
			InputStream is = null;

			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
			// javax.servlet.http.Part: 代表上傳到Server的資料，可以是正常的表單資料(form data)，
			// 也可以上傳的檔案。
			// Part介面可以:
			// 1. 傳回欄位的名稱(<input>的name屬性)、大小、ContentType
			// 2. 每個Part的Header
			// 3. 刪除Part
			// 4. 將Part寫入硬碟
			Collection<Part> parts = request.getParts();

			// GlobalService.exploreParts(parts, request);
			if (parts != null) { // 如果這是一個上傳資料的表單
				for (Part p : parts) {
					String fldName = p.getName();
//					System.out.println("fldName=" + fldName);
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) { // 表示 p 為一般欄位而非上傳的表單
						// 根據欄位名稱來讀取欄位的內容，然後存入適當的變數內
						if (fldName.equals("product_name")) {
							product_name = value;
							if (value == null || product_name.trim().length() == 0) {
								errorMsgs.put("errProduct_name", "必須輸入商品名");
							} else {
								request.setAttribute("product_name", product_name);
							}
						}  else if (fldName.equals("description")) {
							description = value;
							;
							if (description == null || description.trim().length() == 0) {
								errorMsgs.put("errDescription", "必須輸入描述");
							}
							request.setAttribute("description", description);
						}else if (fldName.equals("product_area")) {
							product_area = value;
							if (product_area == null || product_area.trim().length() == 0) {
								errorMsgs.put("errProduct_area", "必須輸入商品出產地");
							} else {
								request.setAttribute("errproduct_area", product_area);
							}
						} else if (fldName.equals("price")) {
							priceStr = value;
							priceStr = priceStr.trim();
							if (priceStr == null || priceStr.trim().length() == 0) {
								errorMsgs.put("errPrice", "必須輸入價格");
							} else {
								try {
									price = Integer.parseInt(priceStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errPrice", "價格必須是數值");
								}
							}
							request.setAttribute("price", priceStr);
						}   
						
						else if (fldName.equals("quantity")) {
							quantityStr = value;
							quantityStr = quantityStr.trim();
							if (quantityStr == null || quantityStr.trim().length() == 0) {
								errorMsgs.put("errQuantity", "必須輸入數量");
							} else {
								try {
									quantity = Integer.parseInt(quantityStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errQuantity", "價格必須是數值");
								}
							}
							request.setAttribute("quantity", quantityStr);
						} 
						if (fldName.equals("unit")) {
							unit = value;
							if (value == null || unit.trim().length() == 0) {
								errorMsgs.put("errUnit", "必須輸入商單位");
							} else {
								request.setAttribute("unit", unit);
							}
						}
						
						

					} else { // 表示此份資料是上傳的檔案
						fileName = getFileName(p); // 由變數 p 中取出檔案名稱
						fileName = adjustFileName(fileName, IMAGE_FILENAME_LENGTH);
						if (fileName != null && fileName.trim().length() > 0) {
							sizeInBytes = p.getSize();
							is = p.getInputStream();
						} else {
							errorMsgs.put("errPicture", "必須挑選圖片檔");
						}
					}
				}
			} else {
				errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
			}
			// 如果輸入資料有錯誤
			if (!errorMsgs.isEmpty()) {
				// 轉交給原輸入資料的網頁來顯示錯誤訊息
				RequestDispatcher rd = request.getRequestDispatcher("/marketSeller/MarketI.jsp");
				rd.forward(request, response);
				return;
			}

			// 將上傳的檔案轉換為 Blob 物件
			Blob blob = SystemUtils2018.fileToBlob(is, sizeInBytes);
            //hi
			SessionFactory factory = HibernateUtil.getSessionFactory();
	        Session insession = factory.getCurrentSession();
	        MarketProductBeanService productService = new MarketProductBeanService(insession);
	        
	        MarketProductTotalBean b1 =new MarketProductTotalBean();
	        MarketProductImgBean b2 =new MarketProductImgBean();
            b1.setProductName(product_name);
            b2.setDescription(description);
            b1.setProductArea(product_area);
            b1.setPrice(price);
            b1.setUnit(unit);
            b1.setQuantity(quantity);
            b2.setProductImg(blob);
            
            b1.setMarketProductImgBean(b2);
            b2.setMarketProductTotalBean(b1);
            
           productService.insert(b1);
           
			successMsgs.put("success", "資料新增成功");
			// 新增成功，通知瀏覽器對新網址發出請求
			response.sendRedirect(response.encodeRedirectURL("../MarketS.jsp"));
//			RequestDispatcher rd = request.getRequestDispatcher("/marketSeller/MarketS.jsp");
//			rd.forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			errorMsgs.put("Exception", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/marketSeller/MarketI.jsp");
			rd.forward(request, response);
		}
	}

	public String adjustFileName(String fileName, int maxLength) {
		int length = fileName.length();
		if (length <= maxLength) {
			return fileName;
		}
		int n = fileName.lastIndexOf(".");
		int sub = fileName.length() - n - 1;
		fileName = fileName.substring(0, maxLength - 1 - sub) + "." + fileName.substring(n + 1);
		return fileName;
	}

	public String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
			}
			return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
		}
		return null;
	}

	// 本方法於主控台印出 parts 內的重要資訊，純粹為觀察用，沒有功能上的用途。
	public void exploreParts(Collection<Part> parts, HttpServletRequest req) {
		try {
			for (Part part : parts) {
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				try (InputStream is = part.getInputStream();) {
					if (contentType != null) { // 表示該part為檔案
						// 取出上傳檔案的檔名
						String filename = getFileName(part);
						// 將上傳的檔案寫入到location屬性所指定的資料夾
						part.write(filename);
					} else { // 表示該part為一般的欄位
						// 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
						part.write("part_" + name);
						value = req.getParameter(name);
					}
					System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}