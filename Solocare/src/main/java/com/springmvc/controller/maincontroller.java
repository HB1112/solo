package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class maincontroller {
	@GetMapping
	public String welcome(){
		return "welcome";
	}
	@GetMapping("/login")
    public String showLoginForm() {
        return "login"; // login.jsp로 포워딩
    }
}
