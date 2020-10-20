package mall.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.service.ProductService;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/ProductDeleteServlet")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String pId = request.getParameter("productId");
		int productId = Integer.parseInt(pId);
		ProductService service = new ProductService();
		int n = service.deleteProduct(productId);
		if (n == 1) {
			session.setAttribute("ProductDeleteMsg", "商品編號(" + pId + ")刪除成功");
		} else {
			session.setAttribute("ProductDeleteMsg", "商品編號(" + pId + ")刪除失敗");
		}
		response.sendRedirect("DisplayMaintainProduct");
		return;

	}

}
