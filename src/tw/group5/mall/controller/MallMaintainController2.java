package tw.group5.mall.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
@SessionAttributes(names = { "MaintainPageNo", "login_ok", "SelectCategoryTag", "successMsg", "bean" })
public class MallMaintainController2 {
	public final int RECORDS_PER_PAGE = 5;
	@Autowired
	private ProductService service;

	@GetMapping(value = "/DisplayMaintainProduct")
	public String displayMaintainProduct(
			@RequestParam(value = "MaintainPageNo", required = false) Integer maintainPageNo,
			@SessionAttribute(value = "login_ok", required = false) Member_SignUp mb, Model model) {
		if (mb == null) {
			return "/index";
		}
		Integer producterId = mb.getMember_no();
		if (maintainPageNo == null) {
			if (model.getAttribute("MaintainPageNo") != null) {
				maintainPageNo = (Integer) model.getAttribute("MaintainPageNo");
			} else {
				maintainPageNo = 1;
			}
		}
		model.addAttribute("baBean", service);
		service.setMaintainPageNo(maintainPageNo);
		service.setRecordsPerPage(RECORDS_PER_PAGE);
		model.addAttribute("totalPages", service.getTotalPages(producterId));
		Collection<ProductBean> coll = service.getPageProducts(producterId);
		model.addAttribute("MaintainPageNo", maintainPageNo);
		model.addAttribute("products_DPP", coll);
		return "/mall/ProductMaintainList";
	}

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

	@PostMapping(value = "/ProductInsertServlet")
	public String productInsert(Model model, @ModelAttribute(value = "Insert") ProductBean insert,
			@RequestParam(value = "categoryId") Integer category,
			@SessionAttribute(value = "login_ok") Member_SignUp mb) {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		model.addAttribute("ErrMsg", errorMsgs);
		model.addAttribute("successMsg", successMsgs);
		service.setId(category);
		insert.setCategory(category);
		service.getCategoryById();
		insert.setCategoryBean(service.getCategoryById());
		Integer producterId = mb.getMember_no();
		insert.setProducterId(producterId);
		service.saveProduct(insert);
		service.setId(1);
		String categoryTag = service.getSelectTag();
		model.addAttribute("SelectCategoryTag", categoryTag);
		successMsgs.put("success", "資料新增成功");
		return "/mall/ProductInsert";
	}

	@GetMapping(value = "/ProductPreInsertServlet")
	public String productPreInsert(Model model) {
		ProductBean insert = new ProductBean();
		service.setTagName("categoryId");
		String categoryTag = service.getSelectTag();
		model.addAttribute("SelectCategoryTag", categoryTag);
		model.addAttribute("Insert", insert);
		model.addAttribute("baBean", service);
		return "/mall/ProductInsert";
	}

	@GetMapping(value = "/ProductPreUpdateServlet")
	public String productPreUpdate(@RequestParam(value = "ProductId") Integer productId, Model model) {

		ProductBean bean = service.getProduct(productId);
		System.err.println(bean.hashCode());
		model.addAttribute("bean", bean);
		service.setSelected(bean.getCategoryBean().getId());
		service.setTagName("categoryId");
		String categoryTag = service.getSelectTag();
		model.addAttribute("SelectCategoryTag", categoryTag);
		return "/mall/ProductUpdate";
	}

	@PostMapping(value = "/ProductUpdateServlet")
	public String productUpdate(@ModelAttribute(value = "bean") ProductBean bb, Model model,
			@RequestParam(value = "categoryId") Integer category,
			@SessionAttribute(value = "login_ok") Member_SignUp mb,
			@SessionAttribute(value = "MaintainPageNo") Integer maintainPageNo) {
		System.err.println(bb.hashCode());
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		model.addAttribute("ErrMsg", errorMsgs);
		model.addAttribute("successMsg", successMsgs);
		service.setId(category);
		bb.setCategoryBean(service.getCategoryById());
		service.updateProduct(bb);

		return "redirect:DisplayMaintainProduct?MaintainPageNo=" + maintainPageNo;
	}
}
