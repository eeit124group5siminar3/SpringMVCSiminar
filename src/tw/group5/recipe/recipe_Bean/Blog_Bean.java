package tw.group5.recipe.recipe_Bean;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity; 
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="blog")
@Component
public class Blog_Bean {
	private Integer blog_id;
	private Integer mem_no;
	private String name;
	private Integer views=0;
	private String content;
	private String FileName;
	private Blob data;
	private MultipartFile multipartFile;
	private String date;
	private String title;
	private int status=1;
	private int counts;
	private String introduction;
	private Set<Msg_Blog_Bean> msg_Blog_Bean=
			new HashSet<Msg_Blog_Bean>(0);
	
	
	@Id@Column(name="blog_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(Integer blog_id) {
		this.blog_id = blog_id;
	}
	
	@Column(name="member_no")
	public Integer getMem_no() {
		return mem_no;
	}
	public void setMem_no(Integer mem_no) {
		this.mem_no = mem_no;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Column(name="views")
	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}
	
	@Column(name="content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name="filename")
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	
	@Column(name="data")
	public Blob getData() {
		return data;
	}
	public void setData(Blob data) {
		this.data = data;
	}
	
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	
	@Column(name="post_date", updatable = false)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Column(name="status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	@Transient
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	
	@Column(name="introduction")
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "blog_Bean",cascade = CascadeType.ALL)
	public Set<Msg_Blog_Bean> getMsg_Blog_Bean() {
		return msg_Blog_Bean;
	}
	public void setMsg_Blog_Bean(Set<Msg_Blog_Bean> msg_Blog_Bean) {
		this.msg_Blog_Bean = msg_Blog_Bean;
	}
	

}
