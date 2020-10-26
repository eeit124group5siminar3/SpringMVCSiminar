package marketSeller.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "market_Product_Total")
public class MarketProductTotalBean {
	private String productId;
	private String email;
	private String marketName;
	private String productName;
	private String productArea;
	private String productCatgory;
	private Integer price;
	private Integer report;
	private String unit;
	private String discount;
	private String putOut;
	private Integer quantity;
	private MarketProductImgBean marketProductImgBean;
	
	public MarketProductTotalBean(String productId, String productName, String productArea, String productCatgory,
			Integer price, String unit, String discount, Integer quantity, MarketProductImgBean marketProductImgBean) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productArea = productArea;
		this.productCatgory = productCatgory;
		this.price = price;
		this.unit = unit;
		this.discount = discount;
		this.quantity = quantity;
		this.marketProductImgBean = marketProductImgBean;
	}

	public MarketProductTotalBean() {
		
	}
	
	public MarketProductTotalBean(String productId,String productName,String productArea,Integer price,String unit,Integer quantity) {
		this.productId=productId;
		this.productName=productName;
		this.productArea=productArea;
		this.price=price;
		this.unit=unit;
		this.quantity=quantity;
		
	}
	

	
	public MarketProductTotalBean(String productId, String email, String marketName, String productName,
			String productArea, String productCatgory, Integer price, Integer report, String unit, String discount,
			String putOut, Integer quantity, MarketProductImgBean marketProductImgBean) {
		super();
		this.productId = productId;
		this.email = email;
		this.marketName = marketName;
		this.productName = productName;
		this.productArea = productArea;
		this.productCatgory = productCatgory;
		this.price = price;
		this.report = report;
		this.unit = unit;
		this.discount = discount;
		this.putOut = putOut;
		this.quantity = quantity;
		this.marketProductImgBean = marketProductImgBean;
	}

	@Id @Column(name = "PRODUCT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "MARKET_NAME")
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	
	@Column(name = "PRODUCT_NAME")
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Column(name = "PRODUCT_AREA")
	public String getProductArea() {
		return productArea;
	}
	public void setProductArea(String productArea) {
		this.productArea = productArea;
	}
	
	@Column(name = "PRODUCT_CATEGORY")
	public String getProductCatgory() {
		return productCatgory;
	}
	public void setProductCatgory(String productCatgory) {
		this.productCatgory = productCatgory;
	}
	
	@Column(name = "PRICE")
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	@Column(name = "REPORT")
	public Integer getReport() {
		return report;
	}
	public void setReport(Integer report) {
		this.report = report;
	}
	
	@Column(name = "UNIT")
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name = "DISCOUNT")
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	@Column(name = "PUT_OUT")
	public String getPutOut() {
		return putOut;
	}
	public void setPutOut(String putOut) {
		this.putOut = putOut;
	}
	
	@Column(name = "QUANTITY")
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	@OneToOne(fetch = FetchType.LAZY,mappedBy ="marketProductTotalBean", cascade = CascadeType.ALL)

	public MarketProductImgBean getMarketProductImgBean() {
		return marketProductImgBean;
	}
	public void setMarketProductImgBean(MarketProductImgBean marketProductImgBean) {
		this.marketProductImgBean = marketProductImgBean;
	}
	
	
}
