package com.issue.vo;

public class IssueVO {
	private int no;
	private String process;
	private String noticeYN;
	private String title;
	private String content;
	private String author;
	private String regDate;
	private String modDate;
	private int viewCnt;
	
	private String searchType;
	private String keyword;
	private String startDate;
	private String endDate;
	private String selectProcess;
	
	public IssueVO() {}

	public IssueVO(int no, String process, String noticeYN, String title, String content, String author, String regDate, String modDate, int viewCnt) {
		this.no = no;
		this.process = process;
		this.noticeYN = noticeYN;
		this.title = title;
		this.content = content;
		this.author = author;
		this.regDate = regDate;
		this.modDate = modDate;
		this.viewCnt = viewCnt;
	}
	
	public IssueVO(int no, String process, String noticeYN, String title, String content, String author, String regDate, String modDate, int viewCnt, String searchType, String keyword
			, String startDate, String endDate, String selectProcess) {
		this.no = no;
		this.process = process;
		this.noticeYN = noticeYN;
		this.title = title;
		this.content = content;
		this.author = author;
		this.regDate = regDate;
		this.modDate = modDate;
		this.viewCnt = viewCnt;
		this.searchType = searchType;
		this.keyword = keyword;
		this.startDate = startDate;
		this.endDate = endDate;
		this.selectProcess = selectProcess;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getNoticeYN() {
		return noticeYN;
	}

	public void setNoticeYN(String noticeYN) {
		this.noticeYN = noticeYN;
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

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
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

	public String getSelectProcess() {
		return selectProcess;
	}

	public void setSelectProcess(String selectProcess) {
		this.selectProcess = selectProcess;
	}

	@Override
	public String toString() {
		return "IssueVO [no=" + no + ", process=" + process + ", noticeYN=" + noticeYN + ", title=" + title
				+ ", content=" + content + ", author=" + author + ", regDate=" + regDate + ", modDate=" + modDate
				+ ", viewCnt=" + viewCnt + ", searchType=" + searchType + ", keyword=" + keyword + ", startDate="
				+ startDate + ", endDate=" + endDate + ", selectProcess=" + selectProcess + "]";
	}

}