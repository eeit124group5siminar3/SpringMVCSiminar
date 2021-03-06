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
import javax.persistence.Transient;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Component
@Scope(value = "prototype")
@Entity
@Table(name="orderForm")
public class ProductOrderBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer orderId;
	private Integer buyerId;
	private String buyerName;
	private String address;
	private String tel;
	private String bNo;
	private Integer total;
	private	Date orderDate;
	private Integer shippingTime;
	private Set<ProductOrderItemBean> items = new LinkedHashSet<>();
	public ProductOrderBean() {
		super();
	}
	@Id @Column(name="ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	@Column(name="BUYERID")
	public Integer getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(Integer buyerId) {
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
	public String getbNo() {
		return bNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	
	@Column(name="TOTAL")
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	@Column(name="ORDERDATE",updatable = false)
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	@Column(name="SHIPPINGTIME")
	public Integer getShippingTime() {
		return shippingTime;
	}
	public void setShippingTime(Integer shippingTime) {
		this.shippingTime = shippingTime;
	}
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "productOrderBean", cascade = CascadeType.ALL)
	public Set<ProductOrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<ProductOrderItemBean> items) {
		this.items = items;
	}
	
	@Transient
	public String getShippingTimeWord() {
		return ShippingTimeClass.getShippingTime(shippingTime);
	}
	
}

//	public ProductOrderBean(Integer orderId, Integer buyerId, String buyerName, String address, String tel, String bNo,
//			Double total, Date orderDate,Set<ProductOrderItemBean> items) {
//		super();
//		this.orderId = orderId;
//		this.buyerId = buyerId;
//		this.buyerName = buyerName;
//		this.address = address;
//		this.tel = tel;
//		this.bNo = bNo;
//		this.total = total;
//		this.orderDate = orderDate;
//		
//		this.items=items;
//	}
//	public ProductOrderBean(Integer buyerId, String buyerName, String address, String tel, String bNo, Double total,
//			Date orderDate,Set<ProductOrderItemBean> items) {
//		super();
//		this.buyerId = buyerId;
//		this.buyerName = buyerName;
//		this.address = address;
//		this.tel = tel;
//		this.bNo = bNo;
//		this.total = total;
//		this.orderDate = orderDate;
//		this.items=items;
//	}