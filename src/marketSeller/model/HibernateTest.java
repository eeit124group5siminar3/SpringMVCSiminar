package marketSeller.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

/**
 * Servlet implementation class HibernateTest
 */
@WebServlet("/HibernateTest")
public class HibernateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processAction(request,response);
		

	}
	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SessionFactory factory =HibernateUtil.getSessionFactory();
		Session session =factory.getCurrentSession();
		
		MarketProductDao mTest = new MarketProductDao(session);
		MarketProductTotalBean bean = mTest.select("a381");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		out.write("ONE: " +bean.getProductId());
		out.write("ONE: " +bean.getProductName());
		out.write("ONE: " +bean.getMarketName());
		
		
	}

}
