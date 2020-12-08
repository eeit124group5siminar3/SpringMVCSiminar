package tw.group5.mall;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.mall.model.ProductImageBean;
import tw.group5.mall.service.ProductService;

@Controller
public class RetrieveImageServlet {
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private ProductService productService;

	@GetMapping(value = "/retrieveImageServlet")
	@ResponseBody
	public ResponseEntity<byte[]> retrieveImage(@RequestParam(value = "id",required = false) Integer id, @RequestParam String type) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache());
		headers.setPragma("no-cache");
		headers.setExpires(0L);
		headers.setContentType(MediaType.IMAGE_JPEG);
		InputStream is = null;
		String fileName = null;

		Blob blob = null;
		switch (type.toUpperCase()) {
		case "PRODUCT":
			if(id!=null) {
			ProductImageBean bean1 = productService.getProductImage(id);
			if (bean1 != null) {
				blob = bean1.getCoverImage();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean1.getFileName();
			}
			break;
		}
		}
		if (is == null) {
			fileName = "NoImage.png";
			is = servletContext.getResourceAsStream("/WEB-INF/pages/images/" + fileName);
		}
//		String mimeType=servletContext.getMimeType(fileName);
//		MediaType mediaType=MediaType.valueOf(mimeType);
//		headers.setContentType(mediaType);

//		
//		File file=new File(fileName);
//		OutputStream output = new FileOutputStream(file);
//
//	    BufferedOutputStream bufferedOutput = new BufferedOutputStream(output);
//	    bufferedOutput.write(is.readAllBytes());
//		FileUtils.copyInputStreamToFile(is, file);
//		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.OK);
		byte[] bytes = null;
		bytes = readInputStream(is);

		return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
	}

	private byte[] readInputStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[81920];
		int len = 0;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		inStream.close();
		return outStream.toByteArray();
	}

//	private void readInputStreamToOutStream(InputStream inStream, OutputStream outStream) throws Exception {
//		byte[] buffer = new byte[1024];
//		int len = 0;
//		while ((len = inStream.read(buffer)) != -1) {
//			outStream.write(buffer, 0, len);
//		}
//		inStream.close();
//		outStream.close();
//	}

//	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//		OutputStream os = null;
//		InputStream is = null;
//		String fileName = null;
//		String mimeType = null;
//		Blob blob = null;
//		try {
//			// 讀取瀏覽器傳送來的主鍵
//			String id = request.getParameter("id");
//			// 讀取瀏覽器傳送來的type，以分辨要處理哪個表格
//			String type = request.getParameter("type"); 
//			switch(type.toUpperCase()){
//				case "PRODUCT":
//					int nId = 0;
//					try {
//						nId = Integer.parseInt(id);
//					} catch(NumberFormatException ex) {
//						;
//					}
//					ProductBean bean1 = productService.getProduct(nId);
//					if (bean1 != null) {
//						blob = bean1.getCoverImage();
//						if (blob != null) {
//							is = blob.getBinaryStream();
//						}
//						fileName = bean1.getFileName();
//					}
//					break;
////				case "MEMBER":
////					MemberService memberService = new MemberServiceImpl();
////					MemberBean bean2 = memberService.queryMember(id);
////					if (bean2 != null) {
////						blob = bean2.getMemberImage();
////						if (blob != null) { 
////							is = blob.getBinaryStream();
////						}
////						fileName = bean2.getFileName();
////					}
////					break;
//			}
//
//			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
//			if (is == null) {
//				fileName = "NoImage.png" ; 
//				is = request.getServletContext().getResourceAsStream(
//						"/images/" + fileName);
//			}
//			
//			// 由圖片檔的檔名來得到檔案的MIME型態
//			mimeType = request.getServletContext().getMimeType(fileName);
//			// 設定輸出資料的MIME型態
//			response.setContentType(mimeType);
//			// 取得能寫出非文字資料的OutputStream物件
//			os = response.getOutputStream();	
//			// 由InputStream讀取位元組，然後由OutputStream寫出
//			int len = 0;
//			byte[] bytes = new byte[8192];
//			while ((len = is.read(bytes)) != -1) {
//				os.write(bytes, 0, len);
//			}
//		} catch(SQLException ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("RetrieveImageServlet#doGet()發生SQLException: " + ex.getMessage());
//		} finally{
//			if (is != null) 
//				is.close();
//			if (os != null) 
//				os.close();
//			
//		}
//	}

}
