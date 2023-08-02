package com.smhrd.domain;

public class member {
	private String id;
	private String pw;
	private String username;
	private String email;
	
	public member(String id, String pw, String username, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.username = username;
		this.email = email;
	}

	public member(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
