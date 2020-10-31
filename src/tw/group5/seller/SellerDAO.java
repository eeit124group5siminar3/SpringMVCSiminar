package tw.group5.seller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SellerDAO {

	void sellerRegister(HttpServletRequest request, HttpServletResponse response);
	boolean checkAccount(String trim);
	boolean loginCheck(String email, String password);

}
