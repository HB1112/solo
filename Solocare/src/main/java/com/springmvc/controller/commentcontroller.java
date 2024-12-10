package com.springmvc.controller;


import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springmvc.domain.comment;
import com.springmvc.service.commentService;

@RestController
public class commentcontroller {

    @Autowired
    private commentService commentService; // 댓글 저장 서비스

    @PostMapping("/addComment")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addComment(@RequestBody comment commentDto) {
    	System.out.println("가져오는지 확인");
        Map<String, Object> response = new HashMap<>();
        try {
        	System.out.println(commentDto.getBoardnum());
        	 // 댓글 추가 로직
            commentDto.setLikes(0); // 기본값으로 좋아요 수를 0으로 설정
            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm");
            String regist_date = formatter.format(new java.util.Date());
            commentDto.setCreatedDate(regist_date);

            commentService.saveComment(commentDto);
            
            // 성공적으로 추가된 경우
            response.put("success", true);
            response.put("commentnum", commentDto.getCommentnum());
            response.put("boardnum", commentDto.getBoardnum());
            response.put("authorId", commentDto.getAuthorid());
            response.put("content", commentDto.getCommentcontent());
            response.put("createdDate", commentDto.getCreatedDate().toString());
            response.put("likes", commentDto.getLikes());
            
        } catch (Exception e) {
            response.put("success", false);
        }
        return ResponseEntity.ok(response);
    }
}
