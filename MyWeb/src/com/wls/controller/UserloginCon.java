package com.wls.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wls.entity.JiGou;
import com.wls.entity.User;
import com.wls.service.UserloginService;
import com.wls.util.ExceptionHandlerController;
import com.wls.util.VerifyCodeUtils;

@Controller
@RequestMapping("/userlogin.do")
public class UserloginCon extends ExceptionHandlerController{
	
	@Autowired
	private UserloginService userloginSer;
	
	/**
	 * 获得验证码
	 */
	@RequestMapping(params = "method=VerificationCode")
	public void service(HttpServletRequest request, HttpServletResponse response){
		//(第一种)
		//VerificationCode Code = new VerificationCode();
		//Code.service(request, response);
		//(第二种)
		VerifyCodeUtils verifycodeutils = new VerifyCodeUtils();
		try {
			verifycodeutils.ser(request, response);
		} catch (IOException e) {
			//System.out.println("----------------------------获取验证码时出现异常------------------------");
			e.printStackTrace();
		}
	}
	
	/**
	 * 用户登录验证
	 */
	@RequestMapping(params="method=login")
	public String login(User user, String code,String page, String remberme,HttpServletRequest request,HttpServletResponse response,String type){
		if(!"1".equals(type)){
			return "/login";
		}else{
			String validateCode = (String) request.getSession().getAttribute("validateCode");
			code = validateCode;
			//System.out.println("-------------------"+remberme);
			if (code !=null && code.toUpperCase().equals(validateCode)) {
				if (user != null) {
					User user1 = userloginSer.login(user);
					if (user1.getUser_name() !=null && !"".equals(user1.getUser_name()) 
							&& user1.getUser_passw() != null && !"".equals(user1.getUser_passw())) {
						if("1".equals(remberme)){
							//System.out.println(remberme);
							UserCookie(response, user1.getUser_name(), user1.getUser_passw());
						}
						//System.out.println("用户【"+user1+"】登录成功");
						request.getSession().setAttribute("user", user1);
						return "/index";
					}else{
						request.setAttribute("error", "1");
						//System.out.println("用户【"+user1+"】登录失败");
						return "/login";
					}
				}else{
					request.setAttribute("error", "2");
					//System.out.println("用户【"+user+"】登录失败");
					return "/login";
				}
			}else{
				request.setAttribute("error", "code");
				return "/login";
			}
		}
	}
	
	public void UserCookie(HttpServletResponse response,String username ,String passw){
		Cookie userCookie = new Cookie("userCookie",username+"-"+passw);
		userCookie.setMaxAge(60*60*24*7); //一周
		response.addCookie(userCookie); 
	}
	
	/**
	 * 用户等出
	 */
	@SuppressWarnings("unused")
	@RequestMapping(params="method=logout")
	public String logout(String code,String page, HttpServletRequest request) {
		User U = (User) request.getSession().getAttribute("user");
		System.out.println("用户【"+U+"】等出");
		request.getSession().removeAttribute("user");
		return "/login";
	}
	
	
	
	
	
}
