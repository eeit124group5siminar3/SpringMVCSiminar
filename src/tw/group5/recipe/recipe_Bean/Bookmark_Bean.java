package tw.group5.recipe.recipe_Bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.group5.recipe.DAO.Recipe_DAO_spring;

@Entity
@Table(name="bookmark")
@Component
public class Bookmark_Bean {
	private String id;
	private Integer member_no;
	private String rec_id;
	private boolean value;
	
	@Autowired @JsonIgnore
	private Recipe_DAO_spring rDAO;
	
	@Id @Column(name="id")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Column(name="member_no")
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	
	@Column(name="recipe_id")
	public String getRec_id() {
		return rec_id;
	}
	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}
	
//	@Transient
//	public boolean getValue() {
//		return value;
//	}
//	public void setValue(boolean value) {
//		this.value = rDAO.bookmarkExist(rec_id,mem_no);
//	}
	
	

	
	
}
