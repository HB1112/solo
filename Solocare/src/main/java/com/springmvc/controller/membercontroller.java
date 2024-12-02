package com.springmvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.member;
import com.springmvc.service.memberService;

@Controller
public class membercontroller {
	
	@Autowired
	private memberService memberservice;
	
	@GetMapping("/login")
	public String gologin() {
		return "login";
	}
	
	// member R 로그인 했을 때 one Read
	
	@PostMapping("/login")
	public String loginmember(@RequestParam("id") String id,@RequestParam("pw") String pw , HttpServletRequest request, HttpServletResponse response) {	
		
		System.out.println(id);
		System.out.println(pw);
		
		member mb = memberservice.loginmember(id, pw);
	
		if(mb != null) {
			System.out.println("해당 멤버 존재 : "+mb.getName());
			HttpSession session = request.getSession(true);
			session.setAttribute("mem", mb);
			return "loginsuccess";
		}else {
			
			String error = "1";
			request.setAttribute("error", error);
		
			return "login";
		}
		
	}
	
	// member logut
	@GetMapping("/logout")
	public String logoutmember(HttpServletRequest request) {
		HttpSession session = request.getSession(false); // 기존 세션 가져오기
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }
		return "redirect:/home";
	}
	
	// member C
	
	@GetMapping("/addmember")
	public String goaddMember() {
		return "addmember";
	}
	
	@PostMapping("/addMember")
    public String addMember(@ModelAttribute member member,
                            @RequestParam("mailDomain") String mailDomain,
                            @RequestParam("birthyy") String birthyy,
                            @RequestParam("birthmm") String birthmm,
                            @RequestParam("birthdd") String birthdd,
                            Model model) {
        // 이메일 주소 통합
        String fullEmail = member.getEmail() + "@" + mailDomain;
        member.setEmail(fullEmail);

        // 생일 통합
        String birthDate = birthyy + "-" + birthmm + "-" + birthdd;
        member.setBirth(birthDate);

        // 데이터 처리 (예: 데이터베이스에 저장)
        
        // 모델에 추가하여 뷰로 전달
        model.addAttribute("member", member);
        
        memberservice.addmember(member);
        
        // 성공적으로 처리 후 리다이렉트 또는 뷰 이름 반환
        return "memberSuccess"; // 성공 페이지로 리다이렉트
    }
	
	// member U 내정보 보기
	@GetMapping("/infocheck")
	public String checkinfo() {
		return "checkinfo";
	}
	@PostMapping("/checkpw")
	public String checkinfo(@RequestParam("pw") String checkpw, HttpServletRequest request) {
		
		HttpSession session = request.getSession(false); // 기존 세션 가져오기
		member mem = (member) session.getAttribute("mem");
		String error;
		if(checkpw.equals(mem.getPw())) {		
			return "myinfo";
		}else {
			error = "패스워드가 틀렸습니다";
			request.setAttribute("error", error);
			return "checkinfo";
		}		
	}
	@GetMapping("/updatemember")
	public String goupdatemember() {
		
		return "updatemember";
	}
	@PostMapping("/updatemember")
	public String updatemember(@ModelAttribute member member,  @RequestParam("mailDomain") String mailDomain) {
		System.out.println(member.getName());
		System.out.println(member.getGender());
		
		String fullEmail = member.getEmail() + "@" + mailDomain;
        member.setEmail(fullEmail);
        System.out.println(member.getEmail());
		memberservice.updatemember(member);
		
		return "welcome";
	}
	@GetMapping("/deletemember")
	public String godeletemember(HttpServletRequest request) {
		HttpSession session = request.getSession(false); // 기존 세션 가져오기
		member mem = (member) session.getAttribute("mem");
		memberservice.deletemember(mem);
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }
		return "redirect:/home";
	}
}
