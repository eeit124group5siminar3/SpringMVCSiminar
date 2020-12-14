package tw.group5.recipe.recipe_Bean;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "member_detail")
@Component
public class Member_Detail {
	private Integer mem_no;
	private String name;
	private String fileName;
	private Blob data;
	private MultipartFile multipartFile;
	private String introduction;

	@Id
	@Column(name = "member_no")
	public Integer getMem_no() {
		return mem_no;
	}

	public void setMem_no(Integer mem_no) {
		this.mem_no = mem_no;
	}

	@Column(name = "member_name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "filename")
	@JsonIgnore
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "data")
	@JsonIgnore
	public Blob getData() {
		return data;
	}

	public void setData(Blob data) {
		this.data = data;
	}

	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) throws IOException, SerialException, SQLException {
		this.multipartFile = multipartFile;
		if (multipartFile.getBytes().length > 0) {
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			String filename = multipartFile.getOriginalFilename();
			setData(sb);
			setFileName(filename);
		}
	}


	@Column(name = "introduction")
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

}
