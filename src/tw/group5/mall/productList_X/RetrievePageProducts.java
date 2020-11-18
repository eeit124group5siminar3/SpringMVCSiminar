package tw.group5.mall.productList_X;
//package tw.group5.mall.productList;
//
//import java.util.Collection;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import tw.group5.mall.model.ProductBean;
//import tw.group5.mall.service.ProductService;
//import tw.group5.member_SignUp.model.Member_SignUp;
//
//@Controller
//@SessionAttributes(value = { "searchString", "pageNo", "login_ok","login_guest"})
//public class RetrievePageProducts {
////	@Autowired
////	private HttpServletRequest request;
//	@Autowired
//	private ProductService service;
////	private Integer pageNo = 1;
//
//	@GetMapping(value = "/RetrievePageProducts", produces = "text/HTML;charset=UTF-8")
////	@Scope(value = "session")
//	public String retrievePageProducts(@RequestParam(value = "pageNo", required = false) Integer pageNo,
//			@RequestParam(value = "searchString", required = false) String searchString,
//			@RequestParam(value = "search", required = false) String search,
//			@SessionAttribute(value = "login_ok",required = false) Member_SignUp mb,
//			Model model) {
//		if(mb==null) {
//			mb=new Member_SignUp();
//			mb.setMember_no(1);
//			model.addAttribute("login_guest",mb);
//		}
//		if (pageNo == null) {
//			if (model.getAttribute("pageNo") != null) {
//				pageNo = (Integer) model.getAttribute("pageNo");
//			} else {
//				pageNo = 1;
//			}
//		} 
//		model.addAttribute("baBean", service);
//		Collection<ProductBean> coll = null;
//		if (search != null) {
//			service.setPageNo(1);
//			pageNo = 1;
//		} else {
//			searchString = (String) model.getAttribute("searchString");
//		}
//		service.setPageNo(pageNo);
//
//		if (searchString != null) {
//			coll = service.getPageProductsWithoutZero(searchString);
//			model.addAttribute("totalPages", service.getTotalPagesWithoutZero(searchString));
//		} else {
//			coll = service.getPageProductsWithoutZero();
//			model.addAttribute("totalPages", service.getTotalPagesWithoutZero());
//		}
//		model.addAttribute("searchString", searchString);
//		model.addAttribute("pageNo", pageNo);
//		model.addAttribute("products_DPP", coll);
//		return "mall/ListProduct";
//
//	}
//
////	@GetMapping(value = "/search", produces = "text/HTML;charset=UTF-8")
////	public String search(HttpServletRequest request,
////			@RequestParam(value = "pageNo", defaultValue = "1") String pageNoStr,
////			@RequestParam(value = "searchString", required = false) String search, Model model) {
////		HttpSession session = request.getSession();
////		String searchString = (String) session.getAttribute("searchString");
////		if (search == null || search.length() == 0) {
////			searchString = search;
////			System.err.println(searchString);
////			model.addAttribute("searchString", searchString);
////			System.err.println("searchString" + searchString);
////		}
////
////		return retrievePageProducts(request,"1",model);
////	}
//}
//
//// 先取出session物件
//
//////		String memberId = null;
////		// 如果session物件不存在
////		if (session == null) {
////			// 請使用者登入
////
////			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/index.jsp"));
////			return;
////		}
////		// 登入成功後，Session範圍內才會有LoginOK對應的MemberBean物件
////		int memberId = 0;
////		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
//////		Member_SignUp mb =null;
////		// 取出使用者的memberId，後面的Cookie會用到
////		if (mb == null) {
////			mb = new Member_SignUp();
//////			String sessionId = request.getRequestedSessionId();
//////			memberId = sessionId;
////			memberId = 123456;
////			mb.setMember_no(memberId);
////			mb.setMember_permissions("1");
////			session.setAttribute("login_guest", mb);
////		} else {
////			memberId = mb.getMember_no();
////		}
////		else {			
////			memberId = mb.getMember_no();
////		}
//// BookService介面負責讀取資料庫內Book表格內某一頁的書籍資料，並能新增、修改、刪除
//
//// 讀取瀏覽送來的 pageNo
//
//// 如果讀不到，直接點選主功能表的『購物』就不會送 pageNo給後端伺服器
//
////			// 讀取瀏覽器送來的所有 Cookies
////			Cookie[] cookies = request.getCookies();
////			if (cookies != null) {
////				// 逐筆檢視Cookie內的資料
////				for (Cookie c : cookies) {
////					if (c.getName().equals(memberId + "pageNo")) {
////						try {
////							pageNo = Integer.parseInt(c.getValue().trim());
////						} catch (NumberFormatException e) {
////							;
////						}
////						break;
////					}
////				}
////			}
//
//// 將讀到的一頁資料放入request物件內，成為它的屬性物件
//
//// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為memberId + "pageNo"
//// -----------------------
////		Cookie pnCookie = new Cookie(memberId + "pageNo", String.valueOf(pageNo));
//// 設定Cookie的存活期為30天
////		pnCookie.setMaxAge(30 * 24 * 60 * 60);
//// 設定Cookie的路徑為 Context Path
////		pnCookie.setPath(request.getContextPath());
//// 將Cookie加入回應物件內
////		response.addCookie(pnCookie);
//// -----------------------
//// 交由listBooks.jsp來顯示某頁的書籍資料，同時準備『第一頁』、
//// 『前一頁』、『下一頁』、『最末頁』等資料
