package com.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.service.MemberService;
import com.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
    private MemberService memberService;
    
    public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
    
    // 페이지 이동 관련 Method : com.member.config.MvcConfig 참고
    
    // 아이디 중복 체크
    @PostMapping("/checkDuplicateId")
    @ResponseBody
    public String checkDuplicateId(@RequestParam("id") String id) throws Exception {
        boolean isDuplicate = memberService.checkDuplicateId(id);
        if (isDuplicate) {
            return "duplicate";
        } else {
            return "available";
        }
    }
    
    // 회원가입 기능
    @RequestMapping(value="/signupSubmit", method=RequestMethod.POST)
    public String postSignUp(@ModelAttribute MemberVO memberVO) throws Exception {
    	memberService.signUp(memberVO);
		return "/member/login";
    }
    
    // id, 비밀번호 체크 Ajax
    @PostMapping("/idAndPwCheck")
    @ResponseBody
    public String loginCheck(@RequestParam("id") String id, @RequestParam("pw") String pw) throws Exception {
        boolean isExist = memberService.loginCheck(id, pw);
        if (isExist) {
            return "exist";
        } else {
            return "null";
        }
    }
    
    // 로그인 페이지 이동
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String getLoginPage(HttpServletRequest request, Model model) throws Exception {
    	String prevPage = request.getHeader("referer");
    	model.addAttribute("prevPage", prevPage); // 이전 페이지 URL 전달
    	return "member/login";
    }
    
    // 로그인 기능
    @RequestMapping(value="/loginSubmit", method=RequestMethod.POST)
    public String loginSubmit(HttpServletRequest request, HttpServletResponse response, MemberVO memberVO) throws Exception {
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	HttpSession session = request.getSession();
    	MemberVO signIn = memberService.login(id, pw);
    	
    	if(signIn == null) {
            session.setAttribute("member", null);
        } else {
            session.setAttribute("member", signIn);
            session.setMaxInactiveInterval(30 * 60); // 세션 유지 시간 : 30분
            
            String prevPage = request.getParameter("prevPage");
            
            if (prevPage != null && !prevPage.isEmpty()) {
                return "redirect:" + prevPage; // 로그인 이전 페이지로 리디렉션
            }
        }
        return "redirect:/main";
    }
    
    // 로그아웃 기능
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	HttpSession session = request.getSession();
    	session.invalidate();
    	return "redirect:/main";
    }
    
    // 회원정보 수정
    @RequestMapping(value="/updateSubmit", method=RequestMethod.POST)
    public String update(@ModelAttribute MemberVO memberVO, HttpServletRequest request) throws Exception {
    	memberService.update(memberVO);
    	HttpSession session = request.getSession();
    	session.setAttribute("member", memberVO);
    	session.setMaxInactiveInterval(30 * 60); // 세션 유지 시간 : 30분
    	return "redirect:/main";
    }
    
    // 회원 탈퇴
    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String delete(HttpSession session, HttpServletRequest request) throws Exception {
    	MemberVO memberVO = (MemberVO) session.getAttribute("member");
    	String id = memberVO.getId();
    	memberService.delete(id);
    	session.invalidate();
    	return "redirect:/main";
    }
    
}