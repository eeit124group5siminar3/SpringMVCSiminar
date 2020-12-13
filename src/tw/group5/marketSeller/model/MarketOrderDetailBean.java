package tw.group5.marketSeller.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "market_order_detail")
@Component
public class MarketOrderDetailBean {
	private Integer detailId;
	private Integer oid;
	private Integer productId;
	private Integer quantity;
	private MarketOrderBean marketOrderBean;
	
	public Integer getDetailId() {
		return detailId;
	}
	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public MarketOrderBean getMarketOrderBean() {
		return marketOrderBean;
	}
	public void setMarketOrderBean(MarketOrderBean marketOrderBean) {
		this.marketOrderBean = marketOrderBean;
	}
	

	
	
}
