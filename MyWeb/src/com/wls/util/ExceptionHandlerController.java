package com.wls.util;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ExceptionHandlerController {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@ExceptionHandler(Exception.class)
	public String operateExp(Exception ex,HttpServletRequest request){
		//mod.addAttribute("err", ex.getMessage()); 
		//ExceptionHandler处理异常时，Model，是不能用的，否则会不起作用，这里用了HttpServletRequest
//		JiGou jg = (JiGou) request.getSession().getAttribute("jg");
//		String sql = " INSERT INTO EXCEPTIONTABLE (ID,TIME,USERMSG,EXCNAME,MESSAGE,URL) VALUES (?,?,?,?,?,?)";
//		Object [] obj ={utils.GetID("EXCEPTIONTABLE"),new Date(),
//						jg.toString(),ex.getClass().toString(),
//						ex.getMessage(),request.getRequestURI()
//					};
		System.out.println("---------------------------抛出异常------------------------------");
		ex.printStackTrace();
//		jdbcTemplate.update(sql,obj);
		request.setAttribute("error",ex);
		return "/error";
	}
}