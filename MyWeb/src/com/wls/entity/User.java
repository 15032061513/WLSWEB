package com.wls.entity;

public class User {

	private String id;       			//ID(序号)
	private String user_name;       	//用户名
	private String user_passw;       	//密码
	private String user_code;       	//用户code
	@Override
	public String toString() {
		return "User [id=" + id + ", user_name=" + user_name + ", user_passw="
				+ user_passw + ", user_code=" + user_code + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_passw() {
		return user_passw;
	}
	public void setUser_passw(String user_passw) {
		this.user_passw = user_passw;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	
	
}
