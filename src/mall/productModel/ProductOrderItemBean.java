package mall.productModel;

import java.io.Serializable;
import java.util.Date;

public class ProductOrderItemBean implements Serializable{
	private int itemId;
	private	int orderId;
	private int productId;
	private	String producterId;
	private	String description;
	private	int amount;
	private	double unitPrice;
	private	double discount;
	private	Date shippingDate;
	private	int status;
	private String producterName;
	private ProductOrderBean productOrderBean;
	public String getProducterName() {
		return producterName;
	}
	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}
	public ProductOrderItemBean() {
		super();
	}
	public ProductOrderItemBean(int orderId, int productId, String producterId, String description, int amount,
			double unitPrice, double discount) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.producterId = producterId;
		this.description = description;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.discount = discount;
	}
	public ProductOrderItemBean(int itemId, int orderId, int productId, String producterId, String description,
			int amount, double unitPrice, double discount, Date shippingDate, int status) {
		super();
		this.itemId = itemId;
		this.orderId = orderId;
		this.productId = productId;
		this.producterId = producterId;
		this.description = description;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.discount = discount;
		this.shippingDate = shippingDate;
		this.status = status;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProducterId() {
		return producterId;
	}
	public void setProducterId(String producterId) {
		this.producterId = producterId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public Date getShippingDate() {
		return shippingDate;
	}
	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
