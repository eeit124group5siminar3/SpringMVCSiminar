package mall.productModel;

import java.io.Serializable;
import java.util.Date;

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
@Entity
@Table(name="orderDetails")
public class ProductOrderItemBean implements Serializable{
	private int itemId;
	private	int orderId;
	private int productId;
	private	int producterId;
	private	String description;
	private	int amount;
	private	double unitPrice;
	private	double discount;
	private	Date shippingDate;
	private	int status;
	private String producterName;
	private ProductOrderBean productOrderBean;
	@Transient
	public String getProducterName() {
		return producterName;
	}
	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}
	public ProductOrderItemBean() {
		super();
	}
	public ProductOrderItemBean(int orderId, int productId, int producterId, String description, int amount,
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
	public ProductOrderItemBean(int itemId, int orderId, int productId, int producterId, String description,
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
	@Id @Column(name="ITEMID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	@Transient
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	@Column(name="PRODUCTID")
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Column(name="PRODUCTERID")
	public int getProducterId() {
		return producterId;
	}
	public void setProducterId(int producterId) {
		this.producterId = producterId;
	}
	@Column(name="DESCRIPTION")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name="AMOUNT")
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Column(name="UNITPRICE")
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	@Column(name="DISCOUNT")
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	@Column(name="SHIPPINGDATE", insertable = false)
	public Date getShippingDate() {
		return shippingDate;
	}
	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}
	@Column(name="STATUS")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ORDERID")
	public ProductOrderBean getProductOrderBean() {
		return productOrderBean;
	}
	public void setProductOrderBean(ProductOrderBean productOrderBean) {
		this.productOrderBean = productOrderBean;
	}
}
