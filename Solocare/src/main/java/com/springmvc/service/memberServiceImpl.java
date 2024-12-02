package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.member;
import com.springmvc.repository.memberRepository;

@Service
public class memberServiceImpl implements memberService{

	@Autowired
	private memberRepository memberrepository;
	
	
	
	@Override
	public void addmember(member member) {
		// TODO Auto-generated method stub
		System.out.println("memberServiecImple addmember()");
		memberrepository.addmember(member);
	}



	@Override
	public member getmemberById(String id) {
		System.out.println("memberServiecImple ById()");
		return memberrepository.getmemberById(id);
	}



	@Override
	public member loginmember(String id, String pw) {
		System.out.println("memberServiecImple loginmember");
		return memberrepository.loginmember(id, pw);
	}



	@Override
	public void updatemember(member member) {
		System.out.println("memberServiecImple updatemember()");
		memberrepository.updatemember(member);
	}



	@Override
	public void deletemember(member mem) {
		System.out.println("memberServiecImple deletemember()");
		memberrepository.deletemember(mem);
	}

}
