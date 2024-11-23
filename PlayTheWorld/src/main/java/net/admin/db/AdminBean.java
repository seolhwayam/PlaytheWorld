package net.admin.db;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class AdminBean {
	private List<String> userList = new ArrayList<>();
	private List<String> userInfo = new ArrayList<>();
	private String jumin_number;
	private String password;
	private String email;
	private String name;
	private String hobby;
	private String introduction;
	private String user_id;
	public List<String> getUserList() {
		return userList;
	}
	public void setUserList(String userList) {
		this.userList.add(userList);
	}
	public List<String> getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo.add(userInfo);
	}
	public String getJumin_number() {
		return jumin_number;
	}
	public void setJumin_number(String jumin_number) {
		this.jumin_number = jumin_number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	

	
	
	
	
	
}