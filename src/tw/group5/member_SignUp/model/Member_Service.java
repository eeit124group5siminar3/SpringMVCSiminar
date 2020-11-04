package tw.group5.member_SignUp.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class Member_Service {

	@Autowired
	private Member_DAO memberDao;

	public boolean insert_member_sing_up(Member_SignUp member_data) {
		return memberDao.insert_member_sing_up(member_data);
	}

	public boolean check_signup_email(String member_email) {
		return memberDao.check_signup_email(member_email);
	}

	public boolean check_signup_id(String member_id) {
		return memberDao.check_signup_id(member_id);
	}

	public Member_SignUp login_bean(String member_email) {
		return memberDao.login_bean(member_email);
	}

	public String reset_password(String member_email, String member_id, String member_name, String member_cellphone) {
		return memberDao.reset_password(member_email, member_id, member_name, member_cellphone);
	}
	
	public boolean updata_member_password(String member_email, String password) {
		return memberDao.updata_member_password(member_email, password);
	}
	
	public boolean login_check(String member_email, String member_password) {
		return memberDao.login_check(member_email, member_password);
	}

}
