package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.comment;
import com.springmvc.repository.commentRepository;

@Service
public class commentServiceImpl implements commentService{

	@Autowired
	private commentRepository commentrepository;

	@Override
	public void saveComment(comment comment) {
		commentrepository.saveComment(comment);
	}

}
