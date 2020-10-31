package tw.group5.seller;

import java.sql.Date;

public class SellerAccountBean {
	private String email;
	private String sellerPassword;
	private int accountStatus;
	private Date registerDate;
	
	public SellerAccountBean() {
	}
	
	public SellerAccountBean(String email, String sellerPassword, int accountStatus, Date registerDate) {
		super();
		this.email = email;
		this.sellerPassword = sellerPassword;
		this.accountStatus = accountStatus;
		this.registerDate = registerDate;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSellerPassword() {
		return sellerPassword;
	}
	public void setSellerPassword(String sellerPassword) {
		this.sellerPassword = sellerPassword;
	}
	public int getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
}
