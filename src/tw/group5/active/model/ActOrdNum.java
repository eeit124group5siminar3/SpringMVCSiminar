package tw.group5.active.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "actOrd")
@Component
public class ActOrdNum {

	private String actOrdId;
	private Integer actId;
	private Integer ordActNum;

	private ActFarmer actFarmer;

	@Id
	@Column(name = "actOrdId")
	public String getActOrdId() {
		return actOrdId;
	}

	public void setActOrdId(String actOrdId) {
		this.actOrdId = actOrdId;
	}

	@Transient
	public Integer getActId() {
		return actId;
	}

	public void setActId(Integer actId) {
		this.actId = actId;
	}

	@Column(name = "ordActNum")
	public Integer getOrdActNum() {
		return ordActNum;
	}

	public void setOrdActNum(Integer ordActNum) {
		this.ordActNum = ordActNum;
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
