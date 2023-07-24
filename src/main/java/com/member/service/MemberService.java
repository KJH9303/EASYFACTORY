package com.member.service;

import org.springframework.stereotype.Service;

import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;

@Service
public class MemberService {
	
	private MemberDAO memberDAO;

	public MemberService(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	// 아이디 중복체크
	public boolean checkDuplicateId(String id) {
		boolean isDuplicate = memberDAO.checkDuplicateId(id);
		return isDuplicate;
	}
	
	// 회원가입
	public void signUp(MemberVO memberVO) {
		memberDAO.signUp(memberVO);
	}
	
	// id, 비밀번호 체크 Ajax
	public boolean loginCheck(String id, String pw) {
		boolean isExist = memberDAO.loginCheck(id, pw);
		return isExist;
	}
	
	// 로그인
	public MemberVO login(String id, String pw) {
		MemberVO memberVO = memberDAO.login(id, pw);
		return memberVO;
	}
	
	// 회원 정보 수정
	public void update(MemberVO memberVO) {
		memberDAO.update(memberVO);
	}
	
	// 회원 탈퇴
	public void delete(String id) {
		memberDAO.delete(id);
	}
	
	
}
