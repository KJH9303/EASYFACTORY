package com.issue.vo;

import java.util.Date;

public class IssueVO {
	private int no;
	private String title;
	private String content;
	private String author;
	private Date regDate;
	private Date modDate;
	
	public IssueVO() {}

	public IssueVO(int no, String title, String content, String author, Date regDate, Date modDate) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.author = author;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "IssueVO [no=" + no + ", title=" + title + ", content=" + content + ", author=" + author + ", regdate="
				+ regDate + ", moddate=" + modDate + "]";
	}
	
}