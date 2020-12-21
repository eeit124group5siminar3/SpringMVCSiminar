package tw.group5.config;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class FrontPage {
	
	@RequestMapping(path = "/",method = RequestMethod.GET)
public String entryPage(Model m) {
		
	return "index.jsp";
}
}
