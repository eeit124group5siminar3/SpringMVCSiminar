package tw.group5.active.model;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import javassist.Loader.Simple;
import jdk.jfr.internal.PrivateAccess;

@Entity
@Table(name = "actOrd")
@Component("actOrd")
@DynamicInsert
@DynamicUpdate
public class ActOrd {

	private String actOrdId;
	private Integer memNo;
	private String memName;
	private String memTel;
	private String memEmail;
	private Integer actId;
	private Integer ordActNum;
	private Double totalPrice;
	private Integer ordState;

	private ActFarmer actFarmer;

	public ActOrd() {
	}

	public ActOrd(String actOrdId, Integer memNo, String memName, String memTel, String memEmail, Integer actId,
			Integer ordActNum, Double totalPrice, Integer ordState, ActFarmer actFarmer) {
		this.actOrdId = actOrdId;
		this.memNo = memNo;
		this.memName = memName;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.actId = actId;
		this.ordActNum = ordActNum;
		this.totalPrice = totalPrice;
		this.ordState = ordState;
		this.actFarmer = actFarmer;
	}

	@Id
	@Column(name = "actOrdId")
	public String getActOrdId() {	
		return actOrdId;
	}

	public void setActOrdId(String actOrdId) {
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
	public Integer getOrdActId() {
		return actId;
	}

	public void setOrdActId(Integer ordActId) {
		this.actId = ordActId;
	}

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

	@ManyToOne (fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="actId")
	public ActFarmer getActFarmer() {
		return actFarmer;
	}

	public void setActFarmer(ActFarmer actFarmer) {
		this.actFarmer = actFarmer;
	}
	
	

}
