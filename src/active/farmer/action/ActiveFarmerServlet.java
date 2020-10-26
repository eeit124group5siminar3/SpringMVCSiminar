package active.farmer.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import active.farmer.model.ActSignUp;
import active.farmer.model.ActiveFarmer;
import active.farmer.model.ActiveFarmerDAO;
import util.HibernateUtil;

/**
 * Servlet implementation class ActiveFarmerServlet
 */
@WebServlet("/ActiveFarmerServlet")
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)
public class ActiveFarmerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int IMAGE_FILENAME_LENGTH = 20;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Map<String, String> errorMsgs = new HashMap<String, String>();
//		Map<String, String> successMsgs = new HashMap<String, String>();
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		processInsert(request, response);

	}

	public void listActive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		
		ActiveFarmerDAO afDao = new ActiveFarmerDAO(hsession);
		List<ActiveFarmer> listAct = afDao.selectAll();
		request.setAttribute("listAct", listAct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveFarmerHome.jsp");
		dispatcher.forward(request, response);
		
	}

	public void showApplyForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveFarmerApply.jsp");
		dispatcher.forward(request, response);
	}

	public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));
		ActiveFarmerDAO afDao = new ActiveFarmerDAO(hsession);
		ActiveFarmer exit = afDao.selectOne(actId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Active/ActiveFarmerUpdate.jsp");
		dispatcher.forward(request, response);
		
	}
	

	public void processInsert(HttpServletRequest request, HttpServletResponse response) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();

		try {
			hsession.beginTransaction();
			ActiveFarmer afBean = new ActiveFarmer();
			ActiveFarmerDAO afDao = new ActiveFarmerDAO(hsession);

			afBean.setActName("活動1");
			afBean.setActType("體驗類");
			afBean.setActAddr("桃園市中壢區中大路300號");
			afBean.setTel("03-4221561");
			afBean.setActDate(new SimpleDateFormat("yyyy-MM-dd").parse("2020-11-20"));
			afBean.setActTimeSta(new SimpleDateFormat("HH:mm:ss").parse("9:30:00"));
			afBean.setActTimeEnd(new SimpleDateFormat("HH:mm:ss").parse("15:30:00"));
			afBean.setNumLim(50);
//			afBean.setMemberNo("001");
			afBean.setPrice(100);
			afBean.setActDescri("測試可不可以新增成功");
			afBean.setImgName("測試");

			ActSignUp asBean = new ActSignUp();
			asBean.setSignStaDate(new SimpleDateFormat("yyyy-MM-dd").parse("2020-10-27"));
			asBean.setSignStaTime(new SimpleDateFormat("HH:mm:ss").parse("09:30:00"));
			asBean.setSignEndDate(new SimpleDateFormat("yyyy-MM-dd").parse("2020-10-31"));
			asBean.setSignEndTime(new SimpleDateFormat("HH:mm:ss").parse("09:30:00"));

			asBean.setActiveFarmer(afBean);
			afBean.setActSignUp(asBean);

			ActiveFarmer activefarmer = afDao.insert(afBean);
			hsession.save(activefarmer);
			hsession.getTransaction().commit();
		} catch (Exception e) {
			hsession.getTransaction().rollback();
			e.printStackTrace();
		}
	}
	
	public void processUpdate(HttpServletRequest request, HttpServletResponse response) {
		
	}

	public void processDelet(HttpServletRequest request, HttpServletResponse response) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hsession = factory.getCurrentSession();
		int actId = Integer.parseInt(request.getParameter("actId"));

		ActiveFarmer afBean = new ActiveFarmer();
		ActiveFarmerDAO afDao = new ActiveFarmerDAO(hsession);
		afDao.delete(actId);
	}

}
