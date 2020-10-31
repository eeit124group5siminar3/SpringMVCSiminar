package tw.group5.mall.model;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
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
@Table(name="orderForm")
public class ProductOrderBean implements Serializable{
	private int orderId;
	private int buyerId;
	private String buyerName;
	private String address;
	private String tel;
	private String bNo;
	private double total;
	private	Date orderDate;
	private Set<ProductOrderItemBean> items = new LinkedHashSet<>();
	public ProductOrderBean(int buyerId, String buyerName, String address, String tel, String bNo, double total,
			Date orderDate,Set<ProductOrderItemBean> items) {
		super();
		this.buyerId = buyerId;
		this.buyerName = buyerName;
		this.address = address;
		this.tel = tel;
		this.bNo = bNo;
		this.total = total;
		this.orderDate = orderDate;
		this.items=items;
	}
	public ProductOrderBean() {
		super();
	}
	public ProductOrderBean(int orderId, int buyerId, String buyerName, String address, String tel, String bNo,
			double total, Date orderDate,Set<ProductOrderItemBean> items) {
		super();
		this.orderId = orderId;
		this.buyerId = buyerId;
		this.buyerName = buyerName;
		this.address = address;
		this.tel = tel;
		this.bNo = bNo;
		this.total = total;
		this.orderDate = orderDate;
		
		this.items=items;
	}
	@Id @Column(name="ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	@Column(name="BUYERID")
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	@Column(name="BUYERNAME")
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name="TEL")
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Column(name="BNO")
	public String getBNo() {
		return bNo;
	}
	public void setBNo(String bNo) {
		this.bNo = bNo;
	}
	@Column(name="TOTAL")
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	@Column(name="ORDERDATE",updatable = false)
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productOrderBean", cascade = CascadeType.ALL)
	public Set<ProductOrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<ProductOrderItemBean> items) {
		this.items = items;
	}
	
}
