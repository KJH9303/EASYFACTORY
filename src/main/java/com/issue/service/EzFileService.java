package com.issue.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.issue.dao.EzFileDAO;
import com.issue.vo.EzFileVO;

@Service
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
	public void uploadFile(List<EzFileVO> fileList, int no) {
		for (EzFileVO ezFileVO : fileList) {
	        ezFileDAO.uploadFile(ezFileVO, no);
	    }
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
	
	// 파일 삭제
	public void deleteFile(int no) {
		ezFileDAO.deleteFile(no);
	}
}
