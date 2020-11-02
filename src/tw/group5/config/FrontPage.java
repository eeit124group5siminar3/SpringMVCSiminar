package tw.group5.config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontPage {
	@RequestMapping(path = "/FrontPage",method = RequestMethod.GET)
public String entryPage() {
	return "index.jsp";
}
}
