package com.issue.vo;

public class EzFileVO {
	
	private int fileno;
	private int no;
	private String originalname;
	private String savename;
	private int filesize;
	private String regDate;
	private String modDate;
	private String filesizeFormatted;
	
	public EzFileVO() {}

	public EzFileVO(int fileno, int no, String originalname, String savename, int filesize, String regDate, String modDate) {
		this.fileno = fileno;
		this.no = no;
		this.originalname = originalname;
		this.savename = savename;
		this.filesize = filesize;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public int getFileno() {
		return fileno;
	}

	public void setFileno(int fileno) {
		this.fileno = fileno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOriginalname() {
		return originalname;
	}

	public void setOriginalname(String originalname) {
		this.originalname = originalname;
	}

	public String getSavename() {
		return savename;
	}

	public void setSavename(String savename) {
		this.savename = savename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
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
		return "EzFileVO [fileno=" + fileno + ", no=" + no + ", originalname=" + originalname + ", savename=" + savename
				+ ", filesize=" + filesize + ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}

	public String getFilesizeFormatted() {
		return filesizeFormatted;
	}

	public void setFilesizeFormatted(String formattedSize) {
		this.filesizeFormatted = formattedSize;
	}
}
