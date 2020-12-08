package tw.group5.recipe.recipe_Bean;

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

import org.springframework.stereotype.Component;

@Entity
@Table(name="Msg_Blog")
@Component
public class Msg_Blog_Bean {
	private Integer id;
	private Integer mem_no;
	private Integer blog_id;
	private String content;	
	private String date;
	private Blog_Bean blog_Bean;
	
	@Id@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="msg_member_no")
	public Integer getMem_no() {
		return mem_no;
	}
	public void setMem_no(Integer mem_no) {
		this.mem_no = mem_no;
	}
	
	@Column(name="msg_content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name="msg_date", updatable = false)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Transient
	@Column(name="blog_id")
	public Integer getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(Integer blog_id) {
		this.blog_id = blog_id;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "blog_id")
	public Blog_Bean getBlog_Bean() {
		return blog_Bean;
	}
	public void setBlog_Bean(Blog_Bean blog_Bean) {
		this.blog_Bean = blog_Bean;
	}
	
	
}
