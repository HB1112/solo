package com.springmvc.service;


import java.util.ArrayList;

import com.springmvc.domain.board;

public interface boardService {

	void addboard(board board);

	ArrayList<board> readall(String category, int page, int pageSize);

	board readoneboard(int num);

	void updateboard(board board);

	void deleteboard(int num);

	int getTotalBoardCount(String category);

	ArrayList<board> searchboards(String items, String text, String category, int page, int pageSize);

	int getsearchBoardCount(String items, String text, String category);

	void incrementhit(int num);

}
