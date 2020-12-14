package tw.group5.marketSeller.model;

import java.util.Date;
import java.util.HashSet;
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

import org.springframework.stereotype.Component;

@Entity
@Table(name = "market_order")
@Component
public class MarketOrderBean {
	private Integer oid;
	private String cellphone;	
	private Integer totalPrice;
	private String buyer;
	private Date buyTime;
	private String address;
    private Set<MarketOrderDetailBean> marketOrderDetailBean =
            new HashSet<MarketOrderDetailBean>(0);
	
	
	@Id @Column(name = "OID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	@Column(name = "CELLPHONE")
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	
	@Column(name = "TOTAL_PRICE")
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Column(name = "BUYER")
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	
	@Column(name = "BUY_TIME")
	public Date getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}
	
	@Column(name = "ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "marketOrderBean", cascade = CascadeType.ALL)
	public Set<MarketOrderDetailBean> getMarketOrderDetailBean() {
		return marketOrderDetailBean;
	}
	public void setMarketOrderDetailBean(Set<MarketOrderDetailBean> marketOrderDetailBean) {
		this.marketOrderDetailBean = marketOrderDetailBean;
	}
	

	
}