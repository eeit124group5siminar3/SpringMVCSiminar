package tw.group5.mall.model;

public class OrderItem {
	private String product;
	private int producterId;
	private String producterName;
	private int content;
	private String unit;
	private int qty = 0 ; 
	private int productId = 0 ;
	private double price = 0.0 ; 
	private double discount = 1.0 ;
	public OrderItem() {
		super();
	}
	public OrderItem(String product, int producterId,int content, String unit, Integer qty, Integer productId,
			Double price, Double discount,String producterName) {
		super();
		this.product = product;
		this.producterId = producterId;
		this.content = content;
		this.unit = unit;
		this.qty = qty;
		this.productId = productId;
		this.price = price;
		this.discount = discount;
		this.producterName=producterName;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getProducterId() {
		return producterId;
	}
	public void setProducterId(int producterId) {
		this.producterId = producterId;
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
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public String getProducterName() {
		return producterName;
	}
	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}
	
}
