package recipe.recipe_bean;

import java.io.InputStream;
import java.sql.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="recipe")
public class Recipe_Bean {
	private String name;
	private String ingredients_A;
	private String ingredients_B;
	private String ingredients_C;
	private String ingredients_D;
	private String desc;
	private String cate;
	private String rec_id;
//	private Date up_date;
//	private String gram_A;
	private String method;
	public String FileName;
//	private InputStream data;
//	private Blob sb;
//	private FileInputStream fis;
	
	
	

	public Recipe_Bean(String name, String ingredients_A, String ingredients_B, 
			String ingredients_C,String ingredients_D, String desc, String cate
			,String method) {
		this.name = name;
		this.ingredients_A = ingredients_A;
		this.ingredients_B = ingredients_B;
		this.ingredients_C = ingredients_C;
		this.ingredients_D = ingredients_D;
		this.desc = desc;
		this.cate = cate;
//		this.rec_id = rec_id;
//		this.FileName=FileName;
//		this. data=data;
//		this. sb=sb;
		this.method=method;
//		this.gram_A=gram_A;
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
	
	
	public Recipe_Bean() {
	}
	
	@Id @Column(name="recipe_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
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
	
	@Column(name="CATEGORY")
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	
	@Column(name="METHOD")
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	
	
//	public String getGram_A() {
//		return gram_A;
//	}
//
//	public void setGram_A(String gram_A) {
//		this.gram_A = gram_A;
//	}
}
