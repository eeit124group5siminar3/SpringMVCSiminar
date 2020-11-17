package tw.group5.active.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.active.model.ActFarmerService;

@Controller
@SessionAttributes(names = {"MaintainPageNo", "login_ok"})
public class ActFarmerController {
	
	@Autowired
	private ActFarmerService actFarmerService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpServletResponse response;
	
	@Autowired
	ServletContext ctx;
	
	
//	public String actFarPreInsert(Model model) {
//		
//	}
}
