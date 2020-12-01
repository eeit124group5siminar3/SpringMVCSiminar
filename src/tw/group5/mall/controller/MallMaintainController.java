package tw.group5.mall.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.mall.model.CategoryClass;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProducterBean;
import tw.group5.mall.service.ProductService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = { "MaintainPageNo", "login_ok", "SelectCategoryTag", "successMsg", "updateBean","insertBean" })
public class MallMaintainController {
//	public final int RECORDS_PER_PAGE = 5;
	@Autowired
	private ProductService service;

// 顯示商品管理頁面
	@PostMapping(value = "/ManagementContent")
	public ModelAndView showManagementMallContent(HttpServletRequest request,
			@RequestParam(value = "management_pageNo", required = false) Integer pageNoP) {
		HttpSession session = request.getSession(false);
		Integer pageNo = (Integer) session.getAttribute("management_pageNo");
		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
		Integer producterId = mb.getMember_no();
		if (pageNoP != null) {
			pageNo = pageNoP;
			session.setAttribute("management_pageNo", pageNo);
			service.setMaintainPageNo(pageNo);
		}
		int totalPages = service.getTotalPages(producterId);
		List<ProductBean> list = service.getPageProducts(producterId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/managementContent");
		mav.addObject("management_totalPages", totalPages);
		mav.addObject("management_DPP", list);
		return mav;
	}

// 修改資料前置
	@PostMapping(value = "/Preupdate")
	public ModelAndView preupdate(HttpServletRequest request, @RequestParam(value = "productId") Integer productId) {
		ProductBean updateBean = service.getProduct(productId);
		service.setSelected(updateBean.getCategory());
		service.setTagName("categoryId");
		String categoryTag = service.getSelectTag();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/updateForm");
		mav.addObject("SelectCategoryTag", categoryTag);
		mav.addObject("updateBean", updateBean);
		return mav;
	}

// 資料修改
	@PostMapping(value = "/UpdateProduct")
	public String productUpdate(@ModelAttribute(value = "updateBean") ProductBean updateBean, Model model,
			@RequestParam(value = "categoryId") Integer category,
			@SessionAttribute(value = "login_ok") Member_SignUp mb) {
		updateBean.setCategory(category);
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		Map<String, String> successMsgs = new HashMap<String, String>();
//		model.addAttribute("ErrMsg", errorMsgs);
//		model.addAttribute("successMsg", successMsgs);
		service.updateProduct(updateBean);
		return "/mall/mall_management";
	}

// 新增資料前置
	@PostMapping(value = "/Preinsert")
	public ModelAndView preinsert(HttpServletRequest request) {
		ProductBean insertBean = new ProductBean();
		service.setSelected(1);
		String categoryTag = service.getSelectTag();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mall/insertForm");
		mav.addObject("SelectCategoryTag", categoryTag);
		mav.addObject("insertBean", insertBean);
		return mav;
	}

// 資料新增
		@PostMapping(value = "/InsertProduct")
		public String productInsert(@ModelAttribute(value = "insertBean") ProductBean insertBean, Model model,
				@RequestParam(value = "categoryId") Integer category,
				@SessionAttribute(value = "login_ok") Member_SignUp mb) {
			insertBean.setCategory(category);
//			Integer producterId=mb.getMember_no();
			ProducterBean producterBean=new ProducterBean();
			producterBean.setMember_no(mb.getMember_no());
			producterBean.setMember_name(mb.getMember_name());
			insertBean.setProducterBean(producterBean);
//			Map<String, String> errorMsgs = new HashMap<String, String>();
//			Map<String, String> successMsgs = new HashMap<String, String>();
//			model.addAttribute("ErrMsg", errorMsgs);
//			model.addAttribute("successMsg", successMsgs);
			service.saveProduct(insertBean);
			return "/mall/mall_management";
		}
//	@GetMapping(value = "/DisplayMaintainProduct")
//	public String displayMaintainProduct(
//			@RequestParam(value = "MaintainPageNo", required = false) Integer maintainPageNo,
//			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model model) {
//		if (mb == null) {
//			return "/index";
//		}
//		Integer producterId = mb.getMember_no();
//		if (maintainPageNo == null) {
//			if (model.getAttribute("MaintainPageNo") != null) {
//				maintainPageNo = (Integer) model.getAttribute("MaintainPageNo");
//			} else {
//				maintainPageNo = 1;
//			}
//		}
//		model.addAttribute("baBean", service);
//		service.setMaintainPageNo(maintainPageNo);
//		service.setRecordsPerPage(RECORDS_PER_PAGE);
//		model.addAttribute("totalPages", service.getTotalPages(producterId));
//		Collection<ProductBean> coll = service.getPageProducts(producterId);
//		model.addAttribute("MaintainPageNo", maintainPageNo);
//		model.addAttribute("products_DPP", coll);
//		return "/mall/ProductMaintainList";
//	}

	@PostMapping(value = "/ProductDeleteServlet")
	public String productDelete(@RequestParam(value = "productId") Integer productId, Model model) {
		ProductBean n = service.deleteProduct(productId);
		if (n != null) {
			model.addAttribute("ProductDeleteMsg", "商品編號(" + productId + ")刪除成功");
		} else {
			model.addAttribute("ProductDeleteMsg", "商品編號(" + productId + ")刪除失敗");
		}
		return "redirect:/DisplayMaintainProduct";
	}

//	@PostMapping(value = "/ProductInsertServlet")
//	public String productInsert(Model model, @ModelAttribute(value = "Insert") ProductBean insert,
//			@RequestParam(value = "categoryId") Integer category,
//			@SessionAttribute(value = "login_ok") Member_SignUp mb) {
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		Map<String, String> successMsgs = new HashMap<String, String>();
//		model.addAttribute("ErrMsg", errorMsgs);
//		model.addAttribute("successMsg", successMsgs);
//		service.setCategoryId(category);
//		insert.setCategory(category);
////		service.getCategoryById();
//		CategoryClass.getCategory(category);
////		insert.setCategoryBean(service.getCategoryById());
//		Integer producterId = mb.getMember_no();
//		insert.setProducterId(producterId);
//		service.saveProduct(insert);
//		service.setCategoryId(1);
//		String categoryTag = service.getSelectTag();
//		model.addAttribute("SelectCategoryTag", categoryTag);
//		successMsgs.put("success", "資料新增成功");
//		return "/mall/ProductInsert";
//	}
//
//	@GetMapping(value = "/ProductPreInsertServlet")
//	public String productPreInsert(Model model) {
//		ProductBean insert = new ProductBean();
//		service.setTagName("categoryId");
//		String categoryTag = service.getSelectTag();
//		model.addAttribute("SelectCategoryTag", categoryTag);
//		model.addAttribute("Insert", insert);
//		model.addAttribute("baBean", service);
//		return "/mall/ProductInsert";
//	}

//	@GetMapping(value = "/ProductPreUpdateServlet")
//	public String productPreUpdate(@RequestParam(value = "ProductId") Integer productId, Model model) {
//
//		ProductBean bean = service.getProduct(productId);
//		System.err.println(bean.hashCode());
//		model.addAttribute("bean", bean);
//		service.setSelected(bean.getCategory());
//		service.setTagName("categoryId");
//		String categoryTag = service.getSelectTag();
//		model.addAttribute("SelectCategoryTag", categoryTag);
//		return "/mall/ProductUpdate";
//	}

//	@PostMapping(value = "/ProductUpdateServlet")
//	public String productUpdate(@ModelAttribute(value = "bean") ProductBean bb, Model model,
//			@RequestParam(value = "categoryId") Integer category,
//			@SessionAttribute(value = "login_ok") Member_SignUp mb,
//			@SessionAttribute(value = "MaintainPageNo") Integer maintainPageNo) {
//		System.err.println(bb.hashCode());
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		Map<String, String> successMsgs = new HashMap<String, String>();
//		model.addAttribute("ErrMsg", errorMsgs);
//		model.addAttribute("successMsg", successMsgs);
//		service.setCategoryId(category);
//		bb.setCategory(category);
//		service.updateProduct(bb);
//		return "redirect:DisplayMaintainProduct?MaintainPageNo=" + maintainPageNo;
//	}

}
