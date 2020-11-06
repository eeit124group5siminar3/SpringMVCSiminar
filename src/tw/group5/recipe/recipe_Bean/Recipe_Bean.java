package tw.group5.recipe.recipe_Bean;

import java.io.InputStream;
import java.sql.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

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
	private int gram_A;
	public String FileName;
	private int member_no;
	
	
//	private Date up_date;
//	private InputStream data;
//	private Blob sb;
//	private FileInputStream fis;
	
	public Recipe_Bean() {
	}

	public Recipe_Bean(String name, String ingredients_A, String ingredients_B, 
			String ingredients_C,String ingredients_D, String desc, String cate
			,String method,int gram_A) {
		this.name = name;
		this.ingredients_A = ingredients_A;
		this.ingredients_B = ingredients_B;
		this.ingredients_C = ingredients_C;
		this.ingredients_D = ingredients_D;
		this.desc = desc;
		this.cate = cate;
		this.method=method;
		this.gram_A=gram_A;
		
		
//		this.rec_id = rec_id;
//		this.FileName=FileName;
//		this. data=data;
//		this. sb=sb;
//		this.fis=fis;
	}

//	public FileInputStream getFis() {
//		return fis;
//	}
//	public void setFis(FileInputStream fis) {
//		this.fis = fis;
//	}
//	public Blob getSb() {
//		return sb;
//	}
//	public void setSb(Blob sb) {
//		this.sb = sb;
//	}
	
	

	
	@Id @Column(name="recipe_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getRec_id() {
		return rec_id;
	}
	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}
	
//	@Column(name="data")
//	public InputStream getData() {
//		return data;
//	}
//	public void setData(InputStream data) {
//		this.data = data;
//	}
	
	
	@Column(name="filename")
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}

//	public Date getUp_date() {
//		return up_date;
//	}
//	public void setUp_date(Date up_date) {
//		this.up_date = up_date;
//	}
	
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
	public int getGram_A() {
		return gram_A;
	}

	public void setGram_A(int gram_A) {
		this.gram_A = gram_A;
	}

	@Column(name="member_no")
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
}
