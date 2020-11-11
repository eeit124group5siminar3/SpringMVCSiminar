package tw.group5.marketSeller.model;


import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "market_Product_Img")
@Component
//("market_Product_Img")
public class MarketProductImgBean {
	private int productId;
	private String description;
	private String img_name;
	private byte[] productImg ;
	private MarketProductTotalBean marketProductTotalBean;
	private MultipartFile multipartFile;
    
	
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile)throws SerialException, SQLException, IOException {
		this.multipartFile = multipartFile;
		
		if (multipartFile.getBytes().length>0) {
			String img = multipartFile.getOriginalFilename();
			setImg_name(img);
			setProductImg(multipartFile.getBytes());
		}
	}

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
	public void setProductImg(byte[] b) {
		this.productImg = b;
	}
	
	@Column(name = "IMG_NAME")
	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	
	
	@OneToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name="PRODUCT_ID",referencedColumnName = "PRODUCT_ID")
	@PrimaryKeyJoinColumn
	public MarketProductTotalBean getMarketProductTotalBean() {
		return marketProductTotalBean;
	}
	public void setMarketProductTotalBean(MarketProductTotalBean marketProductTotalBean) {
		this.marketProductTotalBean = marketProductTotalBean;
	}
	
	
}
