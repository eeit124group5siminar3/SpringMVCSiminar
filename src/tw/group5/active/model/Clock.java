package tw.group5.active.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "clock")
@Component("clock")
public class Clock implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer timeId;
	private String timeName;
	private Set<ActFarmer> actFarmer = new HashSet<>();

	@Id @Column(name="timeId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getTimeId() {
		return timeId;
	}

	public void setTimeId(Integer timeId) {
		this.timeId = timeId;
	}

	@Column(name="timeName")
	public String getTimeName() {
		return timeName;
	}

	public void setTimeName(String timeName) {
		this.timeName = timeName;
	}

	
//	public Set<ActFarmer> getActFarmer() {
//		return actFarmer;
//	}
//
//	public void setActFarmer(Set<ActFarmer> actFarmer) {
//		this.actFarmer = actFarmer;
//	}

}
