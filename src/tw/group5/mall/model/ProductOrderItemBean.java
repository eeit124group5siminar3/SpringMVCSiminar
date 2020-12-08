package tw.group5.mall.model;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
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

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
@Scope(value = "prototype")
@Entity
@Table(name = "orderDetails")
public class ProductOrderItemBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer itemId;
	private Integer orderId;
	private Integer productId;
	private Integer producterId;
	private String description;
	private Integer amount;
	private Integer unitPrice;
	private Double discount;
	private Date shippingDate;
	private Integer status = 0;
	private ProducterBean producterBean;
	private String producterName;
	private ProductOrderBean productOrderBean;

	public ProductOrderItemBean() {
		super();
	}

	public ProductOrderItemBean(Integer orderId, Integer productId, Integer producterId, String description,
			Integer amount, Integer unitPrice, Double discount) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.producterId = producterId;
		this.description = description;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.discount = discount;
	}

	public ProductOrderItemBean(Integer itemId, Integer orderId, Integer productId, Integer producterId,
			String description, Integer amount, Integer unitPrice, Double discount, Date shippingDate, Integer status) {
		super();
		this.itemId = itemId;
		this.orderId = orderId;
		this.productId = productId;
		this.producterId = producterId;
		this.description = description;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.discount = discount;
		this.shippingDate = shippingDate;
		this.status = status;
	}

	@Id
	@Column(name = "ITEMID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	@Transient
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name = "PRODUCTID")
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@Transient
//	@Column(name="PRODUCTERID")
	public Integer getProducterId() {
		return producterId;
	}

	public void setProducterId(Integer producterId) {
		this.producterId = producterId;
	}

	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "AMOUNT")
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "UNITPRICE")
	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Column(name = "DISCOUNT")
	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	@Column(name = "SHIPPINGDATE", insertable = false)
	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORDERID")
	public ProductOrderBean getProductOrderBean() {
		return productOrderBean;
	}

	public void setProductOrderBean(ProductOrderBean productOrderBean) {
		this.productOrderBean = productOrderBean;
	}

	@Transient
	public String getStatusWord() {
		return StatusClass.getStatus(status);
	}

	@Transient
	public String getStatusTag() {
		String statusTag = "";
		if (status == 0) {
			for (int i = -1; i <= 2; i++) {
				if (i == status) {
					statusTag += "<input type='radio' checked='checked' name='" + itemId + "' value='" + i + "'/>"
							+ StatusClass.getStatus(i);
				} else {
					statusTag += "<input type='radio' name='" + itemId + "' value='" + i
							+ "' onclick='orderManagement(event," + i + ")'/>" + StatusClass.getStatus(i);
				}
			}
		} else if (status == -1) {
			for (int i = -1; i <= 2; i++) {
				if (i == -1) {
					statusTag += "<input type='radio' checked='checked' name='" + itemId + "' value='" + i + "'/>"
							+ StatusClass.getStatus(i);
				} else {
					statusTag += "<input type='radio' disabled='disabled' name='" + itemId + "' value='" + i + "'/>"
							+ StatusClass.getStatus(i);
				}
			}
		} else if (status == -2) {
			statusTag = "<p>訂單已被取消</p>";
		} else if (status == 3) {
			statusTag = "<p>商品已送達</p>";
		} else {
			for (int i = -1; i <= 2; i++) {
				if (i == status) {
					statusTag += "<input type='radio' checked='checked' name='" + itemId + "' value='" + i + "'/>"
							+ StatusClass.getStatus(i);
				} else if (i > status) {
					statusTag += "<input type='radio' name='" + itemId + "' value='" + i
							+ "' onclick='orderManagement(event," + i + ")'/>" + StatusClass.getStatus(i);
				} else {
					statusTag += "<input type='radio' disabled='disabled' name='" + itemId + "' value='" + i + "'/>"
							+ StatusClass.getStatus(i);
				}
			}
		}
		return statusTag;
	}
	
	@Transient
	public String getStatusTagForUser() {
		String statusTagForUser="";
		if(status==2) {
			statusTagForUser="<button type='button' class='btn btn-primary' data-toggle='modal'" + 
					"data-target='#scoreOrder' data-whatever="+itemId+">已收到</button>";
		}else if (status==3) {
			statusTagForUser="<button type='button' class='btn btn-primary' disabled='disabled'>已收到</button>";
		}else if (status==0) {
			statusTagForUser="<button type='button' class='btn btn-primary' onclick='cancelOrder("+itemId+")'>取消訂單</button>";
		}else {
			statusTagForUser="<button type='button' class='btn btn-primary' disabled='disabled' onclick=''>取消訂單</button>";
		}
		return statusTagForUser;
	}
}
