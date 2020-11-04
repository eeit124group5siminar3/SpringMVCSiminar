package tw.group5.marketSeller.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;


@Controller
public class MarketHome {

	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpServletRequest request;

	// 顯示全部
	@RequestMapping(path = "/MarketProduct.selectAll", method = RequestMethod.GET)
	public String selectAll(Model m) {
		System.out.println("來到MarketHome的Controller");
		List<MarketProductTotalBean> list = service.selectAll();
		m.addAttribute("list", list);
		return "marketSeller/MarketHome";
	}

	// 刪除單筆商品
	@RequestMapping(path = "/MarketProduct.delete", method = RequestMethod.POST)
	public String delete(@RequestParam(name = "productid") String productid, Model m) {
		int id = Integer.valueOf(productid);
		service.delete(id);

		return "marketSeller/MarketS";

	}

	// 跳轉到新增jsp
	@RequestMapping(path = "/MarketProduct.goInsertJsp" ,method = RequestMethod.GET)
	public String insertJsp() {

		return "marketSeller/MarketI";
	}

//	@ResponseBody
	@RequestMapping(path = "/MarketProduct.insert" ,method = RequestMethod.POST)
	public String insert(@RequestParam(name = "product_name") String product_name,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "product_area") String product_area,
			@RequestParam(name = "price") String priceStr,
			@RequestParam(name = "quantity") String quantityStr,
			@RequestParam(name = "unit") String unit,
			@RequestParam(name = "product_img") MultipartFile product_img,MarketProductTotalBean bean1,MarketProductImgBean bean2,Model m)throws IllegalStateException, IOException{
		
	
		
		
		//商業邏輯
		Map<String, String> errors =new HashMap<String, String>();
		m.addAttribute("errors" , errors);
		int price,quantity;
		
		if (product_name==null || product_name.length()==0) {
			errors.put("errProduct_name","商品名稱不能空白");
		}
		if (description==null || description.length()==0) {
			errors.put("errDescription","產品描述不能空白");
		}
		if (product_area==null || product_area.length()==0) {
			errors.put("errProduct_area","商品出產地不能空白");
		}
		if ( priceStr.length()==0) {
			errors.put("errPrice","必須輸入價格");
		}
		 if(priceStr.length()>0) {
			 try {
				  price = Integer.parseInt(priceStr);
			} catch (NumberFormatException e) {
				System.out.println("我是價錢"+priceStr);
				errors.put("errPrice","價格必須是數值");
			}
	     }

	    if (quantityStr==null || quantityStr.length()==0) {
			errors.put("errQuantity","必須輸入數量");
	    }
	    
		 if(quantityStr.length()>0) {
			 try {
				  quantity = Integer.parseInt(quantityStr);
			} catch (NumberFormatException e) {
				errors.put("errQuantity","數量必須是數值");
			}
	     }
	    
	    if (unit==null || unit.length()==0) {
	       errors.put("errUnit","必須輸入商單位");
		}

		if (errors!=null && !errors.isEmpty() ) {
			
			return "marketSeller/MarketI";
		}

		
		
		//圖片上傳
		String fileName = product_img.getOriginalFilename();
		String fileTempDirPath = request.getSession().getServletContext().getRealPath("/") + "UploadTempDir\\";
	    
		 System.out.println("fileName:" + fileName);
		 System.out.println("fileTempDirPath:" + fileTempDirPath);
		
		//圖片放入資料夾若沒有創一個
		  File dirPath = new File(fileTempDirPath);
		  if (!dirPath.exists()) {
			boolean status =dirPath.mkdir();
			System.out.println("status:" + status);
		}
		  
		  String fileSavePath =fileTempDirPath +fileName;
		  File savFile = new File(fileSavePath);
		  product_img.transferTo(savFile);
		  System.out.println("fileSavePath: " + fileSavePath);
		  
		  
		  if (fileName!=null && fileName.length()!=0) {
				 //bean2.setProductImg(savePicture(fileName,fileSavePath).getProductImg());
			  try {
				 bean2.setImg_name(fileName);
				FileInputStream is1 =new FileInputStream(fileSavePath);
				byte[] b = new byte[is1.available()];
				is1.read(b);
				is1.close();
				bean2.setProductImg(b);
			    
			} catch ( Exception e) {
				e.printStackTrace();
			}
			}
			price = Integer.parseInt(priceStr);
			quantity = Integer.parseInt(quantityStr);
			bean1.setProductName(product_name);
			bean2.setDescription(description);
			bean1.setProductArea(product_area);
			bean1.setPrice(price);
			bean1.setQuantity(quantity);
			bean1.setUnit(unit);
			bean1.setMarketProductImgBean(bean2);
		    bean2.setMarketProductTotalBean(bean1);
	        service.insert(bean1);
		
		return "marketSeller/MarketS";
		}


	} 

