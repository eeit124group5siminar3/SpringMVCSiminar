package tw.group5.mall.model;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

//新增、修改
@Component
@Entity
@Table(name = "product")
public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer productId;
	private String product;
	private Integer producterId;
	private Integer price;
	private Double discount = 1.0;
	private Blob coverImage;
	private String fileName;
	private Integer stock;
	private Date addedDate;
	private Integer shelfTime;
	private Integer content;
	private String unit;
	private String description;
	private Integer category;
	private Integer views = 0;
	private Integer sold = 0;
	private Integer status = 1;
	private Double score = 0.0;
	private Integer scorenum = 0;
	private ProducterBean producterBean;
	private String producterName;
//	private Date expiryDate;
	private Integer favorite = 0;
	private Date expiredDate;
//	private CategoryBean categoryBean;
	private MultipartFile multipartFile;
	private String priceS;
	private String stockS;
	private String shelfTimeS;
	private String contentS;
	private String discountS;
	private String discountErr;
	private List <String> errMsg=new ArrayList<String>();

	public ProductBean() {
		super();
	}

	@Id
	@Column(name = "PRODUCTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@Column(name = "PRODUCT")
	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {

		this.product = product.toUpperCase();
	}

	@Transient
//	@Column(name = "PRODUCTERID", updatable = false)
	public Integer getProducterId() {
		return producterId;
	}

	public void setProducterId(Integer producterId) {
		this.producterId = producterId;
	}

	@Column(name = "PRICE")
	public Integer getPrice() {
//		System.err.println(789);
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Transient
	public String getPriceS() {
		if (this.price!=null) {
			return price.toString();
		}else {
			return null;
		}
	}

	public void setPriceS(String priceS) {
		Integer price=null;
		try {
			price = Integer.valueOf(priceS);
		} catch (NumberFormatException e) {
			errMsg.add("價格");
			e.printStackTrace();
			price = this.price;
		}
		this.price = price;
		setPrice(price);
	}

	@Column(name = "DISCOUNT")
	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	
	@Transient
	public String getDiscountS() {
		if (this.discount!=null) {
			return discount.toString();
		}else {
			return null;
		}
	}

	public void setDiscountS(String discountS) {
		Double discount=null;
		try {
			discount = Double.valueOf(discountS);
			if (discount<=0||discount>1) {
				discountErr="折扣的值應該在0-1之間!";
			}
		} catch (NumberFormatException e) {
			errMsg.add("折扣");
			e.printStackTrace();
			discount = this.discount;
		}
		this.discount = discount;
		setDiscount(discount);
	}

	@JsonIgnore
	@Column(name = "COVERIMAGE")
	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob blob) {
		this.coverImage = blob;
	}

	@Column(name = "FILENAME")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "STOCK")
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	@Transient
	public String getStockS() {
		if (this.stock!=null) {
			return stock.toString();
		}else {
			return null;
		}
	}

	public void setStockS(String stockS) {
		Integer stock=null;
		try {
			stock = Integer.valueOf(stockS);
		} catch (NumberFormatException e) {
			errMsg.add("庫存");
			e.printStackTrace();
			stock = this.stock;
		}
		this.stock = stock;
		setStock(stock);
	}

	@Column(name = "ADDEDDATE", updatable = false)
	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	@Column(name = "SHELFTIME")
	public Integer getShelfTime() {
		return shelfTime;
	}

	public void setShelfTime(Integer shelfTime) {
		this.shelfTime = shelfTime;
	}
	
	@Transient
	public String getShelfTimeS() {
		if (this.shelfTime!=null) {
			return shelfTime.toString();
		}else {
			return null;
		}
	}

	public void setShelfTimeS(String shelfTimeS) {
		Integer shelfTime=null;
		try {
			shelfTime = Integer.valueOf(shelfTimeS);
		} catch (NumberFormatException e) {
			errMsg.add("保質期");
			e.printStackTrace();
			shelfTime = this.shelfTime;
		}
		this.shelfTime = shelfTime;
		setShelfTime(shelfTime);
	}

	@Column(name = "CONTENT")
	public Integer getContent() {
		return content;
	}

	public void setContent(Integer content) {
		this.content = content;
	}
	
	@Transient
	public String getContentS() {
		if (this.content!=null) {
			return content.toString();
		}else {
			return null;
		}
	}

	public void setContentS(String contentS) {
		Integer content=null;
		try {
			content = Integer.valueOf(contentS);
		} catch (NumberFormatException e) {
			errMsg.add("內含");
			e.printStackTrace();
			content = this.content;
		}
		this.content = content;
		setContent(content);
	}

	@Column(name = "UNIT")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

//	@Transient
	@Column(name = "CATEGORY")
	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	@Column(name = "VIEWS")
	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	@Column(name = "SOLD")
	public Integer getSold() {
		return sold;
	}

	public void setSold(Integer sold) {
		this.sold = sold;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "SCORE")
	public Double getScore() {
		return score;
	}

// 需要比scorenum先輸入
	public void setScore(Double score) {
		Double avg = (this.score * scorenum + score) / (scorenum + 1);
		this.score = avg;
	}

	@Column(name = "SCORENUM")
	public Integer getScorenum() {
		return scorenum;
	}

	public void setScorenum(Integer scorenum) {
		this.scorenum = scorenum;
	}

	@Transient
	public String getCategoryName() {
		return CategoryClass.getCategory(category);
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "producterId")
	public ProducterBean getProducterBean() {
		return producterBean;
	}

	public void setProducterBean(ProducterBean producterBean) {
		this.producterBean = producterBean;
	}

	@Transient
	public String getProducterName() {
		String producterName = producterBean.getMember_name();
		return producterName;
	}

	public void setProducterName(String producterName) {
		this.producterName = producterName;
	}

	@Transient
	public String getExpiredDateString() {
		String expiryDateString = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(this.expiredDate);
		calendar.add(Calendar.DATE, -3);
		java.util.Date expiredDate = calendar.getTime();
		if (new java.util.Date().after(expiredDate)) {
			expiryDateString = "<font style='color:red;'>" + this.expiredDate + "(即將到期)</font>";
		} else {
			expiryDateString = this.expiredDate.toString();
		}
		return expiryDateString;
	}

//	public void setExpiryDate(String expiryDate) {
//		System.err.println(123);
//		Calendar calendar=Calendar.getInstance();
//		System.err.println(456);
//		if(addedDate!=null) {
//			calendar.setTime(addedDate);
//			calendar.add(Calendar.DATE, shelfTime);
//		}else {
//			calendar.setTime(new java.util.Date());
//		}
//		Date date=new Date(calendar.getTime().getTime());
//		setExpiredDate(date);
//		System.err.println(789);
//	}

//	@JsonIgnore
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "category")
//	public CategoryBean getCategoryBean() {
//		return categoryBean;
//	}
//
//	public void setCategoryBean(CategoryBean categoryBean) {
//		this.categoryBean = categoryBean;
//	}
	@Transient
	public Integer getFavorite() {
		return favorite;
	}

	public void setFavorite(Integer favorite) {
		this.favorite = favorite;
	}

	@Column(name = "EXPIREDDATE")
	public Date getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}
	
	@Transient
	public List<String> getErrMsg() {
		return errMsg;
	}

	@Transient
	public String getDiscountErr() {
		return discountErr;
	}

	@JsonIgnore
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) throws SerialException, SQLException, IOException {
		this.multipartFile = multipartFile;
		if (multipartFile.getBytes().length > 0) {
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			String fileName = multipartFile.getOriginalFilename();
			setFileName(fileName);
			setCoverImage(sb);
		}
	}
}