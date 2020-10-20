package NActive;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NActivePreInsertServlet
 */
@WebServlet("/NActivePreInsertServlet")
public class NActivePreInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 NActiveService NActiveService =new NActiveServiceImpl();
		 String ActTypeTag = NActiveService.getActTypeTag();
		 request.setAttribute("SelectActTypeTag", ActTypeTag);
		 
		 request.setAttribute("ActBean", NActiveService);
		 RequestDispatcher rd = request.getRequestDispatcher("/NActiveInsert.jsp");
			rd.forward(request, response);
			return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);		
	}

}
