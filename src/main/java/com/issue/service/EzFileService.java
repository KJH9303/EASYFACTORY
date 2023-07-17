package com.issue.service;

import java.util.List;

import com.issue.dao.EzFileDAO;
import com.issue.vo.EzFileVO;
import com.issue.vo.ReplyIssueVO;

public class EzFileService {

	private EzFileDAO ezFileDAO;

	public EzFileService(EzFileDAO ezFileDAO) {
		this.ezFileDAO = ezFileDAO;
	}
	
	// 파일 갯수
	public int issueFileListCnt(int no) {
		int cnt = ezFileDAO.issueFileListCnt(no);
		return cnt;
	}
	
	// 파일 목록
	public List<EzFileVO> getFileList(int no) {
		List<EzFileVO> fileList = ezFileDAO.getFileList(no);
		return fileList;
	}
}
