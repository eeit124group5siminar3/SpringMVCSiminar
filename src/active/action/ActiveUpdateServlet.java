package active.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import active.model.Active;
import active.model.ActiveDAO;
import util.HibernateUtil;

@WebServlet("/ActiveUpdateServlet")
public class ActiveUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			if (request.getParameter("update") != null) {
				updateActive(request, response);
			}
			if (request.getParameter("acthome") != null) {
				request.getRequestDispatcher("ActiveHomeServlet").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	//更新資料
	public void updateActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		ActiveDAO aDao = new ActiveDAO(hsession);

		
			Active act = new Active();
			int actId = Integer.parseInt(request.getParameter("actId"));
			act.setActId(actId);
			System.out.println("測試測試" + actId);
			String actName = request.getParameter("actName");
			act.setActName(actName);
			String actType = request.getParameter("actType");
			act.setActType(actType);
			String actAddr = request.getParameter("actAddr");
			act.setActAddr(actAddr);
			String tel = request.getParameter("tel");
			act.setTel(tel);
			String actDate = request.getParameter("actDate");
			act.setActDate(new SimpleDateFormat("yyyy-MM-dd").parse(actDate));
			String dateSta = request.getParameter("dateSta");
			System.out.println(dateSta);
			act.setDateSta(new SimpleDateFormat("yyyy-MM-dd").parse(dateSta));
			String dateEnd = request.getParameter("dateEnd");
			act.setDateEnd(new SimpleDateFormat("yyyy-MM-dd").parse(dateEnd));
			String expNum = request.getParameter("expNum");
			act.setExpNum(Integer.parseInt(expNum));
			String price = request.getParameter("price");
			act.setPrice(Integer.parseInt(price));
			String actDescri = request.getParameter("actDescri");
			act.setActDescri(actDescri);

			System.out.println("-----------------");
			System.out.println(act);
			System.out.println();
			aDao.update(actId, act);
			response.sendRedirect("Active/ActiveSucc.jsp");

	}
}
