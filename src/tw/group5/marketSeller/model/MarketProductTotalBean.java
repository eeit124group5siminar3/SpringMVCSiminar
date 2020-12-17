 package tw.group5.marketSeller.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;




@Entity
@Table(name = "market_Product_Total")
@Component
//("market_Product_Total")
public class MarketProductTotalBean {
	private int productId;
	private String productName;
	private String productArea;
	private String productCatgory;
	private Integer price;
	private Integer report;
	private String unit;
	private String discount;
	private Integer putOut;
	private Integer quantity;
	private Integer memberNo;
	private String openDayString;
	private Date openDay;
	private String openDayTime;
	private Date closeDay;
	private String closeDayTime;
	private long days;
	private MarketMallBean marketMallBean;
	private MarketProductImgBean marketProductImgBean;
	private MarketPutOutBean marketPutOutBean;//設計單向
	private MarketOrderDetailBean marketOrderDetailBean;
    
	
	public MarketProductTotalBean(int productId, String productName, String productArea, String productCatgory,
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
	
	public MarketProductTotalBean(String productName,String productArea,Integer price,String unit,Integer quantity) {
		
		this.productName=productName;
		this.productArea=productArea;
		this.price=price;
		this.unit=unit;
		this.quantity=quantity;
		
	}
	

	
	public MarketProductTotalBean(int productId, String productName,
			String productArea, String productCatgory, Integer price, Integer report, String unit, String discount,
			Integer  putOut, Integer quantity, MarketProductImgBean marketProductImgBean) {
		super();
		this.productId = productId;
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
	
	
	
//
//	public long getDays() {
//		java.util.Date date = new java.util.Date();
//		long days = 
//		return days;
//	}

	public void setDays(long days) {
		this.days = days;
		
	}

	@Id @Column(name = "PRODUCT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
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
	@Transient
	public Integer  getPutOut() {
		return putOut;
	}
	public void setPutOut(Integer  putOut) {
		this.putOut = putOut;
	}
	
	@Column(name = "QUANTITY")
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	@Transient
	@Column(name = "MEMBER_NO")
	public Integer getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	
	
	@Column(name = "CLOSE_DAY")
	public Date getCloseDay() {
		return closeDay;
	}

	public void setCloseDay(Date closeDay) {
		this.closeDay = closeDay;
	}
	@Transient
	public String getOpenDayString() {
		return openDayString;
	}
	
	public void setOpenDayString(String openDayString) {
		if(openDayString!=null&&openDayString.length()!=0) {
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String dayString=dateFormat.format(openDayString);
			Date openDay= Date.valueOf(dayString);
			setOpenDay(openDay);
		}
	}
	
	@Column(name = "OPEN_DAY")
	public Date getOpenDay() {
		return openDay;
	}

	public void setOpenDay(Date openDay) {
		this.openDay = openDay;
	}
	
	@Column(name = "OPEN_DAY_TIME")
	public String getOpenDayTime() {
		return openDayTime;
	}

	public void setOpenDayTime(String openDayTime) {
		this.openDayTime = openDayTime;
	}

	@Column(name = "CLOSE_DAY_TIME")
	public String getCloseDayTime() {
		return closeDayTime;
	}

	public void setCloseDayTime(String closeDayTime) {
		this.closeDayTime = closeDayTime;
	}

	@OneToOne(fetch = FetchType.LAZY,mappedBy ="marketProductTotalBean", cascade = CascadeType.ALL)
	public MarketProductImgBean getMarketProductImgBean() {
		return marketProductImgBean;
	}
	public void setMarketProductImgBean(MarketProductImgBean marketProductImgBean) {
		this.marketProductImgBean = marketProductImgBean;
	}
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PUT_OUT")
	public MarketPutOutBean getMarketPutOutBean() {
		return marketPutOutBean;
	}
	
	public void setMarketPutOutBean(MarketPutOutBean marketPutOutBean) {
		this.marketPutOutBean = marketPutOutBean;
	}
    
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MEMBER_NO")
	public MarketMallBean getMarketMallBean() {
		return marketMallBean;
	}

	public void setMarketMallBean(MarketMallBean marketMallBean) {
		this.marketMallBean = marketMallBean;
	}

	@OneToOne(fetch = FetchType.LAZY,mappedBy ="marketProductTotalBean", cascade = CascadeType.ALL)
	public MarketOrderDetailBean getMarketOrderDetailBean() {
		return marketOrderDetailBean;
	}

	public void setMarketOrderDetailBean(MarketOrderDetailBean marketOrderDetailBean) {
		this.marketOrderDetailBean = marketOrderDetailBean;
	}

	


}
