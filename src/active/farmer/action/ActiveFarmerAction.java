package active.farmer.action;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import active.farmer.model.ActSignUp;
import active.farmer.model.ActiveFarmer;
import active.farmer.model.ActiveFarmerDAO;
import util.HibernateUtil;

public class ActiveFarmerAction {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();		
		Session HibSession = factory.getCurrentSession();

		try {
			HibSession.beginTransaction();
			ActiveFarmer afBean = new ActiveFarmer();
			ActiveFarmerDAO afDao = new ActiveFarmerDAO(HibSession);
						
			afBean.setActName("活動1");
			afBean.setActType("體驗類");
			afBean.setActAddr("桃園市中壢區中大路300號");
			afBean.setTel("03-4221561");
			afBean.setActDate(new SimpleDateFormat("yyyy-MM-dd").parse("2020-11-20"));
			afBean.setActTimeSta(new SimpleDateFormat("HH:mm:ss").parse("9:30:00"));
			afBean.setActTimeEnd(new SimpleDateFormat("HH:mm:ss").parse("15:30:00"));
			afBean.setNumLim(50);
			afBean.setMemberNo("001");
			afBean.setPrice(100);
			afBean.setActDescri("測試可不可以新增成功");
			afBean.setImgName("測試");
					
			ActSignUp asBean = new ActSignUp();
			asBean.setSignStaDate(new SimpleDateFormat("yyyy-MM-dd").parse("2020-10-27"));
			asBean.setSignStaTime(new SimpleDateFormat("HH:mm:ss").parse("9:30:00"));
			asBean.setSignEndDate(new SimpleDateFormat("yyyy-MM-dd").parse("2020-10-31"));
			asBean.setSignEndTime(new SimpleDateFormat("HH:mm:ss").parse("9:30:00"));
					
			asBean.setActiveFarmer(afBean);
			afBean.setActSignUp(asBean);
			
			ActiveFarmer activefarmer = afDao.insert(afBean);
			HibSession.save(activefarmer);
			HibSession.getTransaction().commit();
		} catch (Exception e) {
			HibSession.getTransaction().rollback();
			e.printStackTrace();
		}
	}
	
	
	

}
