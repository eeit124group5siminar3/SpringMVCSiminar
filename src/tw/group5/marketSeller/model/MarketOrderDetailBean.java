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
	private Integer sellerId;
	private MarketOrderBean marketOrderBean;
	private MarketProductTotalBean marketProductTotalBean;
	private MarketMallBean marketMallBean;
	
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
	
	@Transient
	@Column(name = "PRODUCT_ID")
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
	
	@Transient
	@Column(name = "SELLERID")
	public Integer getSellerId() {
		return sellerId;
	}
	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "OID" ,referencedColumnName = "OID")
	public MarketOrderBean getMarketOrderBean() {
		return marketOrderBean;
	}
	public void setMarketOrderBean(MarketOrderBean marketOrderBean) {
		this.marketOrderBean = marketOrderBean;
	}
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PRODUCT_ID" ,referencedColumnName = "PRODUCT_ID")
	public MarketProductTotalBean getMarketProductTotalBean() {
		return marketProductTotalBean;
	}
	public void setMarketProductTotalBean(MarketProductTotalBean marketProductTotalBean) {
		this.marketProductTotalBean = marketProductTotalBean;
	}
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "SELLERID" ,referencedColumnName = "MEMBER_NO")
	public MarketMallBean getMarketMallBean() {
		return marketMallBean;
	}
	public void setMarketMallBean(MarketMallBean marketMallBean) {
		this.marketMallBean = marketMallBean;
	}
	
    
	
}
