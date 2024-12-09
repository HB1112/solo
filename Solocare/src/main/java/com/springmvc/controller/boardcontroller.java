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
	
	@GetMapping("/tradeboard")
	public String gotrade() {
		return "board/trade";
	}
	// Read all
	@GetMapping("/board")
	public String goboardboard(@RequestParam String category, @RequestParam(defaultValue = "1") int page, Model model) {
		System.out.println("boardcontroller gosellboard()");
		System.out.println(category);
		
		int pageSize = 10; // 페이지당 게시글 수
        int totalBoards = boardservice.getTotalBoardCount(category); // 전체 게시글 수
        int totalPages = (int) Math.ceil((double) totalBoards / pageSize); // 총 페이지 수

        // 현재 페이지에 해당하는 게시글 리스트 조회
        ArrayList<board> boardlist = boardservice.readall(category, page, pageSize);
        model.addAttribute("boardlist", boardlist);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
		
		return "board/"+category;
	}
	// Read search
	@GetMapping("/search")
	public String searchBoard(
	        @RequestParam("items") String items, 
	        @RequestParam("text") String text, 
	        @RequestParam(defaultValue = "1") int page,
	        @RequestParam("category") String category, 
	        Model model) {
		System.out.println("boardcontroller searchBoard()");
	    // 로그 확인용
	    System.out.println("검색 조건: " + items);
	    System.out.println("검색어: " + text);
	    System.out.println("카테고리: " + category);
	    System.out.println("페이지: " + page);
	    
	    int pageSize = 10; // 페이지당 게시글 수
	    int totalBoards = boardservice.getsearchBoardCount(items,text,category); // search 게시글 수
        int totalPages = (int) Math.ceil((double) totalBoards / pageSize); // 총 페이지 수
	    
	    ArrayList<board> searchresult = boardservice.searchboards(items,text,category,page,pageSize);
	    model.addAttribute("boardlist", searchresult);
	    model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("items", items);
        model.addAttribute("text", text);

	    // 필요한 데이터 처리 후, 뷰로 이동
	    return "board/" + category;
	}
	
	// Read one
	@GetMapping("/detail")
	public String goboarddetail(@RequestParam int num, Model model) {
		System.out.println("boardcontroller goboarddetail()");
		board board = new board();
		board = boardservice.readoneboard(num);
		model.addAttribute("board",board);
		return "board/boardone";
	}
	
	// Create
	@GetMapping("/writeboard")
	public String writeboard(@RequestParam String category, Model model) {
		System.out.println("boardcontroller writeboard()");
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
		
		boardservice.addboard(board);
	
		return "redirect:/board?category="+board.getCategory();
	}
	// Update
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
		System.out.println("수정 카테고리 : "+board.getCategory());
		boardservice.updateboard(board);
		
		return "redirect:/board?category=";
	}
	// Delete
	@GetMapping("/deleteboard")
	public String deleteboard(@RequestParam int num) {
		System.out.println("boardcontroller deleteboard()");
		boardservice.deleteboard(num);
		return "redirect:/tipboard?category=tip";
	}
	
	
}
