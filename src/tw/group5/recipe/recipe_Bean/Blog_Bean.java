package tw.group5.recipe.recipe_Bean;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
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
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="blog")
@Component
public class Blog_Bean {
	private Integer blog_id;
	private Integer mem_no;
	private String name;
	private Integer views=0;
	private String content;
	private String fileName;
	private Blob data;
	private MultipartFile multipartFile;
	private String date;
	private String update_date;
	private String title;
	private int status=1;
	private int counts;
	private String introduction;
	private String cate;
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
	@JsonIgnore
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Column(name="data")
	@JsonIgnore
	public Blob getData() {
		return data;
	}
	public void setData(Blob data) {
		this.data = data;
	}
	
	@Column(name = "update_date")
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) throws IOException, SerialException, SQLException {
		this.multipartFile=multipartFile;
		if(multipartFile.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile.getBytes());
			String filename=multipartFile.getOriginalFilename();
			setData(sb);
			setFileName(filename);
		}
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
	@JsonIgnore
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
	
	@Column(name="category")
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "blog_Bean",cascade = CascadeType.ALL)
	@JsonIgnore
	public Set<Msg_Blog_Bean> getMsg_Blog_Bean() {
		return msg_Blog_Bean;
	}
	public void setMsg_Blog_Bean(Set<Msg_Blog_Bean> msg_Blog_Bean) {
		this.msg_Blog_Bean = msg_Blog_Bean;
	}
	

}
