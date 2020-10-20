package marketSeller;

import java.io.File;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;

import javax.websocket.Decoder.BinaryStream;

public class MarketSellerBean {
	
	public MarketSellerBean() {
		
	}
	
	private String email;
	private String market_name;
	private String product_id;
	private String product_name;
	private String product_area; //商品出產地
	private String product_category; //商品類別
	private Integer price;
	private Integer report;
	private Blob product_img;
	private String file_name;
	private String description;  //描述
	
	public MarketSellerBean(String product_name, String product_area, Integer price, Blob product_img,String file_name,String description) {
		super();
		this.product_name = product_name;
		this.product_area = product_area;
		this.price = price;
		this.product_img = product_img;
		this.file_name=file_name;
		this.description = description;
	}
	
	public MarketSellerBean(String product_id,String product_name, String product_area, Integer price, Blob product_img,String file_name,String description) {
		super();
		this.product_id=product_id;
		this.product_name = product_name;
		this.product_area = product_area;
		this.price = price;
		this.product_img = product_img;
		this.file_name=file_name;
		this.description = description;
	}
	//test
	public MarketSellerBean(String product_name, String product_area, Integer price,String description) {
		super();
		this.product_name = product_name;
		this.product_area = product_area;
		this.price = price;
		this.description = description;
	}
	//圖
//	public MarketSellerBean(String product_name, String product_area, Integer price, Blob product_img,String file_name,String description) {
//		super();
//		this.product_name = product_name;
//		this.product_area = product_area;
//		this.price = price;
//		this.product_img = product_img;
//		this.file_name=file_name;
//		this.description = description;
//	}





	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMarket_name() {
		return market_name;
	}
	public void setMarket_name(String market_name) {
		this.market_name = market_name;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_area() {
		return product_area;
	}
	public void setProduct_area(String product_area) {
		this.product_area = product_area;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getReport() {
		return report;
	}
	public void setReport(Integer report) {
		this.report = report;
	}
	public Blob getProduct_img() {
		return product_img;
	}
	public void setProduct_img(Blob product_img) {
		this.product_img = product_img;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


}
	