package com.springmvc.service;


import java.util.ArrayList;

import com.springmvc.domain.board;

public interface boardService {

	void addboard(board board);

	ArrayList<board> readtipall(String category);

	board readoneboard(int num);

}
