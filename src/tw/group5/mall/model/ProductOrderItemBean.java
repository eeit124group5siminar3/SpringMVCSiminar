package tw.group5.mall.model;

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

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="orderDetails")
public class ProductOrderItemBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer itemId;
	private	Integer orderId;
	private Integer productId;
	private	Integer producterId;
	private	String description;
	private	Integer amount;
	private	Double unitPrice;
	private	Double discount;
	private	Date shippingDate;
	private	Integer status;
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
	public ProductOrderItemBean(Integer orderId, Integer productId, Integer producterId, String description, Integer amount,
			Double unitPrice, Double discount) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.producterId = producterId;
		this.description = description;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.discount = discount;
	}
	public ProductOrderItemBean(Integer itemId, Integer orderId, Integer productId, Integer producterId, String description,
			Integer amount, Double unitPrice, Double discount, Date shippingDate, Integer status) {
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
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	@Transient
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	@Column(name="PRODUCTID")
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	@Column(name="PRODUCTERID")
	public Integer getProducterId() {
		return producterId;
	}
	public void setProducterId(Integer producterId) {
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
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	@Column(name="UNITPRICE")
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	@Column(name="DISCOUNT")
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
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
