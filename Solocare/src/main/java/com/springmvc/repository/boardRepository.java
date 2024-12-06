package com.springmvc.repository;

import java.util.ArrayList;

import com.springmvc.domain.board;

public interface boardRepository {

	void addboard(board board);

	ArrayList<board> readtipall(String category, int page, int pageSize);

	board readoneboard(int num);

	void updateboard(board board);

	void deleteboard(int num);
	
	int getTotalBoardCount(String category); // 전체 게시글 수 조회

}
