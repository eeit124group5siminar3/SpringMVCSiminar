package tw.group5.mall.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="Member_SignUp")
public class ProducterBean {
	private Integer member_no;
	private String member_name;
	
	@Id
	@Column(name="MEMBER_NO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getMember_no() {
		return member_no;
	}
	
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	
	@Column(name="MEMBER_NAME")
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}
