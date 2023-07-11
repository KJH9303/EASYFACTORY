package com.issue.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

// import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class IssueVO {
	private int no;
	private String title;
	private String content;
	private String author;
	private String regDate;
	private String modDate;
	
	private String searchType;
	private String keyword;
	private String startDate;
	private String endDate;
	
	public IssueVO() {}

	public IssueVO(int no, String title, String content, String author, String regDate, String modDate) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.author = author;
		this.regDate = regDate;
		this.modDate = modDate;
	}
	
	public IssueVO(int no, String title, String content, String author, String regDate, String modDate, String searchType, String keyword, String startDate, String endDate) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.author = author;
		this.regDate = regDate;
		this.modDate = modDate;
		this.searchType = searchType;
		this.keyword = keyword;
		this.startDate = startDate;
		this.endDate = endDate;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "IssueVO [no=" + no + ", title=" + title + ", content=" + content + ", author=" + author + ", regDate="
				+ regDate + ", modDate=" + modDate + ", searchType=" + searchType + ", keyword=" + keyword
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}