package tw.group5.marketSeller.model;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "prototype") //每次都會創建一個新的Bean
public class MarketOrder {
	private String product;
	private Integer memberNo;
	private String producterName;
	private Integer content;
	private String unit;
	private Integer quantity = 0; //數量
	private Integer productId = 0;
	private Integer price = 0;
	private Integer sellerId =0;
	private Integer stock; //庫存
	

	
	public MarketOrder(String product, Integer memberNo, String producterName, Integer content, String unit,
			Integer quantity, Integer productId, Integer price,Integer sellerId ,Integer stock) {
		super();
		this.product = product;
		this.memberNo = memberNo;
		this.producterName = producterName;
		this.content = content;
		this.unit = unit;
		this.quantity = quantity;
		this.productId = productId;
		this.price = price;
		this.stock = stock;
		this.sellerId=sellerId;
	}
	
	public MarketOrder() {
		super();
	}
	
	
	
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public String getProducterName() {
		return producterName;
	}
	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}
	public Integer getContent() {
		return content;
	}
	public void setContent(Integer content) {
		this.content = content;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer integer) {
		this.price = integer;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}
	
	
}
