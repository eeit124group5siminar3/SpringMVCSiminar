package tw.group5.recipe.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;


@Repository
public class AnalysisBLOG_DAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	//搜尋某日某篇文章的回文數
	public long Pageviews(String date,Integer blog_id) {
		Session session = sessionFactory.getCurrentSession();
//		String hql="select * from Msg_Blog_Bean where msg_date between :startDate and :endDate";
		String hql="select * from (select * from Msg_Blog_Bean where blog_id=:blog_id) where msg_date = :date";
		Query<Long> query=session.createQuery(hql);
		query.setParameter("date",date);
		query.setParameter("blog_id",blog_id);
		long counts=query.uniqueResult();
		
		return (int)counts;
	}
}
