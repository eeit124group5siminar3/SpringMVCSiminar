package active.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/ActiveHomeServlet")
public class ActiveHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
					
			if(request.getParameter("apply") != null) {			
				showApplyForm(request,response);				
			}
			else if(request.getParameter("selectone") != null) {			
				selectByName(request,response);
			}
			else if(request.getParameter("delete") != null) {				
				deleteActive(request,response);
			}
			else if(request.getParameter("update") != null) {
				selectById(request,response);
			}
			else if(request.getParameter("home") != null) {
				response.sendRedirect("index.jsp");
			}else {
				listActive(request, response);
				System.out.print("123");
			}
			
		}catch (SQLException e) {	
			e.printStackTrace();
		} catch (IOException e) {		
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
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
		return;
	}

	public void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));
		ActiveDAO aDao = new ActiveDAO(hsession);
		Active exit = aDao.select(actId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveUpdate.jsp");
		dispatcher.forward(request, response);
		return;
	}
	
	public void selectById(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException{
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));
		ActiveDAO aDao = new ActiveDAO(hsession);
		List<Active> list = new ArrayList<Active>();
		list.add(aDao.select(actId));
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveUpdate.jsp");
        dispatcher.forward(request, response); 
		return;
	}
	
	public void selectByName(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException{
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		String actName = request.getParameter("actName");
		ActiveDAO aDao = new ActiveDAO(hsession);
		aDao.selectName(actName);
		return;
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
		return;

	}

	public void updateActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		

	}

	public void deleteActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));

		Active aBean = new Active();
		ActiveDAO aDao = new ActiveDAO(hsession);
		aDao.delete(actId);
		response.sendRedirect("Active/ActiveSucc.jsp");

	}
}
