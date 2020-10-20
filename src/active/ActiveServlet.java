package active;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import recipe.DAO.Recipe_DAO;

/**
 * Servlet implementation class ActiveServlet
 */
@WebServlet("/ActiveServlet")
public class ActiveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			
			//申請
			if(request.getParameter("apply") != null) {
				processInsert(request,response,activeDAO);
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
	//新增
	private void processInsert(HttpServletRequest request,
                             HttpServletResponse response,ActiveDAO activeDAO) throws SQLException, IOException {	 
	
		
		PrintWriter out = response.getWriter();
		
//		ActiveDAO activeDAO = new ActiveDAO();
//		List<Active> actives = activeDAO.listActive();
//		System.out.println(actives);
		//活動table
//		for(Active act :actives) {
		Active act = new Active();
//			act.setAct_id(act_id);
			String act_name = request.getParameter("actName");
			act.setAct_name(act_name);
			String act_type = request.getParameter("actType");
			act.setAct_type(act_type);
			String act_addr = request.getParameter("actAddr");
			act.setAct_addr(act_addr);
			String tel = request.getParameter("tel");
			act.setTel(tel);
			String act_date = request.getParameter("actDate");
			act.setAct_date(strToDate(act_date));
			String date_sta = request.getParameter("dateSta");	
			
			System.out.println(date_sta);	
			
			act.setDate_sta(strToDate(date_sta));
			String date_end = request.getParameter("dateEnd");
			act.setDate_end(strToDate(date_end));
			String exp_num = request.getParameter("expNum");
			act.setExp_num(Integer.parseInt(exp_num));
			String price = request.getParameter("price");
			act.setPrice(Integer.parseInt(price));
			
			System.out.println("-----------------");
			System.out.println(act);
			activeDAO.insertActive(act);
		System.out.println("新增成功");
		response.sendRedirect("ActiveSucc.jsp");
//		out.println("<H1 ALIGN='CENTER'>一日農夫活動申請成功</H1>"); 
		//明細table
//		String actDescri = request.getParameter("act_descri");
//		File
//		File

		
		
	}
	
	 }
