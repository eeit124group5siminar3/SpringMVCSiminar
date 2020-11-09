package tw.group5.marketSeller.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.mall.model.ProductBean;
import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;

@Controller
public class MarketHomeUpdate {
	
	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ServletContext servletContext;
	
	
	// 跳轉到修改jsp
	@RequestMapping(path = "/MarketProduct.goUpdateJsp" ,method = RequestMethod.GET)
	public String updateJsp(@RequestParam(name = "productid") int productid, Model m) {
		MarketProductTotalBean mBean = service.select(productid);
		m.addAttribute("list",mBean);
		return "marketSeller/MarketU";
	}
	
	
	@RequestMapping(path = "/MarketProduct.Update" ,method = RequestMethod.POST)
	public String update(@RequestParam(name = "productId" )int productId,
			@RequestParam(name = "product_name") String product_name,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "product_area") String product_area,
			@RequestParam(name = "price") String priceStr,
			@RequestParam(name = "quantity") String quantityStr,
			@RequestParam(name = "unit") String unit,
			MarketProductTotalBean bean1,MarketProductImgBean bean2,Model m){
             
		int price = Integer.parseInt(priceStr);
		int  quantity = Integer.parseInt(quantityStr);
		bean1.setProductId(productId);
		bean1.setProductName(product_name);
		bean2.setDescription(description);
		bean1.setProductArea(product_area);
		bean1.setPrice(price);
		bean1.setQuantity(quantity);
		bean1.setUnit(unit);
		bean1.setMarketProductImgBean(bean2);
	    bean2.setMarketProductTotalBean(bean1);
        service.update(bean1);
		
		
		
		return "marketSeller/MarketS";
	}
	
	
	@GetMapping("/MarketProduct.getImg")
	@ResponseBody
	public ResponseEntity<byte[]> getProductImage(@RequestParam("productId") Integer id) {
	   HttpHeaders headers = new HttpHeaders();  //HttpHeaders headers 設定檔  HttpHeaders bodys 裡面的內容
	   headers.setCacheControl(CacheControl.noCache());
	   headers.setPragma("no-cache");
	   headers.setExpires(0L);
	   headers.setContentType(MediaType.IMAGE_JPEG);
	   MarketProductImgBean bean = service.selectImg(id); 
	   byte[] image = bean.getProductImg() ;
	   System.out.println("圖片呢");
	   return new ResponseEntity<byte[]>(image, HttpStatus.OK);
	}

}