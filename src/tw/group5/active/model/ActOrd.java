package tw.group5.active.model;

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "actOrd")
@Component("actOrd")
@DynamicInsert
@DynamicUpdate
public class ActOrd {

	private Integer actOrdId;
	private Integer memNo;
	private String memName;
	private String memTel;
	private String memEmail;
	private Integer actId;
	private Integer ordActNum;
	private Double totalPrice;
	private Integer ordState;
	private Timestamp ordTime;
	private Integer payWay;
	private String actOrdRemarks;

	private ActFarmer actFarmer;

	public ActOrd() {
	}



	public ActOrd(Integer actOrdId, Integer memNo, String memName, String memTel, String memEmail, Integer actId,
			Integer ordActNum, Double totalPrice, Integer ordState, Timestamp ordTime, Integer payWay,
			String actOrdRemarks, ActFarmer actFarmer) {
		super();
		this.actOrdId = actOrdId;
		this.memNo = memNo;
		this.memName = memName;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.actId = actId;
		this.ordActNum = ordActNum;
		this.totalPrice = totalPrice;
		this.ordState = ordState;
		this.ordTime = ordTime;
		this.payWay = payWay;
		this.actOrdRemarks = actOrdRemarks;
		this.actFarmer = actFarmer;
	}


	@Id
	@Column(name = "actOrdId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getActOrdId() {
		return actOrdId;
	}

	public void setActOrdId(Integer actOrdId) {
		this.actOrdId = actOrdId;
	}

	@Column(name = "memNo")
	public Integer getMemNo() {
		return memNo;
	}

	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}

	@Column(name = "memName")
	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	@Column(name = "memTel")
	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	@Column(name = "memEmail")
	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	@Transient
//	@Column(name = "actId")
	public Integer getActId() {
		return actId;
	}

	public void setActId(Integer actId) {
		this.actId = actId;
	}

//	public Integer getOrdActId() {
//		return actId;
//	}
//
//	public void setOrdActId(Integer ordActId) {
//		this.actId = ordActId;
//	}

	@Column(name = "ordActNum")
	public Integer getOrdActNum() {
		return ordActNum;
	}

	public void setOrdActNum(Integer ordActNum) {
		this.ordActNum = ordActNum;
	}

	@Column(name = "totalPrice")
	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "ordState")
	public Integer getOrdState() {
		return ordState;
	}

	public void setOrdState(Integer ordState) {
		this.ordState = ordState;
	}

	@Column(name = "ordTime")
	public Timestamp getOrdTime() {
		return ordTime;
	}

	public void setOrdTime(Timestamp ordTime) {
		this.ordTime = ordTime;
	}
	
	
	@Column(name = "payWay")	
	public Integer getPayWay() {
		return payWay;
	}

	public void setPayWay(Integer payWay) {
		this.payWay = payWay;
	}

	
	@Column(name = "actOrdRemarks")
	public String getActOrdRemarks() {
		return actOrdRemarks;
	}


	public void setActOrdRemarks(String actOrdRemarks) {
		this.actOrdRemarks = actOrdRemarks;
	}


	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "actId",referencedColumnName = "actId")
	public ActFarmer getActFarmer() {
		return actFarmer;
	}

	public void setActFarmer(ActFarmer actFarmer) {
		this.actFarmer = actFarmer;
	}
	
	
	//取得定單狀態中文
	@Transient
	public String getActOrdStatusWord() {
		return ActOrdStatusClass.getActOrdStatus(ordState);
	}
	

	//取得付款方式狀態中文
	@Transient
	public String getActPayWayStatusWord() {
		return ActOrdStatusClass.getActPayWay(payWay);
	}

}
