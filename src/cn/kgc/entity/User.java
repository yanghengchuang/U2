package cn.kgc.entity;

public class User {
	private Integer uid;   //账号
	private String username;//用户名
	private String phone;  //电话号码
	private String password; //登陆密码
	private String email; //电子邮箱
	private String sex;  //性别
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public User(Integer uid, String username, String phone, String password, String email, String sex) {
		super();
		this.uid = uid;
		this.username = username;
		this.phone = phone;
		this.password = password;
		this.email = email;
		this.sex = sex;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", phone=" + phone + ", password=" + password
				+ ", email=" + email + ", sex=" + sex + "]";
	}
	
	
	
	

}
