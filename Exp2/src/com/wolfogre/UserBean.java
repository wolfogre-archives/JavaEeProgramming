package com.wolfogre;

/**
 * Created by Jason Song(wolfogre.com) on 04/01/2016.
 */
public class UserBean implements java.io.Serializable{
	private String username;
	private String password;
	private String passwordAgain;
	private String sex;
	private int age;
	//private String country;
	//private String mail;
	//private String telephone;

	public UserBean() {
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordAgain() {
		return passwordAgain;
	}

	public void setPasswordAgain(String passwordAgain) {
		this.passwordAgain = passwordAgain;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
