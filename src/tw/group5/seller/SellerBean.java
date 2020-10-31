package tw.group5.seller;

import java.io.File;
import java.io.Serializable;
import java.sql.Date;



public class SellerBean implements Serializable{
	private String email;
	private String sellerName;
	private Date  birthday;
	private int taxId;
	private int tel;
	private String addr;
	private String shopName;
	private File photo;
	private String description;
	private int gender;
	
	public SellerBean() {
	}
	
	public SellerBean(String email, String sellerName, Date birthday, int tel, String addr, int gender) {
		super();
		this.email = email;
		this.sellerName = sellerName;
		this.birthday = birthday;
		this.tel = tel;
		this.addr = addr;
		this.gender = gender;
	}

	public SellerBean(String email, String sellerName, Date birthday, int taxId, int tel, String addr, String shopName,
			File photo, String description, int gender) {
		super();
		this.email = email;
		this.sellerName = sellerName;
		this.birthday = birthday;
		this.taxId = taxId;
		this.tel = tel;
		this.addr = addr;
		this.shopName = shopName;
		this.photo = photo;
		this.description = description;
		this.gender = gender;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public File getPhoto() {
		return photo;
	}
	public void setPhoto(File photo) {
		this.photo = photo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getTaxId() {
		return taxId;
	}
	public void setTaxId(int taxId) {
		this.taxId = taxId;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}	 
}
