package tw.group5.mall.model;

import java.io.Serializable;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Component
@Entity
@Table(name = "product")
public class ProductImageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer productId;
	private Blob coverImage;
	private String fileName;
	
	public ProductImageBean() {
		super();
	}

	@Id
	@Column(name = "PRODUCTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@JsonIgnore
	@Column(name = "COVERIMAGE")
	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob blob) {
		this.coverImage = blob;
	}

	@Column(name = "FILENAME")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
