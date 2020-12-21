package tw.group5.recipe.recipe_Bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

//@Entity
//@Table(name="subscribe_author")
//@Component
public class Subscribe_Bean {
	private Integer id;
	private Integer mem_no;
	private Integer author_no;
	private DATE sub_date;

//	@Id
//	@Column(name="ID")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
//	@Column(name="MEMBER_NO")
	public Integer getMem_no() {
		return mem_no;
	}
	public void setMem_no(Integer mem_no) {
		this.mem_no = mem_no;
	}
	
//	@Column(name="AUTHOR_NO")
	public Integer getAuthor_no() {
		return author_no;
	}
	public void setAuthor_no(Integer author_no) {
		this.author_no = author_no;
	}
	
//	@Column(name="SUB_DATE")
	public DATE getSub_date() {
		return sub_date;
	}
	public void setSub_date(DATE date) {
		this.sub_date = date;
	}
}
