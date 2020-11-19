package tw.group5.active.controller;

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

import tw.group5.active.model.ActFarmer;
import tw.group5.active.model.ActFarmerService;

@Controller
public class ActImageController {
	
	@Autowired
	private ServletContext stx;
	@Autowired
	private ActFarmerService actFarmerService;
	
	
	@GetMapping(value = "/ActImageController")
	@ResponseBody
	public ResponseEntity<byte[]> retrieveImage(@RequestParam Integer actId, @RequestParam String type) throws Exception{
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache());
		headers.setPragma("no-cache");
		headers.setContentType(MediaType.ALL);
		InputStream is = null;
		String fileName = null;
		Blob blob = null;
		
		switch (type.toUpperCase()) {
		case "ACTFARMER":
			ActFarmer afBean = actFarmerService.getActFarmer(actId);
			if(afBean != null) {
				blob = afBean.getActImg();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = afBean.getImgName();
			}			
			break;
		}
		if (is == null) {
			fileName = "NoImage.png";
			is = stx.getResourceAsStream("/images/" + fileName);
		}

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

}

