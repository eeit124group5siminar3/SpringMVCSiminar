package tw.group5.marketSeller.model;

import java.sql.Blob;
import java.sql.Clob;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;


@Entity
@Table(name = "market_Seller_Mall")
@Component
public class MarketMallBean {
	
	private Integer memberNo;
	private Blob mall_img;
	private String  address;
	private Clob mallDescription;
    private Set<MarketProductTotalBean> marketProductTotalBean =
            new HashSet<MarketProductTotalBean>(0);
	
    

	@Id @Column(name = "MEMBER_NO")
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	
	@Column(name = "MALL_IMG")
	public Blob getMall_img() {
		return mall_img;
	}
	public void setMall_img(Blob mall_img) {
		this.mall_img = mall_img;
	}
	
	@Column(name = "ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "MALL_DESCRIPTION")
	public Clob getMallDescription() {
		return mallDescription;
	}
	public void setMallDescription(Clob mallDescription) {
		this.mallDescription = mallDescription;
	}
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "marketMallBean", cascade = CascadeType.ALL)
	public Set<MarketProductTotalBean> getMarketProductTotalBean() {
		return marketProductTotalBean;
	}
	public void setMarketProductTotalBean(Set<MarketProductTotalBean> marketProductTotalBean) {
		this.marketProductTotalBean = marketProductTotalBean;
	}
	

}
