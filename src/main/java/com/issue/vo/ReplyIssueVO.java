package com.issue.vo;

public class ReplyIssueVO {

	private int no;
	private int reno;
	private String content;
	private String author;
	private String regDate;
	private String modDate;
	
	public ReplyIssueVO() {}

	public ReplyIssueVO(int no, int reno, String content, String author, String regDate, String modDate) {
		this.no = no;
		this.reno = reno;
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

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		
		return "IssueReVO [no=" + no + ", reno=" + reno + ", content=" + content + ", author=" + author + ", regDate="
				+ regDate + ", modDate=" + modDate + "]";
		
	
		//return String.format("['%d', '%d', '%s', '%s', '%s', '%s']", no, reno, content, author, regDate, modDate);
		
	}
	
	
}
