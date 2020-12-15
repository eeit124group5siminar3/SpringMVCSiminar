package tw.group5.recipe.recipe_Bean;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="recipe")
@Component
public class Recipe_Bean {
	private Integer rec_id;
	private Integer member_no;
	private String mem_name;
	private String name;
	private String desc;
	private String cate;
	private String method_A;
	private String method_B;
	private String method_C;
	private String method_D;
	private String method_E;
	private String ingredients_A;
	private String ingredients_B;
	private String ingredients_C;
	private String ingredients_D;
	private String gram_A;
	private String gram_B;
	private String gram_C;
	private String gram_D;
	private String fileName_A;
	private String fileName_B;
	private String fileName_C;
	private String fileName_D;
	private String fileName_E;
	private Blob data_A;
	private Blob data_B;
	private Blob data_C;
	private Blob data_D;
	private Blob data_E;
	private MultipartFile multipartFile_A;
	private MultipartFile multipartFile_B;
	private MultipartFile multipartFile_C;
	private MultipartFile multipartFile_D;
	private MultipartFile multipartFile_E;
	private String date;
	private String update_date;
	private Integer views=0;
	
	public Recipe_Bean() {
	}

	@Id @Column(name="recipe_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getRec_id() {
		return rec_id;
	}
	public void setRec_id(Integer rec_id) {
		this.rec_id = rec_id;
	}
	
	@Column(name="recipe_name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Transient
	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	

	@Column(name = "method_A")
	public String getMethod_A() {
		return method_A;
	}

	public void setMethod_A(String method_A) {
		this.method_A = method_A;
	}
	
	@Column(name = "method_B")
	public String getMethod_B() {
		return method_B;
	}

	public void setMethod_B(String method_B) {
		this.method_B = method_B;
	}

	@Column(name = "method_C")
	public String getMethod_C() {
		return method_C;
	}

	public void setMethod_C(String method_C) {
		this.method_C = method_C;
	}

	@Column(name = "method_D")
	public String getMethod_D() {
		return method_D;
	}

	public void setMethod_D(String method_D) {
		this.method_D = method_D;
	}

	@Column(name = "method_E")
	public String getMethod_E() {
		return method_E;
	}

	public void setMethod_E(String method_E) {
		this.method_E = method_E;
	}

	@Column(name="ingredients_A")
	public String getIngredients_A() {
		return ingredients_A;
	}
	public void setIngredients_A(String ingredients_A) {
		this.ingredients_A = ingredients_A;
	}
	
	@Column(name="ingredients_B")
	public String getIngredients_B() {
		return ingredients_B;
	}
	public void setIngredients_B(String ingredients_B) {
		this.ingredients_B = ingredients_B;
	}
	
	@Column(name="ingredients_C")
	public String getIngredients_C() {
		return ingredients_C;
	}
	public void setIngredients_C(String ingredients_C) {
		this.ingredients_C = ingredients_C;
	}
	
	@Column(name="ingredients_D")
	public String getIngredients_D() {
		return ingredients_D;
	}
	public void setIngredients_D(String ingredients_D) {
		this.ingredients_D = ingredients_D;
	}
	
	@Column(name="recipe_desc")
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Column(name="category")
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	
	@Column(name="gram_A")
	public String getGram_A() {
		return gram_A;
	}

	public void setGram_A(String gram_A) {
		this.gram_A = gram_A;
	}
	
	@Column(name="gram_B")
	public String getGram_B() {
		return gram_B;
	}

	public void setGram_B(String gram_B) {
		this.gram_B = gram_B;
	}

	public String getGram_C() {
		return gram_C;
	}

	public void setGram_C(String gram_C) {
		this.gram_C = gram_C;
	}

	public String getGram_D() {
		return gram_D;
	}

	public void setGram_D(String gram_D) {
		this.gram_D = gram_D;
	}

	@Column(name="member_no")
	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}


	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile_A() {
		return multipartFile_A;
	}

	public void setMultipartFile_A(MultipartFile multipartFile_A) throws SerialException, IOException, SQLException {
		this.multipartFile_A = multipartFile_A;
		if(multipartFile_A.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile_A.getBytes());
			String fileName=multipartFile_A.getOriginalFilename();
			setFileName_A(fileName);
			setData_A(sb);
		}
	}

	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile_B() {
		return multipartFile_B;
	}

	public void setMultipartFile_B(MultipartFile multipartFile_B) throws SerialException, IOException, SQLException {
		this.multipartFile_B = multipartFile_B;
		if(multipartFile_B.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile_B.getBytes());
			String fileName=multipartFile_B.getOriginalFilename();
			setFileName_B(fileName);
			setData_B(sb);
		}
	}

	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile_C() {
		return multipartFile_C;
	}

	public void setMultipartFile_C(MultipartFile multipartFile_C) throws SerialException, IOException, SQLException {
		this.multipartFile_C = multipartFile_C;
		if(multipartFile_C.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile_C.getBytes());
			String fileName=multipartFile_C.getOriginalFilename();
			setFileName_C(fileName);
			setData_C(sb);
		}
	}

	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile_D() {
		return multipartFile_D;
	}

	public void setMultipartFile_D(MultipartFile multipartFile_D) throws SerialException, IOException, SQLException {
		this.multipartFile_D = multipartFile_D;
		if(multipartFile_D.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile_D.getBytes());
			String fileName=multipartFile_D.getOriginalFilename();
			setFileName_D(fileName);
			setData_D(sb);
		}
	}
	
	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile_E() {
		return multipartFile_E;
	}

	public void setMultipartFile_E(MultipartFile multipartFile_E) throws SerialException, IOException, SQLException {
		this.multipartFile_E = multipartFile_E;
		if(multipartFile_E.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile_E.getBytes());
			String fileName=multipartFile_E.getOriginalFilename();
			setFileName_E(fileName);
			setData_E(sb);
		}
	}

	@Column(name="upload_date", updatable = false)
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Column(name="update_date")
	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	@Column(name="views")
	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	@Column(name="fileName_A")
	@JsonIgnore
	public String getFileName_A() {
		return fileName_A;
	}

	public void setFileName_A(String fileName_A) {
		this.fileName_A = fileName_A;
	}

	@Column(name="fileName_B")
	@JsonIgnore
	public String getFileName_B() {
		return fileName_B;
	}

	public void setFileName_B(String fileName_B) {
		this.fileName_B = fileName_B;
	}

	@Column(name="fileName_C")
	@JsonIgnore
	public String getFileName_C() {
		return fileName_C;
	}

	public void setFileName_C(String fileName_C) {
		this.fileName_C = fileName_C;
	}

	@Column(name="fileName_D")
	@JsonIgnore
	public String getFileName_D() {
		return fileName_D;
	}

	public void setFileName_D(String fileName_D) {
		this.fileName_D = fileName_D;
	}
	
	@Column(name="fileName_E")
	@JsonIgnore
	public String getFileName_E() {
		return fileName_E;
	}

	public void setFileName_E(String fileName_E) {
		this.fileName_E = fileName_E;
	}

	@Column(name = "data_A")
	@JsonIgnore
	public Blob getData_A() {
		return data_A;
	}

	public void setData_A(Blob data_A) {
		this.data_A = data_A;
	}

	@Column(name = "data_B")
	@JsonIgnore
	public Blob getData_B() {
		return data_B;
	}

	public void setData_B(Blob data_B) {
		this.data_B = data_B;
	}

	@Column(name = "data_C")
	@JsonIgnore
	public Blob getData_C() {
		return data_C;
	}

	public void setData_C(Blob data_C) {
		this.data_C = data_C;
	}

	@Column(name = "data_D")
	@JsonIgnore
	public Blob getData_D() {
		return data_D;
	}

	public void setData_D(Blob data_D) {
		this.data_D = data_D;
	}

	@Column(name = "data_E")
	@JsonIgnore
	public Blob getData_E() {
		return data_E;
	}

	public void setData_E(Blob data_E) {
		this.data_E = data_E;
	}

	
	
}
