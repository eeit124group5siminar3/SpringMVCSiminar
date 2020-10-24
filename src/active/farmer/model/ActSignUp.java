package active.farmer.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name = "actSignUp")
public class ActSignUp {
	private int actId;
	private Date SignStaDate;
	private Timestamp SignStaTime;
	private Date SignEndDate;
	private Timestamp SignEndTime;
	private int actNum;
	private String sigStat;
	private ActiveFarmer activeFarmer;

	public ActSignUp() {

	}

	public ActSignUp(int actId, Date signStaDate, Timestamp signStaTime, Date signEndDate, Timestamp signEndTime,
			int actNum, String sigStat, ActiveFarmer activeFarmer) {
		
		this.actId = actId;
		SignStaDate = signStaDate;
		SignStaTime = signStaTime;
		SignEndDate = signEndDate;
		SignEndTime = signEndTime;
		this.actNum = actNum;
		this.sigStat = sigStat;
		this.activeFarmer = activeFarmer;
	}

	@GenericGenerator(name = "generator",strategy = "foreign",parameters = @Parameter(name="property",value = "activeFarmer"))
	@Id @GeneratedValue(generator = "generator")
	@Column(name = "actId")
	public int getActId() {
		return actId;
	}

	public void setActId(int actId) {
		this.actId = actId;
	}

	@Column(name = "signStaDate")
	public Date getSignStaDate() {
		return SignStaDate;
	}

	public void setSignStaDate(Date signStaDate) {
		SignStaDate = signStaDate;
	}

	@Column(name = "signStaTime")
	public Timestamp getSignStaTime() {
		return SignStaTime;
	}

	public void setSignStaTime(Timestamp signStaTime) {
		SignStaTime = signStaTime;
	}

	@Column(name = "signEndDate")
	public Date getSignEndDate() {
		return SignEndDate;
	}

	public void setSignEndDate(Date signEndDate) {
		SignEndDate = signEndDate;
	}

	@Column(name = "signEndTime")
	public Timestamp getSignEndTime() {
		return SignEndTime;
	}

	public void setSignEndTime(Timestamp signEndTime) {
		SignEndTime = signEndTime;
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

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public ActiveFarmer getActiveFarmer() {
		return activeFarmer;
	}

	public void setActiveFarmer(ActiveFarmer activeFarmer) {
		this.activeFarmer = activeFarmer;
	}

}
