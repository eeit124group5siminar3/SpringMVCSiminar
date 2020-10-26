package mall.productModel;

import java.io.Serializable;
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

@Entity
@Table(name = "productCategory")
public class CategoryBean implements Serializable {

	private int id;
	private String name;
//	private Set<ProductBean> productBean = new HashSet<ProductBean>();

	public CategoryBean() {
		super();
	}

	public CategoryBean(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "product",cascade = CascadeType.ALL)
//	public Set<ProductBean> getProductBean() {
//		return productBean;
//	}
//
//	public void setProductBean(Set<ProductBean> productBean) {
//		this.productBean = productBean;
//	}

}
