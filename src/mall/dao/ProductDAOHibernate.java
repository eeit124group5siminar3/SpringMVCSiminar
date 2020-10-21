package mall.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;



public class ProductDAOHibernate {
	SessionFactory factory=HibernateUtil.getSessionFactory();
	Session session=factory.getCurrentSession();
	session
	
}
