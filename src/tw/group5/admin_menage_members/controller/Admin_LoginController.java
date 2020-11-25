package tw.group5.admin_menage_members.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.group5.admin.model.Employee;
import tw.group5.admin.model.Employee_Service;

@Controller
@SessionAttributes(names = "admin_login_ok")
public class Admin_LoginController {

	@Autowired
	private Employee_Service meployee_service;
	
	
	@RequestMapping(path = "/adminIndex.controller", method = RequestMethod.GET)
	public String processIndex() {
		return "admin_index";
	}	
	
	@RequestMapping(path = "/adminBackstage.controller", method = RequestMethod.GET)
	public String processGoBackstage() {
		return "Admin/Admin_Backstage";
	}
	
	@RequestMapping(path = "/adminCheckLogin.controller",method = RequestMethod.POST)
	@ResponseBody
	public boolean processAdminCheckLogin(HttpServletRequest request, HttpServletResponse response,Model m) {
		
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRemember = null;
		
		String rm = request.getParameter("remember");
		String account = request.getParameter("account").trim();
		String password = request.getParameter("password").trim();
		
		boolean login = meployee_service.login_check(account, password);
		
		Employee login_bean = meployee_service.login_bean(account);
		
		if (login) {
			if (rm != null) {
				cookieUser = new Cookie("user", account);
				cookieUser.setMaxAge(60 * 60 * 24 * 7);
				cookieUser.setPath(request.getContextPath());
				
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(60 * 60 * 24 * 7);
				cookiePassword.setPath(request.getContextPath());

				cookieRemember = new Cookie("rm", "true");
				cookieRemember.setMaxAge(7 * 24 * 60 * 60);
				cookieRemember.setPath(request.getContextPath());
			} else {
				cookieUser = new Cookie("user", account);
				cookieUser.setMaxAge(0);
				cookieUser.setPath(request.getContextPath());
				
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(0);
				cookiePassword.setPath(request.getContextPath());

				cookieRemember = new Cookie("rm", "true");
				cookieRemember.setMaxAge(0);
				cookieRemember.setPath(request.getContextPath());
			}
			
			response.addCookie(cookieUser);
			response.addCookie(cookiePassword);			
			response.addCookie(cookieRemember);
			
			m.addAttribute("admin_login_ok", login_bean);

			return true;
		}
		 return false;
	}	
	
	//登出
	@RequestMapping(path = "/adminRemoveSession.controller", method = RequestMethod.GET)
	public String processRemoveSession(HttpSession session,SessionStatus sessionStatus) {

		session.removeAttribute("admin_login_ok");
		session.invalidate();
		sessionStatus.setComplete();

		return "redirect:adminIndex.controller";
	}
	
	
}
