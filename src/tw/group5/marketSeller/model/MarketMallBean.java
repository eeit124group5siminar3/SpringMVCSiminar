package tw.group5.marketSeller.model;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "market_Seller_Mall")
@Component
public class MarketMallBean {
	
	private Integer memberNo;
	private String mallName;
	private Blob mallImg;
	private String imgName;
	private String  address;
	private String mallDescription;
	private Integer mallStatus;
	private String pickupTime;
	private MultipartFile multipartFile;
    private Set<MarketProductTotalBean> marketProductTotalBean =
            new HashSet<MarketProductTotalBean>(0);
    
	@Transient
	public MultipartFile getMultipartFile() {
		
		return multipartFile;
	}
    
	public void setMultipartFile(MultipartFile multipartFile)throws SerialException, SQLException, IOException {
		this.multipartFile = multipartFile;
		
		if (multipartFile.getBytes().length>0) {
			String img = multipartFile.getOriginalFilename();
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			setImgName(img);
			setMallImg(sb);
			
		}
	}
	public MarketMallBean() {
		
	}

	@Id @Column(name = "MEMBER_NO")
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	
	@Column(name = "MALL_NAME")
	public String getMallName() {
		return mallName;
	}
	public void setMallName(String mallName) {
		this.mallName = mallName;
	}
	
	@Column(name = "MALL_IMG")
	public Blob getMallImg() {
		return mallImg;
	}
	public void setMallImg(Blob mallImg) {
		this.mallImg = mallImg;
	}
	@Column(name = "ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "MALL_DESCRIPTION")
	public String getMallDescription() {
		return mallDescription;
	}
	public void setMallDescription(String mallDescription) {
		this.mallDescription = mallDescription;
	}
	
	@Column(name = "IMG_NAME")
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	@Column(name = "PICKUP_TIME")
	public String getPickupTime() {
		return pickupTime;
	}

	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}

	@Column(name = "MALL_STATUS")
	public Integer getMallStatus() {
		return mallStatus;
	}

	public void setMallStatus(Integer mallStatus) {
		this.mallStatus = mallStatus;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy = "marketMallBean", cascade = CascadeType.ALL)
	public Set<MarketProductTotalBean> getMarketProductTotalBean() {
		return marketProductTotalBean;
	}
	public void setMarketProductTotalBean(Set<MarketProductTotalBean> marketProductTotalBean) {
		this.marketProductTotalBean = marketProductTotalBean;
	}

}
