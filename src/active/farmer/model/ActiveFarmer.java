package active.farmer.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "activeFarmer")
public class ActiveFarmer implements Serializable {
	private static final long serialVersionUID = 1L;

	private int actId;
	private String actName;
	private String actType;
	private String actAddr;
	private String tel;
	private Date actDate;
	private Date actTimeSta;
	private Date actTimeEnd;
	private int numLim;
	private String memberNo;
	private int price;
	private String actDescri;
	private String imgName;
	private byte[] actImg;
	private int actLock;
	private ActSignUp actSignUp;

	public ActiveFarmer() {

	}

	public ActiveFarmer(int actId, String actName, String actType, String actAddr, String tel, Date actDate,
			Date actTimeSta, Date actTimeEnd, int numLim, String memberNo, int price, String actDescri, String imgName,
			byte[] actImg, int actLock, ActSignUp actSignUp) {
		super();
		this.actId = actId;
		this.actName = actName;
		this.actType = actType;
		this.actAddr = actAddr;
		this.tel = tel;
		this.actDate = actDate;
		this.actTimeSta = actTimeSta;
		this.actTimeEnd = actTimeEnd;
		this.numLim = numLim;
		this.memberNo = memberNo;
		this.price = price;
		this.actDescri = actDescri;
		this.imgName = imgName;
		this.actImg = actImg;
		this.actLock = actLock;
		this.actSignUp = actSignUp;
	}

	@Id
	@Column(name = "actId")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
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

	@Column(name = "actType")
	public String getActType() {
		return actType;
	}

	public void setActType(String actType) {
		this.actType = actType;
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

	@Column(name = "actDate")
	@Temporal(TemporalType.DATE)
	public Date getActDate() {
		return actDate;
	}

	public void setActDate(Date actDate) {
		this.actDate = actDate;
	}

	@Column(name = "actTimeSta")
	@Temporal(TemporalType.TIME)
	public Date getActTimeSta() {
		return actTimeSta;
	}

	public void setActTimeSta(Date actTimeSta) {
		this.actTimeSta = actTimeSta;
	}

	@Column(name = "actTimeEnd")
	@Temporal(TemporalType.TIME)
	public Date getActTimeEnd() {
		return actTimeEnd;
	}

	public void setActTimeEnd(Date actTimeEnd) {
		this.actTimeEnd = actTimeEnd;
	}

	@Column(name = "numLim")
	public int getNumLim() {
		return numLim;
	}

	public void setNumLim(int numLim) {
		this.numLim = numLim;
	}

	@Column(name = "memberNo")
	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Column(name = "price")
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Column(name = "actDescri")
	public String getActDescri() {
		return actDescri;
	}

	public void setActDescri(String actDescri) {
		this.actDescri = actDescri;
	}

	@Column(name = "imgName")
	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Column(name = "actImg")
	@Lob
	public void setActImg(byte[] actImg) {
		this.actImg = actImg;
	}

	public void setActLock(int actLock) {
		this.actLock = actLock;
	}

	@Column(name = "actLock")
	public int getActLock() {
		return actLock;
	}

	public byte[] getActImg() {
		return actImg;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "activeFarmer", cascade = CascadeType.ALL)
	public ActSignUp getActSignUp() {
		return actSignUp;
	}

	public void setActSignUp(ActSignUp actSignUp) {
		this.actSignUp = actSignUp;
	}

}
