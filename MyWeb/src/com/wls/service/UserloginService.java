package com.wls.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wls.dao.UserloginImpl;
import com.wls.entity.User;

@Service
public class UserloginService { 
	
	@Autowired
	private UserloginImpl userloginImpl;
	
	/**
	 * 用户登录验证
	 */
	public User login(User user) {
		return userloginImpl.login(user);
	}

	
}
