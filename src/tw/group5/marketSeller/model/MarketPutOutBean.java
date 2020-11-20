package tw.group5.marketSeller.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Market_Up_Down")
@Component
public class MarketPutOutBean {
	private Integer putOut;
	private String status;
	
//    private Set<MarketProductTotalBean> marketProductTotalBean =
//    		                            new HashSet<MarketProductTotalBean>(0);
    

	public MarketPutOutBean() {
		
	}
	
	@Id @Column(name = "PUT_OUT")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getPutOut() {
		return putOut;
	}
	public void setPutOut(Integer putOut) {
		
		this.putOut = putOut;
	}
	
	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "marketPutOutBean",cascade = CascadeType.ALL)
//	public Set<MarketProductTotalBean> getMarketProductTotalBean() {
//		return marketProductTotalBean;
//	}
//	public void setMarketProductTotalBean(Set<MarketProductTotalBean> marketProductTotalBean) {
//		this.marketProductTotalBean = marketProductTotalBean;
//	}


}
