package tw.group5.marketSeller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.ShoppingCart;
import tw.group5.marketSeller.MarketCart;
import tw.group5.marketSeller.model.MarketMallBean;
import tw.group5.marketSeller.model.MarketOrder;
import tw.group5.marketSeller.model.MarketProductTotalBean;
import tw.group5.marketSeller.service.MarketProductBeanService;
import tw.group5.marketSeller.service.MarketSellBeanService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(value = {"login_ok","MarketCart"} )
public class MarketHome {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	
	@Autowired
	private MarketSellBeanService sellerService;

	@Autowired
	private MarketProductBeanService productService;
	
	@GetMapping(value = "/GoMarketHome")
	public String goMarketHome(
			@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb
			) {
		if (mb == null ) {
			return "Member_SignUp/Member_Login";
		}
		return "marketSeller/MarketHome";
	}
	
	//取得所有賣家頁面
	@PostMapping(value = "/SellerContent")
	@ResponseBody
	public ModelAndView showAllSeller(HttpServletRequest request,
			@RequestParam(value = "marketPageNo", required = false) Integer pageNoP,
			@RequestParam(value = "searchString", required = false) String searchStringP
			){
		
		HttpSession session = request.getSession(false);
		Integer pageNo = (Integer) session.getAttribute("marketPageNo");
		int totalPages =sellerService.sellerPages();//總比數
		if (pageNoP != null) {
			pageNo=pageNoP;
			session.setAttribute("marketPageNo", pageNo);
		}
		List<MarketMallBean> list = sellerService.selectAllmall(pageNo,null);
		int totalPage =(int) Math.ceil(totalPages*1.0 /2);//總頁數
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/marketSeller/MarketAllSeller");
		mav.addObject("sellerAll",list);
		mav.addObject("totalPages",totalPage);
		mav.addObject("marketPageNo",pageNo);
		return mav;		
	}
	//顯示地圖
	@PostMapping(value = "/showMap")
	public ModelAndView showMap(HttpServletRequest request,
			@RequestParam(value = "memberNo", required = false) Integer memberNo){
		MarketMallBean map =sellerService.selectid(memberNo);
		System.out.println("地址在這 :"+ map.getAddress());
		ModelAndView mav =new ModelAndView();
		mav.setViewName("/marketSeller/MarketMallMap");
		mav.addObject("map",map);
		return mav;
	}
	
	//取得賣家商品
	@PostMapping(value = "/ProductContent")
	@ResponseBody
	public ModelAndView sellerProduct(
			@RequestParam(value = "memberNo", required = false) Integer memberNo
			) {
           List<MarketProductTotalBean> list = productService.selectBuyerAll(memberNo);
           MarketMallBean seller =sellerService.selectid(memberNo);
           System.out.println("賣家名稱"+ seller.getMallName());
           ModelAndView mav =new ModelAndView();
           mav.setViewName("/marketSeller/MarketMallProduct");
           mav.addObject("totalProducts",list);
           mav.addObject("seller",seller);
		   return mav;
	}
	//商品詳細資訊及加入購物車
	@PostMapping(value = "/ProductNews")
	@ResponseBody
	public ModelAndView productNews(
			@RequestParam(value = "productId", required = false) Integer productId,
			@RequestParam(value = "qty", required = false) Integer qty,
			@SessionAttribute(value = "MarketCart", required = false) MarketCart cart, Model model
			) {
		//商品詳細資訊	
		MarketProductTotalBean pBean = productService.select(productId);
		MarketOrder marketOrder =new MarketOrder();
		marketOrder.setMemberNo(pBean.getMemberNo());
		marketOrder.setProductId(pBean.getProductId());
		marketOrder.setProducterName(pBean.getMarketMallBean().getMallName());
		marketOrder.setProduct(pBean.getProductName());
		marketOrder.setPrice(pBean.getPrice());
        marketOrder.setStock(pBean.getQuantity());
        marketOrder.setQuantity(0);
        if (cart == null) {
			cart =new MarketCart();
			model.addAttribute("MarketCart", cart);
		}
        cart.addToCart(productId, marketOrder);
        if (qty !=null ) {
			marketOrder.setQuantity(qty);
			cart.addToCart(productId, marketOrder);
		}
        marketOrder =cart.getContent().get(productId);
		ModelAndView mav =new ModelAndView();
        mav.setViewName("/marketSeller/MarketMallOneProduct");
        mav.addObject("oneProduct",pBean);
        mav.addObject("marketOrder",marketOrder);
        mav.setStatus(HttpStatus.OK);
		return mav;
	}
}
