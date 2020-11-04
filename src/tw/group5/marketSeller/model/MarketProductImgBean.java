package tw.group5.marketSeller.model;


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
import org.springframework.stereotype.Component;

@Entity
@Table(name = "market_Product_Img")
@Component("market_Product_Img")
public class MarketProductImgBean {
	private int productId;
	private String description;
	private String img_name;
	private byte[] productImg ;
	private MarketProductTotalBean marketProductTotalBean;


	public  MarketProductImgBean() {
		
	}

	@GenericGenerator(name ="generator", strategy = "foreign", parameters = @Parameter(name="property", value = "marketProductTotalBean"))
	@Id @Column(name = "PRODUCT_ID")
	@GeneratedValue(generator = "generator")
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
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
	public byte[] getProductImg() {
		return productImg;
	}
	public void setProductImg(byte[] productImg) {
		this.productImg = productImg;
	}
	
	@Column(name = "IMG_NAME")
	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
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
