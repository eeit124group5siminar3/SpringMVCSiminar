package tw.group5.recipe.DAO;

import java.util.Date;
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
	public long Pageviews(Integer blog_id,String startDate,String endDate) {
		Session session = sessionFactory.getCurrentSession();
//		String hql="select * from Msg_Blog_Bean where msg_date between :startDate and :endDate"; (select * from Msg_Blog_Bean where blog_id=:blog_id)
		String hql="select count(*) from Msg_Blog_Bean where msg_date in (SELECT to_char(msg_date,'YYYY/MM/DD') from Msg_Blog_Bean where blog_id=:blog_id group by msg_date)";
		String hql2="SELECT to_char(msg_date,'YYYY/MM/DD')FROM Msg_Blog_Bean WHERE msg_date :startDate AND :endDate AND blog_id=:blog_id GROUP BY to_char(msg_date,'YYYY/MM/DD') ORDER BY msg_date";
		Query<Long> query=session.createQuery(hql);
		query.setParameter("blog_id",blog_id);
		query.setParameter("startDate",startDate);
		query.setParameter("endDate",endDate);
		long counts=query.uniqueResult();
		
		return (int)counts;
	}
	
	
	public List<Msg_Blog_Bean> PageviewsbyDate(Integer blog_id,Date startDate,Date endDate) {
		Session session = sessionFactory.getCurrentSession();
//		String hql="select * from Msg_Blog_Bean where msg_date between :startDate and :endDate"; (select * from Msg_Blog_Bean where blog_id=:blog_id)
//		String hql="select count(*) from Msg_Blog_Bean where msg_date in (SELECT to_char(msg_date,'YYYY/MM/DD') from Msg_Blog_Bean where blog_id=:blog_id group by msg_date)";
		String hql2="SELECT * FROM Msg_Blog WHERE msg_date between ? AND ? AND blog_id=? ORDER BY msg_date  ";
		Query<Msg_Blog_Bean> query=session.createSQLQuery(hql2);
		query.setParameter(3,blog_id);
		query.setParameter(1,startDate);
		query.setParameter(2,endDate);
		List<Msg_Blog_Bean> list=query.list();
		return list;
	}
}
