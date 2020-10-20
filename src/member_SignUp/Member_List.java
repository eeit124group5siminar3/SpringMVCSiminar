package member_SignUp;

import java.util.List;
import java.sql.Date;

public interface Member_List {

	List<Member_Bean> listmember_object();
	
	boolean insert_member_sing_up(Member_Bean seller_data);
	


	

}
