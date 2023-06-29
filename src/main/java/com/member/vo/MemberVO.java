package com.member.vo;

public class MemberVO {
	private String code;
	private String department;
	private String id;
	private String name;
	private String phone;
	private String email;
	private String pw;
	private String repw;
	
	public MemberVO() {}

	public MemberVO(String code, String department, String id, String name, String phone, String email, String pw, String repw) {
		this.code = code;
		this.department = department;
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.pw = pw;
		this.repw = pw;
	}
/*	
	public MemberVO(String code, String department, String name, String phone, String email, String pw, String repw) {
		this.code = code;
		this.department = department;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.pw = pw;
		this.repw = pw;
	}
	public MemberVO(String id, String name) {
		this.id = id;
		this.name = name;
	}
*/	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRepw() {
		return repw;
	}
	public void setRepw(String repw) {
		this.repw = repw;
	}
	
	@Override
	public String toString() {
		return "MemberVO [code=" + code + ", department=" + department + ", id=" + id + ", name=" + name + ", email="
				+ email + ", pw=" + pw + ", repw=" + repw + "]";
	}
}
