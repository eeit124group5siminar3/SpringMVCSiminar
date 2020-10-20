package mall.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.productModel.ProductBean;
import mall.service.ProductService;

/**
 * Servlet implementation class ProductPreUpdateServlet
 */
@WebServlet("/ProductPreUpdateServlet")
public class ProductPreUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		int productId = 0;
		String strProductId = request.getParameter("ProductId");

		if (strProductId != null) {
			productId = Integer.parseInt(strProductId);
		}

		ProductService productService = new ProductService();
		ProductBean bean = productService.getProduct(productId);
		session.setAttribute("bean", bean);

//		productService.setSelected(bean.getCategory());
//		String categoryTag = productService.getCategoryTag();
//		request.setAttribute("SelectCategoryTag", categoryTag);
		productService.setSelected(bean.getCategory());
		productService.setTagName("categoryId");
		String categoryTag = productService.getSelectTag();
		session.setAttribute("SelectCategoryTag", categoryTag);

		RequestDispatcher rd = request.getRequestDispatcher("mall//ProductUpdate.jsp");
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
