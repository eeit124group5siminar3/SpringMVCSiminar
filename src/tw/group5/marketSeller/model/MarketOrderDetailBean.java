package tw.group5.marketSeller.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "market_order_detail")
@Component
public class MarketOrderDetailBean {
	private Integer detailId;
	private Integer oid;
	private Integer productId;
	private Integer quantity;
	private Integer totalPrice;
	private MarketOrderBean marketOrderBean;
	
	@Id @Column(name = "DETAIL_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getDetailId() {
		return detailId;
	}
	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}
	
	@Transient
	@Column(name = "OID")
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	
	
	@Column(name = "PRODUCTID")
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	@Column(name = "QUANTITY")
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	@Column(name = "TOTAL_PRICE")
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "OID" ,referencedColumnName = "OID")
	public MarketOrderBean getMarketOrderBean() {
		return marketOrderBean;
	}
	public void setMarketOrderBean(MarketOrderBean marketOrderBean) {
		this.marketOrderBean = marketOrderBean;
	}
	

	
}
