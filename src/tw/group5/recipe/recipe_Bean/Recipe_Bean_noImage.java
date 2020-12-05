package tw.group5.recipe.recipe_Bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

//註明為persistent class
@Entity
@Table(name="recipe")
@Component
public class Recipe_Bean_noImage {
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
	private String date;
	private Integer views=0;
	
	public Recipe_Bean_noImage() {
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

	@Column(name="upload_date", updatable = false)
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
