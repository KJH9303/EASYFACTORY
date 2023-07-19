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
	// 다음 게시물 번호 조회
	public int getDynamicIssueNo() {
		return ezFileDAO.getDynamicIssueNo();
	}
		
	// 파일 업로드
	public void uploadFile(EzFileVO ezFileVO, int no) {
        ezFileDAO.uploadFile(ezFileVO, no);
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
