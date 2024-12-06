package com.springmvc.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.userDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@GetMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@PostMapping("/case1")
	public void case1(@RequestBody HashMap<String,Object> map) {
		System.out.println("mapping ok");
		System.out.println(map.get("name"));
		System.out.println(map.get("age"));
		System.out.println(map);
	}
	
	@PostMapping("/case2")
	public void case2(@RequestBody HashMap<String,Object> map) {
		System.out.println("case2");
		System.out.println(map.get("id"));
		
	}
	@ResponseBody
	@PostMapping("/case3")
	public userDto case3(@RequestBody HashMap<String,Object> map) {
		System.out.println("case3");
		String id = (String)map.get("id");
		userDto dto = new userDto();
		dto.setId(id);
		dto.setName("kim");
		return dto;
	}

	
	
	
	
	
	
	
}