package marketSeller.model;

import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "market_Product_Img")
public class MarketProductImgBean {
	private String productId;
	private String description;
	private Blob productImg ;
	private MarketProductTotalBean marketProductTotalBean;
	
	@GenericGenerator(name ="generator", strategy = "foreign", parameters = @Parameter(name="property", value = "marketProductTotalBean"))
	@Id @Column(name = "PRODUCT_ID")
	@GeneratedValue(generator = "generator")
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name = "PRODUCT_IMG")
	public Blob getProductImg() {
		return productImg;
	}
	public void setProductImg(Blob productImg) {
		this.productImg = productImg;
	}
	
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public MarketProductTotalBean getMarketProductTotalBean() {
		return marketProductTotalBean;
	}
	public void setMarketProductTotalBean(MarketProductTotalBean marketProductTotalBean) {
		this.marketProductTotalBean = marketProductTotalBean;
	}
	
	
}
