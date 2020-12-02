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

//註明為persistent class
@Entity
@Table(name="recipe")
@Component
//Spring宣告
//@Scope(value = "singleton")  預設
//value = singleton 每次使用getBean()時,取得相同ID的物件,
//會在ApplicationContext建立時產生,不希望自動產生 ,加上@Lazy(value = true)
//prototype 代表ApplicationContext建立後不會主動產生,每次getBean()時,建立新物件,不會主動destory
//request   代表request與bean結合,在同	request與同getBean(),取得相同id的物件
//session   與request相同
public class Recipe_Bean {
	private String rec_id;
	private String name;
	private String desc;
	private String cate;
	private String method;
	private String ingredients_A;
	private String ingredients_B;
	private String ingredients_C;
	private String ingredients_D;
	private String gram_A;
	private String gram_B;
	private Integer member_no;
	private String FileName;
	private Blob data;
	private MultipartFile multipartFile;
	private String date;
	private Integer views=0;
	
	public Recipe_Bean() {
	}

	@Id @Column(name="recipe_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getRec_id() {
		return rec_id;
	}
	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}
	
	@Column(name="recipe_name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	@Column(name="method")
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
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

	@Column(name="member_no")
	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	
	@Column(name="filename")
	@JsonIgnore
	public String getFileName() {
		return FileName;
	}

	public void setFileName(String FileName) {
		this.FileName = FileName;
	}

	@Column(name="data")
	public Blob getData() {
		return data;
	}

	public void setData(Blob data) {
		this.data = data;
	}

	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) throws SerialException, IOException, SQLException {
		this.multipartFile = multipartFile;
		if(multipartFile.getBytes().length>0) {
			SerialBlob sb=new SerialBlob(multipartFile.getBytes());
			String fileName=multipartFile.getOriginalFilename();
			setFileName(fileName);
			setData(sb);
		}
	}

	@Column(name="upload_date", updatable = false)
	@JsonIgnore
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	

	@Column(name="views")
	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}
}
