//package tw.group5.mall.model;
//
//import java.io.Serializable;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//import org.springframework.stereotype.Component;
//@Component
//@Entity
//@Table(name = "productCategory")
//public class CategoryBean implements Serializable {
//
//	private static final long serialVersionUID = 1L;
//	private Integer id;
//	private String name;
//
//	public CategoryBean() {
//		super();
//	}
//
//	public CategoryBean(Integer id, String name) {
//		super();
//		this.id = id;
//		this.name = name;
//	}
//
//	@Id
//	@Column(name = "ID")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	public Integer getId() {
//		return id;
//	}
//
//	public void setId(Integer id) {
//		this.id = id;
//	}
//
//	@Column(name = "NAME")
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//}