package mall.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.productModel.ProductBean;
import util.HibernateUtil;



public class ProductDAOHibernate {
	public static void main(String[] arg) {
		SessionFactory factory=HibernateUtil.getSessionFactory();
		Session session=factory.getCurrentSession();
		ProductBean pb=session.get(ProductBean.class, 97);
		System.out.println(pb.getProductId());
		System.out.println(pb.getProduct());
		session.getTransaction().commit();
		HibernateUtil.closeSessionFactory();
	}
	
	
}
