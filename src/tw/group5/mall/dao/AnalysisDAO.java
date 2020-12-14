package tw.group5.mall.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository
public class AnalysisDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private Integer userId;
	private String product;
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

// 獲得個人的月銷售額
	public BigDecimal getMonthlySales(Date last, Date start) {
		Session session = sessionFactory.getCurrentSession();
		String sql="select sum(amount*round(unitprice*discount)) from orderdetails where producterId= :producterId and orderId in (select orderId from orderform where orderdate between :last and :start) and status in (1,3)";
//		String sql="select s from(select sum(d.amount*round(d.unitprice*d.discount)) s,to_char(f.orderdate,'YYYY-MM') from orderdetails d left join orderform f on d.orderId=f.orderId where d.producterId= :producterId and f.orderdate BETWEEN :last and :start group by to_char(f.orderdate,'YYYY-MM') ORDER BY to_char(f.orderdate,'YYYY-MM') desc)";
		Query<?>query = session.createSQLQuery(sql);
		query.setParameter("producterId", userId);
		query.setParameter("start", start);
		query.setParameter("last", last);
		BigDecimal uniqueResult = (BigDecimal) query.uniqueResult();
		return uniqueResult;
	}
	
// 獲得個人單一產品的月銷售額
	public BigDecimal getMonthlyProductSales(Date last, Date start) {
		Session session = sessionFactory.getCurrentSession();
		String sql="select sum(amount*round(unitprice*discount)) from orderdetails where producterId= :producterId and orderId in (select orderId from orderform where orderdate between :last and :start) and REGEXP_SUBSTR(description,'[^ - ]+',1,1)= :product and status in (1,3)";
//		String sql="select s from(select sum(d.amount*round(d.unitprice*d.discount)) s,to_char(f.orderdate,'YYYY-MM') from orderdetails d left join orderform f on d.orderId=f.orderId where d.producterId= :producterId and f.orderdate BETWEEN :last and :start group by to_char(f.orderdate,'YYYY-MM') ORDER BY to_char(f.orderdate,'YYYY-MM') desc)";
		Query<?>query = session.createSQLQuery(sql);
		query.setParameter("producterId", userId);
		query.setParameter("start", start);
		query.setParameter("last", last);
		query.setParameter("product", product);
		BigDecimal uniqueResult = (BigDecimal) query.uniqueResult();
		return uniqueResult;
	}
	
// 獲得全站平均的月銷售額
	public BigDecimal getMonthlySalesForAll(Date last, Date start) {
		Session session = sessionFactory.getCurrentSession();
		String sql="select sum(amount*round(unitprice*discount)) from orderdetails where orderId in (select orderId from orderform where orderdate between :last and :start) and status in (1,3)";
		Integer count=getSalerNum();
//		String sql="select s from(select sum(d.amount*round(d.unitprice*d.discount)) s,to_char(f.orderdate,'YYYY-MM') from orderdetails d left join orderform f on d.orderId=f.orderId where d.producterId= :producterId and f.orderdate BETWEEN :last and :start group by to_char(f.orderdate,'YYYY-MM') ORDER BY to_char(f.orderdate,'YYYY-MM') desc)";
		Query<?>query = session.createSQLQuery(sql);
		query.setParameter("start", start);
		query.setParameter("last", last);
		BigDecimal uniqueResult = (BigDecimal) query.uniqueResult();
		if(uniqueResult!=null) {
		uniqueResult=new BigDecimal(Math.round(uniqueResult.doubleValue()/count));
		}
		return uniqueResult;
//		Session session = sessionFactory.getCurrentSession();
////		String sql="select sum(amount*round(unitprice*discount)) from orderdetails where producterId= :producterId and orderId in (select orderId from orderform where orderdate between :last and :start GROUP BY to_char(orderdate,'YYYY/MM'))";
//		String sql="select s from(select sum(d.amount*round(d.unitprice*d.discount)) s,to_char(f.orderdate,'YYYY-MM') from orderdetails d left join orderform f on d.orderId=f.orderId where f.orderdate BETWEEN :last and :start group by to_char(f.orderdate,'YYYY-MM') ORDER BY to_char(f.orderdate,'YYYY-MM') desc)";
//		Query<BigDecimal>query = session.createSQLQuery(sql);
//		query.setParameter("start", start);
//		query.setParameter("last", last);
//		List<BigDecimal> list =query.list();
//		return list;
	}
	
// 查詢全站賣家人數
	public int getSalerNum() {
		Session session = sessionFactory.getCurrentSession();
		int count = 0; // 必須使用 long 型態
		String hql = "select count( * ) from Member_SignUp where member_permissions=1";
		Query<Long> query = session.createQuery(hql, java.lang.Long.class);
		Object objectNumber = query.uniqueResult();
		long longNumber = (long) objectNumber;
		count = (int) longNumber;
		return count;
	}

// 取得個人售出產品清單
	public List<String> getUserProductList(Date last, Date start){
		Session session = sessionFactory.getCurrentSession();
		String sql="select REGEXP_SUBSTR(description,'[^ - ]+',1,1) from orderdetails where producterId= :producterId and orderId in (select orderId from orderform where orderdate between :last and :start) and status in (1,3) group by REGEXP_SUBSTR(description,'[^ - ]+',1,1)";
		Query<String>query = session.createSQLQuery(sql);
		query.setParameter("producterId", userId);
		query.setParameter("start", start);
		query.setParameter("last", last);
		List <String> list =query.list();
		return list;
	}
	
// 獲得個人各產品的訂單數
		public List<Long> getMonthlyProductOrder(Date last, Date start) {
			Session session = sessionFactory.getCurrentSession();
			String sql="select count(*) from orderdetails where producterId= :producterId and orderId in (select orderId from orderform where orderdate between :last and :start) and status in (1,3) group by REGEXP_SUBSTR(description,'[^ - ]+',1,1)";
			Query<Long>query = session.createSQLQuery(sql);
			query.setParameter("producterId", userId);
			query.setParameter("start", start);
			query.setParameter("last", last);
			List<Long> list =  query.list();
			return list;
		}
}
