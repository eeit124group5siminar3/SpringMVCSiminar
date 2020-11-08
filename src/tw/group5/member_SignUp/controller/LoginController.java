package tw.group5.member_SignUp.controller;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;



@Controller
@SessionAttributes(names = "login_ok")
public class LoginController {

	
	@Autowired
	private Member_Service member_Service;
	
	@RequestMapping(path = "/login.controller", method = RequestMethod.GET)
	public String processLogin() {
		return "Member_SignUp/Member_Login";
	}
	
	
	//登陸驗證
	@RequestMapping(path = "/checkLogin.controller",method = RequestMethod.POST)
	public String processCheckLogin(HttpServletRequest request, HttpServletResponse response,Model m) {
		
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRemember = null;
		
		String rm = request.getParameter("remember");
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		
		boolean login = member_Service.login_check(email, password);
		Member_SignUp login_bean = member_Service.login_bean(email);
		
		if (login) {
			if (rm != null) {
				cookieUser = new Cookie("user", email);
				cookieUser.setMaxAge(60 * 60 * 24 * 7);
				cookieUser.setPath(request.getContextPath());
				
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(60 * 60 * 24 * 7);
				cookiePassword.setPath(request.getContextPath());

				cookieRemember = new Cookie("rm", "true");
				cookieRemember.setMaxAge(7 * 24 * 60 * 60);
				cookieRemember.setPath(request.getContextPath());
			} else {
				cookieUser = new Cookie("user", email);
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
			
			m.addAttribute("login_ok", login_bean);

			return "Member_SignUp/Member_Login_OK";
		}
		return "Member_SignUp/Member_Login_Alert";
	}
	
	//登出
	@RequestMapping(path = "/removeSession.controller", method = RequestMethod.GET)
	public String processRemoveSession(HttpSession session,SessionStatus sessionStatus) {

		session.removeAttribute("login_ok");
		session.invalidate();
		sessionStatus.setComplete();

		return "index";
	}
	
	
	
	
	
	
	
	
	
}
