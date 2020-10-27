package mall.productList;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.productModel.ProductBean;
import mall.service.ProductService;
import member_SignUp.model.Member_SignUp;
import util.HibernateUtil;

/**
 * Servlet implementation class RetrievePageProducts
 */
@WebServlet("/RetrievePageProducts")
public class RetrievePageProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int pageNo = 1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		// 先取出session物件
		HttpSession session = request.getSession();
//		String memberId = null;
		// 如果session物件不存在
		if (session == null) {
			// 請使用者登入

			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/index.jsp"));
			return;
		}
		// 登入成功後，Session範圍內才會有LoginOK對應的MemberBean物件
		int memberId = 0;
		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
//		Member_SignUp mb =null;
		// 取出使用者的memberId，後面的Cookie會用到
		if (mb == null) {
			mb = new Member_SignUp();
//			String sessionId = request.getRequestedSessionId();
//			memberId = sessionId;
			memberId = 123456;
			mb.setMember_no(memberId);
			mb.setMember_permissions("1");
			session.setAttribute("login_guest", mb);
		} else {
			memberId = mb.getMember_no();
		}
//		else {			
//			memberId = mb.getMember_no();
//		}
		// BookService介面負責讀取資料庫內Book表格內某一頁的書籍資料，並能新增、修改、刪除
		

		// 讀取瀏覽送來的 pageNo
		String pageNoStr = request.getParameter("pageNo");
		// 如果讀不到，直接點選主功能表的『購物』就不會送 pageNo給後端伺服器
		if (pageNoStr == null) {
			pageNo = 1;
//			// 讀取瀏覽器送來的所有 Cookies
//			Cookie[] cookies = request.getCookies();
//			if (cookies != null) {
//				// 逐筆檢視Cookie內的資料
//				for (Cookie c : cookies) {
//					if (c.getName().equals(memberId + "pageNo")) {
//						try {
//							pageNo = Integer.parseInt(c.getValue().trim());
//						} catch (NumberFormatException e) {
//							;
//						}
//						break;
//					}
//				}
//			}
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hibernateSession = factory.getCurrentSession();
		ProductService service = new ProductService(hibernateSession);
		//
		// 讀取一頁的書籍資料之前，告訴service，現在要讀哪一頁
		service.setPageNo(pageNo);
		request.setAttribute("baBean", service);
		// service.getPageBooks()方法開始讀取一頁的書籍資料
		Collection<ProductBean> coll = null;
		String searchString = null;
		if (request.getParameter("search") != null) {
			searchString = request.getParameter("searchString");
		} else {
			searchString = (String) session.getAttribute("searchString");
		}

		if (searchString != null || session.getAttribute("searchString") != null) {
			coll = service.getPageProductsWithoutZero(searchString);
			request.setAttribute("totalPages", service.getTotalPagesWithoutZero(searchString));
			session.setAttribute("searchString", searchString);
		} else {
			coll = service.getPageProductsWithoutZero();
			request.setAttribute("totalPages", service.getTotalPagesWithoutZero());
		}

		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		session.setAttribute("pageNo", String.valueOf(pageNo));
		request.setAttribute("products_DPP", coll);

		// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為memberId + "pageNo"
		// -----------------------
//		Cookie pnCookie = new Cookie(memberId + "pageNo", String.valueOf(pageNo));
		// 設定Cookie的存活期為30天
//		pnCookie.setMaxAge(30 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
//		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
//		response.addCookie(pnCookie);
		// -----------------------
		// 交由listBooks.jsp來顯示某頁的書籍資料，同時準備『第一頁』、
		// 『前一頁』、『下一頁』、『最末頁』等資料
		RequestDispatcher rd = request.getRequestDispatcher("mall/ListProduct.jsp");
		rd.forward(request, response);
		return;

	}

}
