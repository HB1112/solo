package com.springmvc.repository;

import java.util.ArrayList;

import com.springmvc.domain.board;

public interface boardRepository {

	void addboard(board board);

	ArrayList<board> readtipall(String category);

	board readoneboard(int num);

}
