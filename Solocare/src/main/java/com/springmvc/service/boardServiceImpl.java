package com.springmvc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.board;
import com.springmvc.repository.boardRepository;

@Service
public class boardServiceImpl implements boardService {
	
	@Autowired
	private boardRepository boardrepository;

	@Override
	public void addboard(board board) {
		System.out.println("boardServiceImpl addboard()");
		boardrepository.addboard(board);
	}

	@Override
	public ArrayList<board> readtipall(String category, int page, int pageSize) {
		System.out.println("boardServiceImpl readtipall()");
		return boardrepository.readtipall(category, page, pageSize);
	}

	@Override
	public board readoneboard(int num) {
		System.out.println("boardServiceImpl readoneboard");
		return boardrepository.readoneboard(num);
	}

	@Override
	public void updateboard(board board) {
		boardrepository.updateboard(board);
	}

	@Override
	public void deleteboard(int num) {
		boardrepository.deleteboard(num);
		
	}

	@Override
	public int getTotalBoardCount(String category) {
		return  boardrepository.getTotalBoardCount(category);
	}
	
}
