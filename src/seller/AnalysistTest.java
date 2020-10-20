package seller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class AnalysistTest
 */
@WebServlet("/AnalysistTest")
public class AnalysistTest extends HttpServlet {

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	DataSource ds = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AnalysistTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {
		try {
			InitialContext ctxt = new InitialContext();
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/xe"); // for Oracle DB
		} catch (NamingException ne) {
			throw new ServletException(ne);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		String query = "select * from ord";
		out.println("<html>");
		out.println("<head><title>GetEmployeeInfoServlet</title></head>");
		out.println("<body>");
		out.println("<table>");
		out.println("<tr><td>123</td><td>456</td></tr>");
		try{
			System.out.println("123");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				out.println("<tr><td>" + rs.getInt(1) + "</td><td>" + "<tr><td>" + rs.getInt(2) + "</td></tr>");
			
		      }
		     
			 rs.close();
		     stmt.close();
		     conn.close();
		} catch (Exception se) {
			 se.printStackTrace(out);
		}
		out.println("</table>");
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
