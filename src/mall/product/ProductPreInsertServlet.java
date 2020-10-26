package mall.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.service.ProductService;
import util.HibernateUtil;

@WebServlet("/ProductPreInsertServlet")
public class ProductPreInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 本類別負責讀取資料庫內Book表格內某一頁的紀錄，並能新增紀錄、修改紀錄、刪除記錄等
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hibernateSession = factory.getCurrentSession();
		ProductService productService = new ProductService(hibernateSession);
		productService.setTagName("categoryId");
		String categoryTag = productService.getSelectTag();
		request.getSession(false).setAttribute("SelectCategoryTag", categoryTag);

		request.setAttribute("baBean", productService);
		RequestDispatcher rd = request.getRequestDispatcher("mall/ProductInsert.jsp");
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
