package marketSeller.model;

import java.sql.Blob;

public class MarketProductImgBean {
	private String productId;
	private String description;
	private Blob productImg ;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Blob getProductImg() {
		return productImg;
	}
	public void setProductImg(Blob productImg) {
		this.productImg = productImg;
	}
	
}
