package tw.group5.active.model;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service("activeService")
public class ActiveService {
	
	private ActiveDAO activeDAO;
	
	public boolean insert(Active active) {
		return activeDAO.insert(active);
	}

}
