package active.farmer.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
	private Timestamp actTimeSta;
	private Timestamp actTimeEnd;
	private int numLim;
	private String memberNo;
	private int price;
	private String actDescri;
	private String imgName;
	private Blob actImg;
	private int actLock;
	private ActSignUp actSignUp;

	public ActiveFarmer() {

	}

	public ActiveFarmer(int actId, String actName, String actType, String actAddr, String tel, Date actDate,
			Timestamp actTimeSta, Timestamp actTimeEnd, int numLim, String memberNo, int price, String actDescri,
			String imgName, Blob actImg, int actLock, ActSignUp actSignUp) {

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
	public Date getActDate() {
		return actDate;
	}

	public void setActDate(Date actDate) {
		this.actDate = actDate;
	}

	@Column(name = "actTimeSta")
	public Timestamp getActTimeSta() {
		return actTimeSta;
	}

	public void setActTimeSta(Timestamp actTimeSta) {
		this.actTimeSta = actTimeSta;
	}

	@Column(name = "actTimeEnd")
	public Timestamp getActTimeEnd() {
		return actTimeEnd;
	}

	public void setActTimeEnd(Timestamp actTimeEnd) {
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
	public Blob getActImg() {
		return actImg;
	}

	public void setActImg(Blob actImg) {
		this.actImg = actImg;
	}

	@Column(name = "actLock")
	public int getActLock() {
		return actLock;
	}

	public void setActLock(int actLock) {
		this.actLock = actLock;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "activeFarmer", cascade = CascadeType.ALL)
	public ActSignUp getActSignUp() {
		return actSignUp;
	}

	public void setActSignUp(ActSignUp actSignUp) {
		this.actSignUp = actSignUp;
	}

}
