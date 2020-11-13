package tw.group5.marketSeller.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.marketSeller.model.MarketProductBeanService;
import tw.group5.marketSeller.model.MarketProductImgBean;
import tw.group5.marketSeller.model.MarketProductTotalBean;


@Controller
@SessionAttributes(names = {"Insert1", "login_ok"})
public class MarketHome {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	@Autowired
	private MarketProductBeanService service;
	@Autowired
	private HttpServletRequest request;

	// 顯示全部
	@RequestMapping(path = "/MarketProduct.selectAll", method = RequestMethod.GET)
	public String selectAll(Model m) {
		
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
	@GetMapping(path = "/MarketProduct.goInsertJsp" )
	public String insertJsp(Model model) {
        MarketProductTotalBean insert =new MarketProductTotalBean();
        MarketProductImgBean imgBean=new MarketProductImgBean();
        insert.setMarketProductImgBean(imgBean);
        imgBean.setMarketProductTotalBean(insert);
        System.out.println("跳過去囉");
        System.err.println(insert.hashCode());
        System.err.println(insert.getMarketProductImgBean());
        model.addAttribute("Insert1",insert);
		return "marketSeller/MarketI";
	}
	
	//新增
	@PostMapping(path = "/MarketProduct.insert")
	public String insert(Model model, @ModelAttribute(value = "Insert1") MarketProductTotalBean bean1
			)throws IllegalStateException, IOException{
		   System.out.println("人");
		   Map<String, String> errorMsgs = new HashMap<String, String>();
		   model.addAttribute("Errors",errorMsgs);
		   System.out.println("來到MarketHome的Controller");
		   System.err.println(bean1.hashCode());
//		   System.err.println(bean1.getMarketProductImgBean().hashCode());
//		   bean1.getMarketProductImgBean().setMarketProductTotalBean(bean1);
		   service.insert(bean1);
		return "marketSeller/MarketS";
		}


	} 

