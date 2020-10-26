package active.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ActiveUpdateServlet
 */
@WebServlet("/ActiveUpdateServlet1")
public class ActiveUpdateServlet1 extends HttpServlet {
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
		ActiveDAO activeDAO = new ActiveDAO();
		try {
			ctxt = new InitialContext();
			ds=(DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			conn = ds.getConnection();
			
			//修改
			if(request.getParameter("update") != null) {
				processUpdate(request,response);
			}
			if(request.getParameter("acthome") != null) {
				response.sendRedirect("ActiveHome.jsp");
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
	
	public java.sql.Date strToDate(String strDate){
		String str= strDate;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d= null;
		try {
			d= format.parse(str);
		}catch(Exception e){
			e.printStackTrace();
		}
		java.sql.Date date = new java.sql.Date (d.getTime());
		return date;
	}
	//Step.2修改活動table===========================================================
			private void processUpdate(HttpServletRequest request,
		            HttpServletResponse response) throws SQLException, IOException, ServletException {	 

				String actid = request.getParameter("actid");
				System.out.print(1);
				ActiveDAO activeDAO = new ActiveDAO();
				List<Active> actives = activeDAO.listActive();
				List<Active> list = new ArrayList<Active>();
				Active active = new Active();
				active.setAct_id(actid);
				String act_name = request.getParameter("actName");
				active.setAct_name(act_name);
				String act_type = request.getParameter("actType");
				active.setAct_type(act_type);
				String act_addr = request.getParameter("actAddr");
				active.setAct_addr(act_addr );
				String tel = request.getParameter("tel");
				active.setTel(tel);
				String act_date = request.getParameter("actDate");
				active.setAct_date(strToDate(act_date));
				String date_sta = request.getParameter("dateSta");
				
				System.out.println(date_sta);
				
				active.setDate_sta(strToDate(date_sta));
				String date_end = request.getParameter("dateEnd");
				active.setDate_end(strToDate(date_end));
				String exp_num = request.getParameter("expNum");
				active.setExp_num(Integer.parseInt(exp_num));
				String price = request.getParameter("price");
				active.setPrice(Integer.parseInt(price));
				
				list.add(active);
				activeDAO.update(active);		
				response.sendRedirect("ActiveSucc.jsp");
				
//				System.out.print(2);
//				for (Active act : actives) {
//					System.out.print(3);
//					System.out.print(act.getAct_id());
//					if(act.getAct_id().equals(actid)){
//						System.out.print(act.getAct_id());
//						System.out.print(4);
//						activeDAO.update(act);
//						response.sendRedirect("ActiveSucc.jsp");
//						System.out.print(5);
//					}					
//				}	
				  return;
		} 
	}
			
