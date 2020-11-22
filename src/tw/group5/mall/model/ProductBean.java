package tw.group5.mall.model;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
//新增、修改
@Component
@Entity
@Table(name = "product")
public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer productId;
	private String product;
	private Integer producterId;
	private Double price;
	private Double discount = 1.0;
	private Blob coverImage;
	private String fileName;
	private Integer stock;
	private Date addedDate;
	private Integer shelfTime;
	private Integer content;
	private String unit;
	private String description;
	private Integer category;
	private String producterName;
//	private CategoryBean categoryBean;
	private MultipartFile multipartFile;

	public ProductBean() {
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

	@Column(name = "PRODUCT")
	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	@Column(name = "PRODUCTERID", updatable = false)
	public Integer getProducterId() {
		return producterId;
	}

	public void setProducterId(Integer producterId) {
		this.producterId = producterId;
	}

	@Column(name = "PRICE")
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "DISCOUNT")
	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
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

	@Column(name = "STOCK")
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	@Column(name = "ADDEDDATE", updatable = false)
	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	@Column(name = "SHELFTIME")
	public Integer getShelfTime() {
		return shelfTime;
	}

	public void setShelfTime(Integer shelfTime) {
		this.shelfTime = shelfTime;
	}

	@Column(name = "CONTENT")
	public Integer getContent() {
		return content;
	}

	public void setContent(Integer content) {
		this.content = content;
	}

	@Column(name = "UNIT")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

//	@Transient
	@Column(name = "CATEGORY")
	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}
	
	@Transient
	public String getCategoryName() {
		return CategoryClass.getCategory(category);
	}

	@Transient
	public String getProducterName() {
		return producterName;
	}

	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}

//	@JsonIgnore
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "category")
//	public CategoryBean getCategoryBean() {
//		return categoryBean;
//	}
//
//	public void setCategoryBean(CategoryBean categoryBean) {
//		this.categoryBean = categoryBean;
//	}

	@JsonIgnore
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) throws SerialException, SQLException, IOException {
		this.multipartFile = multipartFile;
		if (multipartFile.getBytes().length > 0) {
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			String fileName = multipartFile.getOriginalFilename();
			setFileName(fileName);
			setCoverImage(sb);
		}
	}
}