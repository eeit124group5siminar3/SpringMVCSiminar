	package mall.product;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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

@WebServlet("/DisplayMaintainProduct")
public class DisplayMaintainProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public final int RECORDS_PER_PAGE = 5;
	int pageNo = 1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 //先取出session物件
		HttpSession session = request.getSession(false);
//		HttpSession session = request.getSession();
		// 紀錄目前請求的RequestURI,以便使用者登入成功後能夠回到原本的畫面
		String requestURI = request.getRequestURI();
		// System.out.println("requestURI=" + requestURI);
		// 如果session物件不存在
		if (session == null || session.isNew()) {
			// 請使用者登入
			response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
			return;
		}
		session.setAttribute("requestURI", requestURI);
		// 此時session物件存在，讀取session物件內的LoginOK
		// 以檢查使用者是否登入。
		Member_SignUp mb = (Member_SignUp) session.getAttribute("login_ok");
		if (mb == null) {
			response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
			return;
		}
		int producterId=mb.getMember_no();
		String pageNoStr = request.getParameter("pageNo");
		if (pageNoStr == null) {
			pageNo = 1;
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
		request.setAttribute("baBean", service);
		//
		service.setPageNo(pageNo);
		service.setRecordsPerPage(RECORDS_PER_PAGE);
		
//		Collection<ProductBean> coll = service.getPageProducts();
		session.setAttribute("pageNo", pageNo);
//		request.setAttribute("totalPages", service.getTotalPages());
		request.setAttribute("totalPages", service.getTotalPages(producterId));
		Collection<ProductBean> coll = service.getPageProducts(producterId);
		request.setAttribute("products_DPP", coll);
		RequestDispatcher rd = request.getRequestDispatcher("mall/ProductMaintainList.jsp");
		rd.forward(request, response);
		return;
	}
}