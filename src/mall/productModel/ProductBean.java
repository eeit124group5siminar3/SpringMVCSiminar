package mall.productModel;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

public class ProductBean implements Serializable {
	private int productId;
	private String product;
	private String producterId;
	private double price;
	private double discount;
	private Blob coverImage;
	private String fileName;
	private int stock;
	private Date addedDate;
	private int shelfTime;
	private int content;
	private String unit;
	private String description;
	private int category;
	private String producterName;

	public String getProducterName() {
		return producterName;
	}

	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}

	public ProductBean() {
		super();
	}

	public ProductBean(String product, String producterId, double price, Blob coverImage, String fileName, int stock,
			Date addedDate, int shelfTime, int content, String unit, String description, int category) {
		super();
		this.product = product;
		this.producterId = producterId;
		this.price = price;
		this.coverImage = coverImage;
		this.fileName = fileName;
		this.stock = stock;
		this.addedDate = addedDate;
		this.shelfTime = shelfTime;
		this.content = content;
		this.unit = unit;
		this.description = description;
		this.category = category;
	}

	public ProductBean(int productId, String product, String producterId, double price, double discount,
			Blob coverImage, String fileName, int stock, Date addedDate, int shelfTime, int content, String unit,
			String description, int category) {
		super();
		this.productId = productId;
		this.product = product;
		this.producterId = producterId;
		this.price = price;
		this.discount = discount;
		this.coverImage = coverImage;
		this.fileName = fileName;
		this.stock = stock;
		this.addedDate = addedDate;
		this.shelfTime = shelfTime;
		this.content = content;
		this.unit = unit;
		this.description = description;
		this.category = category;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getProducterId() {
		return producterId;
	}

	public void setProducterId(String producterId) {
		this.producterId = producterId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob blob) {
		this.coverImage = blob;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public int getShelfTime() {
		return shelfTime;
	}

	public void setShelfTime(int shelfTime) {
		this.shelfTime = shelfTime;
	}

	public int getContent() {
		return content;
	}

	public void setContent(int content) {
		this.content = content;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
