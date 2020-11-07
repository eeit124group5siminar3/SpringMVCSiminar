package tw.group5.active.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "active")
@Component("active")
public class Active implements Serializable {

	private static final long serialVersionUID = 1L;

	private int actId;
	private String actName;
	private String actAddr;
	private String tel;
	private int expNum;
	private int actNum;
	private String sigStat;
	private String memberNo;
	private Date actDate;
	private Date dateSta;
	private Date dateEnd;
	private int price;
	private String actType;
	private String actDescri;
	private byte[] actImg;
	private String imgName;

	public Active() {

	}

	public Active(int actId, String actName, String actAddr, String tel, int expNum, int actNum, String sigStat,
			String memberNo, Date actDate, Date dateSta, Date dateEnd, int price, String actType, String actDescri,
			byte[] actImg, String imgName) {
		this.actId = actId;
		this.actName = actName;
		this.actAddr = actAddr;
		this.tel = tel;
		this.expNum = expNum;
		this.actNum = actNum;
		this.sigStat = sigStat;
		this.memberNo = memberNo;
		this.actDate = actDate;
		this.dateSta = dateSta;
		this.dateEnd = dateEnd;
		this.price = price;
		this.actType = actType;
		this.actDescri = actDescri;
		this.actImg = actImg;
		this.imgName = imgName;
	}
	
	public Active(String actName, String actType, String actAddr, String tel,Date actDate, Date dateSta, Date dateEnd,int expNum, int price, String actDescri) {
		this.actName = actName;
		this.actType = actType;
		this.actAddr = actAddr;
		this.tel = tel;
		this.actDate = actDate;
		this.dateSta = dateSta;
		this.dateEnd = dateEnd;
		this.expNum = expNum;
		this.price = price;		
		this.actDescri = actDescri;
		
	}
	
	public Active(int actId, String actName, String actType, String actAddr, String tel,Date actDate, Date dateSta, Date dateEnd,int expNum, int price, String actDescri) {
		this.actId = actId;
		this.actName = actName;
		this.actType = actType;
		this.actAddr = actAddr;
		this.tel = tel;
		this.actDate = actDate;
		this.dateSta = dateSta;
		this.dateEnd = dateEnd;
		this.expNum = expNum;
		this.price = price;		
		this.actDescri = actDescri;
		
	}

	@Id
	@Column(name = "actId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getActId() {
		return actId;
	}

	public void setActId(int actId) {
		this.actId = actId;
	}

	@Column(name = "actName")
	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	@Column(name = "actAddr")
	public String getActAddr() {
		return actAddr;
	}

	public void setActAddr(String actAddr) {
		this.actAddr = actAddr;
	}

	@Column(name = "tel")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "expNum")
	public int getExpNum() {
		return expNum;
	}

	
	public void setExpNum(int expNum) {
		this.expNum = expNum;
	}

	@Column(name = "actNum")
	public int getActNum() {
		return actNum;
	}

	public void setActNum(int actNum) {
		this.actNum = actNum;
	}

	@Column(name = "sigStat")
	public String getSigStat() {
		return sigStat;
	}

	public void setSigStat(String sigStat) {
		this.sigStat = sigStat;
	}

	@Column(name = "memberNo")
	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Column(name = "actDate")
	@Temporal(TemporalType.DATE)
	public Date getActDate() {
		return actDate;
	}

	public void setActDate(Date actDate) {
		this.actDate = actDate;
	}

	@Column(name = "DateSta")
	@Temporal(TemporalType.DATE)
	public Date getDateSta() {
		return dateSta;
	}

	public void setDateSta(Date dateSta) {
		this.dateSta = dateSta;
	}

	@Column(name = "DateEnd")
	@Temporal(TemporalType.DATE)
	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	@Column(name = "price")
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Column(name = "actType")
	public String getActType() {
		return actType;
	}

	public void setActType(String actType) {
		this.actType = actType;
	}

	@Column(name = "actDescri")
	public String getActDescri() {
		return actDescri;
	}

	public void setActDescri(String actDescri) {
		this.actDescri = actDescri;
	}

	@Column(name = "actImg")
	public byte[] getActImg() {
		return actImg;
	}

	public void setActImg(byte[] actImg) {
		this.actImg = actImg;
	}

	@Column(name = "imgName")
	public String getImgName() {
		return imgName;
	}


	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	// 一日農夫table
	// 活動編號 act_id
	// 活動名稱 act_name
	// 活動地址 act_addr
	// 活動日期 act_date
	// 連絡電話 tel
	// 參與人數 exp_num
	// 報名人數 act_num
	// 報名狀態 sig_stat
	// 賣家編號 MEMBER_NO
	// 價格 price
	// 報名開始日期 date_sta
	// 報名結束日期 date_end
	// 活動類型 act_type
	// 活動描述 act_descri
	// 照片名稱 img_name
	// 活動照片 act_img
	// 影片名稱 vid_name
	// 宣傳影片 act_video

}
