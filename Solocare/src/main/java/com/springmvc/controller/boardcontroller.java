package com.springmvc.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.board;
import com.springmvc.service.boardService;



@Controller
public class boardcontroller {
	
	@Autowired
	private boardService boardservice;
	
	@GetMapping("/tipboard")
	public String gotipboard(@RequestParam String category, Model model) {
		System.out.println("boardcontroller gotipboard()");
		System.out.println(category);
		
		ArrayList<board> boardlist = new ArrayList<board>();
		boardlist=boardservice.readtipall(category);
		model.addAttribute("boardlist",boardlist);
		
		return "board/tipboard";
	}
	@GetMapping("/detail")
	public String gotipboarddetail(@RequestParam int num, Model model) {
		System.out.println("boardcontroller gotipboarddetail()");
		System.out.println("게시글 번호: " + num);
		board board = new board();
		board = boardservice.readoneboard(num);
		model.addAttribute("board",board);
		return "board/tipboardone";
	}

	@GetMapping("/writeboard")
	public String writeboard(HttpServletRequest request) {
		System.out.println("boardcontroller writeboard()");
		return "board/writeboard";
	}
	@PostMapping("/addboard")
	public String addboard(@ModelAttribute board board) {
		System.out.println("boardcontroller addboard()");
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
		String regist_date = formatter.format(new java.util.Date());
				
		board.setHit(0);
		board.setRegist_date(regist_date);
		
		System.out.println(board.getNum());
		System.out.println(board.getId());
		System.out.println(board.getSubject());
		System.out.println(board.getContent());
		System.out.println(board.getRegist_date());
		System.out.println(board.getHit());
		System.out.println(board.getCategory());
		
		boardservice.addboard(board);
	
		return "board/tipboard";
	}
}
