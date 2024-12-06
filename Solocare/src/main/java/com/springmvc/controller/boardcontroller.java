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
	// Board Read by category
	@GetMapping("/tipboard")
	public String gotipboard(@RequestParam String category, @RequestParam(defaultValue = "1") int page, Model model) {
		System.out.println("boardcontroller gotipboard()");
		System.out.println(category);
		
		int pageSize = 10; // 페이지당 게시글 수
        int totalBoards = boardservice.getTotalBoardCount(category); // 전체 게시글 수
        int totalPages = (int) Math.ceil((double) totalBoards / pageSize); // 총 페이지 수

        // 현재 페이지에 해당하는 게시글 리스트 조회
        ArrayList<board> boardlist = boardservice.readtipall(category, page, pageSize);
        model.addAttribute("boardlist", boardlist);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
		
        System.out.println("Current Page: " + page);
        System.out.println("Total Pages: " + totalPages);
        
		return "board/tipboard";
	}
	@GetMapping("/tradeboard")
	public String gotrade() {
		return "board/trade";
	}
	@GetMapping("/board")
	public String gosellboard(@RequestParam String category, @RequestParam(defaultValue = "1") int page, Model model) {
		System.out.println("boardcontroller gosellboard()");
		System.out.println(category);
		
		int pageSize = 10; // 페이지당 게시글 수
        int totalBoards = boardservice.getTotalBoardCount(category); // 전체 게시글 수
        int totalPages = (int) Math.ceil((double) totalBoards / pageSize); // 총 페이지 수

        // 현재 페이지에 해당하는 게시글 리스트 조회
        ArrayList<board> boardlist = boardservice.readtipall(category, page, pageSize);
        model.addAttribute("boardlist", boardlist);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
		
        System.out.println("Current Page: " + page);
        System.out.println("Total Pages: " + totalPages);
		
		return "board/"+category;
	}
	@GetMapping("/buyboard")
	public String gobuyboard(@RequestParam String category, @RequestParam(defaultValue = "1") int page, Model model) {
		System.out.println("boardcontroller gobuyboard()");
		System.out.println(category);
		
		int pageSize = 10; // 페이지당 게시글 수
        int totalBoards = boardservice.getTotalBoardCount(category); // 전체 게시글 수
        int totalPages = (int) Math.ceil((double) totalBoards / pageSize); // 총 페이지 수

        // 현재 페이지에 해당하는 게시글 리스트 조회
        ArrayList<board> boardlist = boardservice.readtipall(category, page, pageSize);
        model.addAttribute("boardlist", boardlist);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
		
        System.out.println("Current Page: " + page);
        System.out.println("Total Pages: " + totalPages);
		return "board/buy";
	}
	@GetMapping("/detail")
	public String gotipboarddetail(@RequestParam int num, Model model) {
		System.out.println("boardcontroller gotipboarddetail()");
		System.out.println("게시글 번호: " + num);
		board board = new board();
		board = boardservice.readoneboard(num);
		model.addAttribute("board",board);
		return "board/boardone";
	}

	@GetMapping("/writeboard")
	public String writeboard(@RequestParam String category, Model model) {
		System.out.println("boardcontroller writeboard()");
		System.out.println(category);
		model.addAttribute("category",category);
		return "board/writeboard";
	}
	@PostMapping("/writeboard")
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
	
		return "redirect:/tipboard?category=tip";
	}
	@GetMapping("/updateboard")
	public String updateboard(@RequestParam int num, Model model) {
		System.out.println("boardcontroller GET updateboard()");
		board board = boardservice.readoneboard(num);
		model.addAttribute("board",board);
		return "board/updateboard";
	}
	@PostMapping("/updateboard")
	public String updateboard(@ModelAttribute board board) {
		System.out.println("boardcontroller POST updateboard()");
		System.out.println(board.getNum());
		System.out.println(board.getId());
		System.out.println(board.getSubject());
		System.out.println(board.getContent());
		System.out.println(board.getRegist_date());
		System.out.println(board.getHit());
		System.out.println(board.getCategory());
	
		boardservice.updateboard(board);
		
		return "redirect:/tipboard?category=tip";
	}
	@GetMapping("/deleteboard")
	public String deleteboard(@RequestParam int num) {
		System.out.println("boardcontroller deleteboard()");
		boardservice.deleteboard(num);
		return "redirect:/tipboard?category=tip";
	}
	
	
}
