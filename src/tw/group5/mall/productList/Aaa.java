package tw.group5.mall.productList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Aaa {
	@Autowired 
	private SessionFactory sessionFactory;
	@RequestMapping(path="/Aaa")
	public String processA() {
		System.out.println(sessionFactory);
		return "CheckError";
	}
}
