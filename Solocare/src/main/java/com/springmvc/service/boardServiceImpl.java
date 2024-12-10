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
	
		boardrepository.addboard(board);
	}

	@Override
	public ArrayList<board> readall(String category, int page, int pageSize) {

		return boardrepository.readall(category, page, pageSize);
	}

	@Override
	public board readoneboard(int num) {
	
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

	@Override
	public ArrayList<board> searchboards(String items, String text, String category, int page, int pageSize) {
		return boardrepository.searchboards(items,text,category,page,pageSize);
	}

	@Override
	public int getsearchBoardCount(String items, String text, String category) {
		
		return  boardrepository.getsearchBoardCount(items, text, category);
	}

	@Override
	public void incrementhit(int num) {
		boardrepository.incrementhit(num);
		
	}
	
}
