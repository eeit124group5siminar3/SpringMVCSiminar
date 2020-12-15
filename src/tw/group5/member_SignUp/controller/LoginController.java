package tw.group5.member_SignUp.controller;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


import tw.group5.member_SignUp.model.Member_Service;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.util.CaptchaUtil;



@Controller
@SessionAttributes(names =  "login_ok")
public class LoginController {

	
	@Autowired
	private Member_Service member_Service;
	
	//一鍵登錄包Bean
	@RequestMapping(path = "/oneButton.controller", method = RequestMethod.POST)
	@ResponseBody
	public boolean OneButton(@RequestParam(name = "member_email") String member_email,Model m) {

		Member_SignUp login_bean = member_Service.login_bean(member_email);
		m.addAttribute("login_ok", login_bean);

		return true;
	}	
	
	
	@RequestMapping(path = "/index.controller", method = RequestMethod.GET)
	public String processIndex() {
		return "index";
	}	
	
	
	@RequestMapping(path = "/login.controller", method = RequestMethod.GET)
	public String processLogin() {
		return "Member_SignUp/Member_Login";
	}	
	
	//生成登入驗證碼
		 @RequestMapping("createCode")
		 public void createCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
			 //通知瀏覽器不要快取
			 response.setHeader("Expires","-1");//控制快取的失效日期
			 response.setHeader("Cache-Control","no-cache");//必須先與伺服器確認返回的響應是否被更改，然後才能使用該響應來滿足後續對同一個網址的請求
			 response.setHeader("Pragma","-1");
			 CaptchaUtil util=CaptchaUtil.Instance();
			 // 將驗證碼輸入到session中，用來驗證  
			 String code=util.getString();
			 request.getSession().setAttribute("code",code);
			// 輸出到web頁面  
			 ImageIO.write(util.getImage(), "jpg", response.getOutputStream());
		 }
	
	
	//登陸驗證
	@RequestMapping(path = "/checkLogin.controller",method = RequestMethod.POST)
	@ResponseBody
	public String[] processCheckLogin(HttpServletRequest request, HttpServletResponse response,Model m) {
		
		String[] check = new String[4];
		
		HttpSession session=request.getSession();
		String codeSession=(String)session.getAttribute("code");

		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRemember = null;
		
		String rm = request.getParameter("remember");
		boolean parseBoolean = Boolean.parseBoolean(rm);
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String code = request.getParameter("code").trim();
		
		Member_SignUp login_bean=null;
		String member_lock_acc=null;
		
		boolean login = member_Service.login_check(email, password);
		if(login) {
		login_bean = member_Service.login_bean(email);
		member_lock_acc = login_bean.getMember_lock_acc();
		}
		if (!codeSession.equalsIgnoreCase(code)) {
			check[1] = "1";
			return check ;
		}
		
		if (!login) {
			check[0] = "0";
			return check ;
		}
		if (member_lock_acc.equals("1") && codeSession.equalsIgnoreCase(code)) {
			check[3] = "3";
			return check ;
		}
		
		if (login && codeSession.equalsIgnoreCase(code)) {
			if (parseBoolean) {
				check[2] = "2";
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
				check[2] = "2";
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
		}
		 return check;
	}	
	
	//登出
	@RequestMapping(path = "/removeSession.controller", method = RequestMethod.GET)
	public String processRemoveSession(HttpSession session,SessionStatus sessionStatus) {

		session.removeAttribute("login_ok");
		session.invalidate();
		sessionStatus.setComplete();

		return "redirect:index.controller";
	}
	
	
	
	
	
	
	
	
	
}
