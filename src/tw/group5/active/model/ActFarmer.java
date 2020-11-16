package tw.group5.active.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "actFarmer")
@Component("actFarmer")
public class ActFarmer implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String actId;
	private String actName;
	private String actType;
	private String actAddr;
	private String tel;
	private Date actDateSta;
	private String actTimeSta;
	private Date actDateEnd;
	private String actTimeEnd;
	private Integer numLim;
	private String sellerId;
	private Integer price;
	private String actDescri;
	private String imgName;
	private Blob actImg;
	private Integer actLock;
	private Date signDateSta;
	private String signTimeSta;
	private Date signDateEnd;
	private String signTimeEnd;
	private Integer actNum;
	private String sigStat;
	
		
	public ActFarmer() {
	}

	public ActFarmer(String actId, String actName, String actType, String actAddr, String tel, Date actDateSta,
			String actTimeSta, Date actDateEnd, String actTimeEnd, Integer numLim, String sellerId, Integer price,
			String actDescri, String imgName, Blob actImg, Integer actLock, Date signDateSta, String signTimeSta,
			Date signDateEnd, String signTimeEnd, Integer actNum, String sigStat) {
		
		this.actId = actId;
		this.actName = actName;
		this.actType = actType;
		this.actAddr = actAddr;
		this.tel = tel;
		this.actDateSta = actDateSta;
		this.actTimeSta = actTimeSta;
		this.actDateEnd = actDateEnd;
		this.actTimeEnd = actTimeEnd;
		this.numLim = numLim;
		this.sellerId = sellerId;
		this.price = price;
		this.actDescri = actDescri;
		this.imgName = imgName;
		this.actImg = actImg;
		this.actLock = actLock;
		this.signDateSta = signDateSta;
		this.signTimeSta = signTimeSta;
		this.signDateEnd = signDateEnd;
		this.signTimeEnd = signTimeEnd;
		this.actNum = actNum;
		this.sigStat = sigStat;
	}

	@Id
	@Column(name = "actId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getActId() {
		return actId;
	}

	public void setActId(String actId) {
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

	@Column(name = "actDateSta")
	public Date getActDateSta() {
		return actDateSta;
	}

	public void setActDateSta(Date actDateSta) {
		this.actDateSta = actDateSta;
	}

	@Column(name = "actTimeSta")
	public String getActTimeSta() {
		return actTimeSta;
	}

	public void setActTimeSta(String actTimeSta) {
		this.actTimeSta = actTimeSta;
	}

	@Column(name = "actDateEnd")
	public Date getActDateEnd() {
		return actDateEnd;
	}

	public void setActDateEnd(Date actDateEnd) {
		this.actDateEnd = actDateEnd;
	}

	@Column(name = "actTimeEnd")
	public String getActTimeEnd() {
		return actTimeEnd;
	}

	public void setActTimeEnd(String actTimeEnd) {
		this.actTimeEnd = actTimeEnd;
	}

	@Column(name = "getNumLim")
	public Integer getNumLim() {
		return numLim;
	}

	public void setNumLim(Integer numLim) {
		this.numLim = numLim;
	}

	@Column(name = "sellerId")
	public String getMemberNo() {
		return sellerId;
	}

	public void setMemberNo(String memberNo) {
		this.sellerId = sellerId;
	}

	@Column(name = "price")
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
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
	public Integer getActLock() {
		return actLock;
	}

	public void setActLock(Integer actLock) {
		this.actLock = actLock;
	}

	@Column(name = "signDateSta")
	public Date getSignDateSta() {
		return signDateSta;
	}

	public void setSignDateSta(Date signDateSta) {
		this.signDateSta = signDateSta;
	}

	@Column(name = "signTimeSta")
	public String getSignTimeSta() {
		return signTimeSta;
	}

	public void setSignTimeSta(String signTimeSta) {
		this.signTimeSta = signTimeSta;
	}

	@Column(name = "signDateEnd")
	public Date getSignDateEnd() {
		return signDateEnd;
	}

	public void setSignDateEnd(Date signDateEnd) {
		this.signDateEnd = signDateEnd;
	}

	@Column(name = "signTimeEnd")
	public String getSignTimeEnd() {
		return signTimeEnd;
	}

	public void setSignTimeEnd(String signTimeEnd) {
		this.signTimeEnd = signTimeEnd;
	}

	@Column(name = "actNum")
	public Integer getActNum() {
		return actNum;
	}

	public void setActNum(Integer actNum) {
		this.actNum = actNum;
	}

	@Column(name = "sigStat")
	public String getSigStat() {
		return sigStat;
	}

	public void setSigStat(String sigStat) {
		this.sigStat = sigStat;
	}
	
	
	
	
	
	
	

}
