package marketSeller;

import java.io.IOException;
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

import active.ActiveDAO;

/**
 * Servlet implementation class MarketUpdate
 */
@WebServlet("/MarketUpdate")
public class MarketUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		     
		DataSource ds=null;
		InitialContext ctxt= null;
		Connection conn= null;
		try {
			ctxt = new InitialContext();
			ds=(DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			conn = ds.getConnection();
			
			//修改
			if(request.getParameter("update") != null) {
				processUpdate(request,response);
			}
			if(request.getParameter("acthome") != null) {
				response.sendRedirect("MarketHome.jsp");
			}
		}catch(NamingException ne) {
			System.out.println("Naming Service Lookup Exception");
		}catch (SQLException e) {
		      System.out.println("Database Connection Error"); 
	    } finally {
	      try {
	    	  if (conn != null) conn.close();
	      	} catch (Exception e) {
	        System.out.println("Connection Pool Error!");
	      	}
	      }
	      
	}

	private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String productid = request.getParameter("productid");
		MarketSellerDAO marketSellerDAO = new MarketSellerDAO();
		
		List<MarketSellerBean> list = new ArrayList<MarketSellerBean>();
		MarketSellerBean Bean = new MarketSellerBean();
		
		Bean.setProduct_id(productid);
		String product_name = request.getParameter("product_name");
		Bean.setProduct_name(product_name);
		String description = request.getParameter("description");
		Bean.setDescription(description);
		String product_area = request.getParameter("product_area");
		Bean.setProduct_area(product_area);
		String price = request.getParameter("price");
		Bean.setPrice(Integer.parseInt(price));
		
		list.add(Bean);
		marketSellerDAO.update(Bean);		
		response.sendRedirect("MarketS.jsp");
	}

}
