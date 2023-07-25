package com.smhrd.domain;

public class News {
	private int seq;
	private String title;
	private String content;
	private String press;
	private String at;
	private String reporter;
	private String link;
	//생성자
	public News(int seq, String title, String content, String press, String at, String reporter, String link) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.press = press;
		this.at = at;
		this.reporter = reporter;
		this.link = link;
	}
	
	// getter,setter
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAt() {
		return at;
	}
	public void setAt(String at) {
		this.at = at;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	

	











}
