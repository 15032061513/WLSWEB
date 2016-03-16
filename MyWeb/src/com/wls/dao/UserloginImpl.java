package com.wls.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wls.entity.User;

@Repository
public class UserloginImpl {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 用户登录验证(机构登录)
	 */
	public User login(User user) {
		User find_user = new User();
		String sql = "SELECT * FROM TB_USER WHERE TB_USER.USER_NAME=? AND TB_USER.USER_PASSW=?";
		Object [] obj ={user.getUser_name(),user.getUser_passw()};
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,obj);
		if (list !=null && list.size()>0) {
			find_user.setId(list.get(0).get("ID").toString());
			find_user.setUser_name(list.get(0).get("USER_NAME")==null ?"":list.get(0).get("USER_NAME").toString());
			find_user.setUser_passw(list.get(0).get("USER_PASSW")==null ?"":list.get(0).get("USER_PASSW").toString());
			find_user.setUser_code(list.get(0).get("USER_CODE")==null ?"":list.get(0).get("USER_CODE").toString());
		}
		return find_user;
	}

}
