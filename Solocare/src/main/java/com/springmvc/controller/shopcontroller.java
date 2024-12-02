package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class shopcontroller {
	@GetMapping("/shopone")
	public String shopone(){
		return "shop/shopone";
	}
	@GetMapping("/shoptwo")
	public String shoptwo(){
		return "shop/shoptwo";
	}
	@GetMapping("/shopthree")
	public String shopthree(){
		return "shop/shopthree";
	}
}
