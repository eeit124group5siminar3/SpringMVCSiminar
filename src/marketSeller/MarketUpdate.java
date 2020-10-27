package marketSeller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import active.model.ActiveDAO;
import marketSeller.model.MarketProductDao;
import marketSeller.model.MarketProductImgBean;
import marketSeller.model.MarketProductTotalBean;
import util.HibernateUtil;

/**
 * Servlet implementation class MarketUpdate
 */
@WebServlet("/marketSeller/MarketUpdate")
public class MarketUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

			
			//修改
			if(request.getParameter("update") != null) {
				processUpdate(request,response);
			}
			if(request.getParameter("acthome") != null) {
				response.sendRedirect("MarketHome.jsp");
			}
 
	}

	private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
	

		MarketProductDao mDao = new MarketProductDao(session);
		
		MarketProductTotalBean mBean1 = new MarketProductTotalBean();
		MarketProductImgBean mBean2 = new MarketProductImgBean();
		
		int productId =Integer.parseInt(request.getParameter("productId"));
		mBean1.setProductId(productId);
		mBean2.setProductId(productId);
//		mBean.setProductId(productId);
		String product_name=request.getParameter("productName");
		mBean1.setProductName(product_name);
		String description =request.getParameter("description");
		mBean2.setDescription(description);
		String productArea=request.getParameter("productArea");
		mBean1.setProductArea(productArea);
		String unit =request.getParameter("unit");
		mBean1.setUnit(unit);
		String price =request.getParameter("price");
		mBean1.setPrice(Integer.parseInt(price));
		System.out.println("價格"+price);
		String quantity =request.getParameter("quantity");
		mBean1.setQuantity(Integer.parseInt(quantity));
		
		mBean1.setMarketProductImgBean(mBean2);
		mBean2.setMarketProductTotalBean(mBean1);
		
		mDao.update(mBean1);
//		RequestDispatcher rd = request.getRequestDispatcher("/marketSeller/MarketS.jsp");
		response.sendRedirect("./MarketS.jsp");
		
	}

}
