package tw.group5.active.controller;

import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group5.active.model.Active;
import tw.group5.active.model.ActiveService;

@Controller
public class ActiveImageController {
	
	@Autowired
	private ServletContext ctx;
	
	@Autowired
	private ActiveService activeService;
	
//	public ResponseEntity<byte[]> activeImage(@RequestParam int actId, @RequestParam String type){
//		HttpHeaders headers = new HttpHeaders();
//		//不快取照片
//		headers.setCacheControl(CacheControl.noCache());
//		headers.setPragma("no-cache");
//		headers.setContentType(MediaType.IMAGE_JPEG);
//		InputStream is = null;
//		String fileName = null;
////		Blob blob = null;
//		
//		
//		switch (type.toUpperCase()) {
//		case "ACTIVE":
//			Active aBean = activeService.select(actId);
//			if (aBean != null) {
//				byte[] b = aBean.getActImg();
//				if (b != null) {
//					is = b.length;
//				}
//				fileName = 
//			}
//			break;
//		}
//		
//	}
	

}
