package tw.group5.member_SignUp.model;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class Member_DAO {

	private SessionFactory sessionFactory;

	// 連線DB
	@Autowired
	public Member_DAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 會員註冊
	public boolean insert_member_sing_up(Member_SignUp member_data) {
		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_data.getMember_email());

		// 若無資料回傳null
		if (result.uniqueResult() == null) {

			Date now_date = new Date();
			member_data.setMember_signup_date(now_date);

			session.save(member_data);
			System.out.println("會員資料註冊成功");
			return true;
		}
		return false;
	}

	// 會員註冊，驗證EMAIL
	public boolean check_signup_email(String member_email) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_email);

		// 若無資料回傳null
		if (result.uniqueResult() == null) {
			return true;
		}
		return false;
	}

	// 會員註冊，驗證身分證字號
	public boolean check_signup_id(String member_id) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_id = session.createQuery("From Member_SignUp Where Member_id=?0");
		Query<?> result = query_id.setParameter(0, member_id);
		// 若無資料回傳null
		if (result.uniqueResult() == null) {
			return true;
		}
		return false;
	}

	// 登錄驗證
	public boolean login_check(String member_email, String member_password) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		query_email.setParameter(0, member_email);
		
		Member_SignUp result = (Member_SignUp) query_email.uniqueResult(); 
		
System.err.println(result);
		// 有資料就做判斷
		if (result != null) {
			String password = result.getMember_password();
			if (member_password.equals(password)) {
				return true;
			}
		}
		return false;
	}

	// 登錄資料包Bean
	public Member_SignUp login_bean(String member_email) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_email);

		// 有資料就做判斷
		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			return member_bean;
		}
		return null;
	}

	// 忘記密碼(回傳亂數密碼)
	public String reset_password(String member_email, String member_id, String member_name, String member_cellphone) {

		// HQL語法搜尋
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_email);

		// 有資料就做判斷
		if (result.uniqueResult() != null) {
			// 把資料包成Bean
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();

			// 從Bean取各個資料出來
			String check_id = member_bean.getMember_id();
			String check_name = member_bean.getMember_name();
			String check_cellphone = member_bean.getMember_cellphone();

			// 做資料比對，正確回傳亂數PassWord
			if (check_id.equals(member_id.toUpperCase()) && check_name.equals(member_name)
					&& check_cellphone.equals(member_cellphone)) {

				String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
				StringBuffer buffer = new StringBuffer();

				for (int i = 1; i <= 10; i++) {

					char random = chars.charAt((int) (Math.random() * 62));
					buffer.append(random);
				}
				return buffer.toString();
			}
		}
		return "NO DATA";
	}

	// 忘記密碼，修改密碼
	public boolean updata_member_password(String member_email, String password) {

		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_email);

		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			member_bean.setMember_password(password);
			return true;
		}
		return false;
	}

	// 忘記密碼，資料包Bean回傳修改密碼
	public Member_SignUp reset_bean(String member_email) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_email);

		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			String email = member_bean.getMember_email();
			String password = member_bean.getMember_password();
			Member_SignUp rest_bean = new Member_SignUp(email, password);
			return rest_bean;
		}
		return null;
	}

	// 修改會員資料
	public boolean updata_member_data(String member_email, String member_permissions, String password,
			String member_cellphone, String member_address, String e_paper, String member_bank_code,
			String member_bank_account) {

		Session session = sessionFactory.getCurrentSession();
		Query<?> query_email = session.createQuery("From Member_SignUp Where Member_email=?0");
		Query<?> result = query_email.setParameter(0, member_email);

		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			member_bean.setMember_permissions(member_permissions);
			member_bean.setMember_password(password);
			member_bean.setMember_cellphone(member_cellphone);
			member_bean.setMember_address(member_address);
			member_bean.setE_paper(e_paper);
			member_bean.setMember_bank_code(member_bank_code);
			member_bean.setMember_bank_account(member_bank_account);

			return true;
		}
		return false;
	}

	// Admin會員搜尋全部資料
	public List<Member_SignUp> Select_Member(String page) {
		Session session = sessionFactory.getCurrentSession();

		int intpage = Integer.valueOf(page);
		Integer pageNo = (intpage - 1) * 10;

		Query<Member_SignUp> query = session.createQuery("From Member_SignUp", Member_SignUp.class);

		query.setFirstResult(pageNo);
		query.setMaxResults(10);
		List<Member_SignUp> list = query.list();

		return list;
	}

	// 搜尋總比數
	public int totalPages() {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("select count(*) From Member_SignUp");
		long result = (long) query.uniqueResult();
		return (int) result;
	}

	// Admin會員搜尋部分資料
	public Member_SignUp Select_Member_no(String member_no) {
		Session session = sessionFactory.getCurrentSession();

		Query<Member_SignUp> query_member_no = session.createQuery("From Member_SignUp Where Member_no=?0",
				Member_SignUp.class);
		Query<Member_SignUp> result = query_member_no.setParameter(0, member_no);

		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			return member_bean;
		}
		return null;
	}

	// Admin 修改會員資料
	public boolean Admin_Updata_Member_Data(String member_no, String member_permissions, String member_email,
			String member_password, String member_name, Date member_birthday, String member_cellphone, String member_id,
			String member_address, String member_gui_number, String e_paper, String member_bank_code,
			String member_bank_account, String member_gg, String member_lock_acc) {

		Session session = sessionFactory.getCurrentSession();
		Query<Member_SignUp> query_member_no = session.createQuery("From Member_SignUp Where Member_no=?0",
				Member_SignUp.class);
		Query<Member_SignUp> result = query_member_no.setParameter(0, member_no);

		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			member_bean.setMember_permissions(member_permissions);
			member_bean.setMember_email(member_email);
			member_bean.setMember_password(member_password);
			member_bean.setMember_name(member_name);
			member_bean.setMember_birthday(member_birthday);
			member_bean.setMember_cellphone(member_cellphone);
			member_bean.setMember_id(member_id);
			member_bean.setMember_address(member_address);
			member_bean.setMember_gui_number(member_gui_number);
			member_bean.setE_paper(e_paper);
			member_bean.setMember_bank_code(member_bank_code);
			member_bean.setMember_bank_account(member_bank_account);
			member_bean.setMember_gg(member_gg);
			member_bean.setMember_lock_acc(member_lock_acc);

			return true;
		}
		return false;
	}

	// Admin 刪除會員資料
	public boolean Admin_Delete_Member_Data(Integer member_no) {
		Session session = sessionFactory.getCurrentSession();
		Member_SignUp result = session.get(Member_SignUp.class, member_no);

		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	// FB會員完整註冊(更新)
	public boolean Fb_Updata_Member_Data(String member_email, String member_permissions, String member_password, Date member_birthday,
			String member_cellphone, String member_id, String member_address, String member_gui_number, String e_paper,
			String member_gg, String member_lock_acc, String member_bank_code, String member_bank_account) {

		Session session = sessionFactory.getCurrentSession();
		Query<Member_SignUp> query_member_no = session.createQuery("From Member_SignUp Where Member_email=?0",
				Member_SignUp.class);
		Query<Member_SignUp> result = query_member_no.setParameter(0, member_email);

		if (result.uniqueResult() != null) {
			Member_SignUp member_bean = (Member_SignUp) result.uniqueResult();
			member_bean.setMember_permissions(member_permissions);
			member_bean.setMember_password(member_password);
			member_bean.setMember_birthday(member_birthday);
			member_bean.setMember_cellphone(member_cellphone);
			member_bean.setMember_id(member_id);
			member_bean.setMember_address(member_address);
			member_bean.setMember_gui_number(member_gui_number);
			member_bean.setE_paper(e_paper);
			member_bean.setMember_bank_code(member_bank_code);
			member_bean.setMember_bank_account(member_bank_account);
			member_bean.setMember_gg(member_gg);
			member_bean.setMember_lock_acc(member_lock_acc);

			return true;
		}
		return false;
	}

}
