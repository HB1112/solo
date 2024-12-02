package com.springmvc.service;

import org.springframework.ui.Model;

import com.springmvc.domain.member;

public interface memberService {
	
	void addmember(member member);
	
	member loginmember(String id, String pw);

	member getmemberById(String id);

	void updatemember(member member);

	void deletemember(member mem);
}
