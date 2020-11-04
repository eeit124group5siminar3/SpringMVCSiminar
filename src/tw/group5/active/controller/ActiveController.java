package tw.group5.active.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.group5.active.model.Active;
import tw.group5.active.model.ActiveDAO;
import tw.group5.util.HibernateUtil;

@WebServlet("/activeController")
public class ActiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/new":
				showApplyForm(request,response);
				break;
			case "/insert":
				insertActive(request,response);
				break;
			case "/delete":
				deleteActive(request,response);
				break;
			case "/edit":
				showEditForm(request,response);
				break;
			case "/update":
				updateActive(request,response);
				break;
			default:
				listActive(request,response);
				break;
			}
		}catch(SQLException ex) {
			throw new ServletException(ex);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
	}

	public void listActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		
		ActiveDAO aDao = new ActiveDAO(hsession);
		List<Active> listAct = aDao.selectAll();
		request.setAttribute("listAct", listAct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveHome.jsp");
		dispatcher.forward(request, response);

	}

	public void showApplyForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveApply.jsp");
		dispatcher.forward(request, response);

	}

	public void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));
		ActiveDAO aDao = new ActiveDAO(hsession);
		Active exit = aDao.select(actId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveUpdate.jsp");
		dispatcher.forward(request, response);

	}

	public void insertActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));
		ActiveDAO aDao = new ActiveDAO(hsession);
		
		Active act = new Active();
//		act.setAct_id(act_id);
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
		
		System.out.println("-----------------");
		System.out.println(act);
		aDao.insert(act);
	System.out.println("新增成功");
	response.sendRedirect("ActiveSucc.jsp");

	}

	public void updateActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

	}

	public void deleteActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));

		Active aBean= new Active();
		ActiveDAO aDao = new ActiveDAO(hsession);
		aDao.delete(actId);

	}
}
