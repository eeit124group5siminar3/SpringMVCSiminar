package active;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;

public class Active implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String act_id;
	private String act_name;
	private String act_addr;
	private String tel;
	private int exp_num;
	private int act_num;
	private String sig_stat;
	private String member_no;
	private Date act_date;
	private Date date_sta;
	private Date date_end;
	private int price;
	private String act_type;
	private Clob act_descri;
	private Blob act_img;
	private Blob act_video;
	
	
	
	
	public Active(String act_id, String act_name, String act_addr, String tel, int exp_num, int act_num,
			String sig_stat, String member_no, Date act_date, Date date_sta, Date date_end, int price, String act_type,
			Clob act_descri, Blob act_img, Blob act_video) {
		super();
		this.act_id = act_id;
		this.act_name = act_name;
		this.act_addr = act_addr;
		this.tel = tel;
		this.exp_num = exp_num;
		this.act_num = act_num;
		this.sig_stat = sig_stat;
		this.member_no = member_no;
		this.act_date = act_date;
		this.date_sta = date_sta;
		this.date_end = date_end;
		this.price = price;
		this.act_type = act_type;
		this.act_descri = act_descri;
		this.act_img = act_img;
		this.act_video = act_video;
	}
	
	public Active() {
		
	}
	
	public Clob getAct_descri() {
		return act_descri;
	}
	public void setAct_descri(Clob act_descri) {
		this.act_descri = act_descri;
	}
	public Blob getAct_img() {
		return act_img;
	}
	public void setAct_img(Blob act_img) {
		this.act_img = act_img;
	}
	public Blob getAct_video() {
		return act_video;
	}
	public void setAct_video(Blob act_video) {
		this.act_video = act_video;
	}
	
	
	public String getAct_id() {
		return act_id;
	}
	public void setAct_id(String act_id) {
		this.act_id = act_id;
	}
	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	public String getAct_addr() {
		return act_addr;
	}
	public void setAct_addr(String act_addr) {
		this.act_addr = act_addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getExp_num() {
		return exp_num;
	}
	public void setExp_num(int exp_num) {
		this.exp_num = exp_num;
	}
	public int getAct_num() {
		return act_num;
	}
	public void setAct_num(int act_num) {
		this.act_num = act_num;
	}
	public String getSig_stat() {
		return sig_stat;
	}
	public void setSig_stat(String sig_stat) {
		this.sig_stat = sig_stat;
	}
	
	
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public Date getAct_date() {
		return act_date;
	}
	public void setAct_date(Date act_date) {
		this.act_date = act_date;
	}
		
	public Date getDate_sta() {
		return date_sta;
	}
	public void setDate_sta(Date date_sta) {
		this.date_sta = date_sta;
	}
	public Date getDate_end() {
		return date_end;
	}
	public void setDate_end(Date date_end) {
		this.date_end = date_end;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAct_type() {
		return act_type;
	}
	public void setAct_type(String act_type) {
		this.act_type = act_type;
	}
	
	//一日農夫table
	//活動編號	act_id
	//活動名稱	act_name
	//活動地址	act_addr
	//活動日期	act_date
	//連絡電話	tel
	//參與人數	exp_num
	//報名人數	act_num
	//報名狀態	sig_stat
	//賣家編號	MEMBER_NO
	//價格	price
	//報名開始日期	date_sta
	//報名結束日期	date_end
	//活動類型	act_type
	//活動描述	act_descri
	//照片名稱	img_name
	//活動照片	act_img
	//影片名稱	vid_name
	//宣傳影片	act_video

			

	
	
	
}
