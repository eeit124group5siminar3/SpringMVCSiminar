package tw.group5.mall.model;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "prototype")
public class OrderItem {
	private String product;
	private Integer producterId;
	private String producterName;
	private Integer content;
	private String unit;
	private Integer qty = 0;
	private Integer productId = 0;
	private Integer price = 0;
	private Double discount = 1.0;
	private Integer stock;

	public OrderItem() {
		super();
	}

	public OrderItem(String product, Integer producterId, Integer content, String unit, Integer qty, Integer productId,
			Integer price, Double discount, String producterName) {
		super();
		this.product = product;
		this.producterId = producterId;
		this.content = content;
		this.unit = unit;
		this.qty = qty;
		this.productId = productId;
		this.price = price;
		this.discount = discount;
		this.producterName = producterName;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public Integer getProducterId() {
		return producterId;
	}

	public void setProducterId(Integer producterId) {
		this.producterId = producterId;
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

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
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

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getProducterName() {
		return producterName;
	}

	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}
	
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}


}
