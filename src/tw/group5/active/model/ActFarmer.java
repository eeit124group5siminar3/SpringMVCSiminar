package tw.group5.active.model;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.ManyToAny;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "actFarmer")
@Component("actFarmer")
@DynamicInsert
@DynamicUpdate
public class ActFarmer implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer actId;
	private String actName;
	private String actType;
	private String actAddr;
	private String tel;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date actDateSta;
	private String actTimeSta;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date actDateEnd;
	private String actTimeEnd;
	private Integer numLim;
	private Integer sellerId;
	private Integer price;
	private String actDescri;
	private String imgName;
	@JsonIgnore
	private Blob actImg;
	private Integer actLock;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date signDateSta;
	private String signTimeSta;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date signDateEnd;
	private String signTimeEnd;
	private Integer actNum = 0;
	private String sigStat;
	private MultipartFile multipartFile;

	private Set<ActOrdNum> actOrdNum = new HashSet<ActOrdNum>(0);

//	private Clock clock;

	public ActFarmer() {
	}

	public ActFarmer(Integer actId, String actName, String actType, String actAddr, String tel, Date actDateSta,
			String actTimeSta, Date actDateEnd, String actTimeEnd, Integer numLim, Integer sellerId, Integer price,
			String actDescri, String imgName, Blob actImg, Integer actLock, Date signDateSta, String signTimeSta,
			Date signDateEnd, String signTimeEnd, Integer actNum, String sigStat, MultipartFile multipartFile,
			Set<ActOrdNum> actOrdNum) {
		super();
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
		this.multipartFile = multipartFile;
		this.actOrdNum = actOrdNum;
	}

	public ActFarmer(Integer actId, String actName, String actType, String actAddr, String tel, Date actDateSta,
			String actTimeSta, Date actDateEnd, String actTimeEnd, Integer numLim, Integer sellerId, Integer price,
			String actDescri, String imgName, Blob actImg, Date signDateSta, String signTimeSta, Date signDateEnd,
			String signTimeEnd, Integer actNum, String sigStat) {

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
		this.signDateSta = signDateSta;
		this.signTimeSta = signTimeSta;
		this.signDateEnd = signDateEnd;
		this.signTimeEnd = signTimeEnd;
		this.sigStat = sigStat;
	}

	@Id
	@Column(name = "actId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getActId() {
		return actId;
	}

	public void setActId(Integer actId) {
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

	@Column(name = "numLim")
	public Integer getNumLim() {
		return numLim;
	}

	public void setNumLim(Integer numLim) {
		this.numLim = numLim;
	}

	@Column(name = "sellerId")
	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
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

	@Transient
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

	@Transient
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

	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) throws SerialException, SQLException, IOException {
		this.multipartFile = multipartFile;

		if (multipartFile.getBytes().length > 0) {
			String imgName = multipartFile.getOriginalFilename();
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			setImgName(imgName);
			setActImg(sb);
		}
	}


	@OneToMany(fetch = FetchType.EAGER,mappedBy = "actFarmer")
//	@JoinColumn(name = "actId")
	public Set<ActOrdNum> getActOrdNum() {
		return actOrdNum;
	}
	
	public void setActOrdNum(Set<ActOrdNum> actOrdNum) {
		this.actOrdNum = actOrdNum;
	}
	

//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "timeName")
//	public Clock getClock() {
//		return clock;
//	}
//
//	public void setClock(Clock clock) {
//		this.clock = clock;
//	}

}
