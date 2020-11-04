package tw.group5.active.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
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

import tw.group5.active.model.Active;
import tw.group5.active.model.ActiveDAO;
import tw.group5.util.HibernateUtil;

@WebServlet("/ActiveHomeServlet")
public class ActiveHomeServlet extends HttpServlet {
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

	//導向新增頁面
	public void showApplyForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveApply.jsp");
		dispatcher.forward(request, response);
		return;
	}

	//導向更新頁面
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
	
	//查詢ByID for PreUpedate
	public void selectById(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException{
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		
		int actId = Integer.parseInt(request.getParameter("actId"));
		System.out.println(actId);
		ActiveDAO aDao = new ActiveDAO(hsession);
		List<Active> list = new ArrayList<Active>();
		list.add(aDao.select(actId));
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveUpdate.jsp");
        dispatcher.forward(request, response); 
		return;
	}
	
	//查詢ByName
	public void selectByName(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException{
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		
		String actName = request.getParameter("selectname");
		ActiveDAO aDao = new ActiveDAO(hsession);
		System.out.println(actName);
			
		List<Active> listAct = aDao.selectName(actName);
		request.setAttribute("listAct", listAct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveHome.jsp");
		dispatcher.forward(request, response);
		return;
		
	}


	//刪除方法
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
