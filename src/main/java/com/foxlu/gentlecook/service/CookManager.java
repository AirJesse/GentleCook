package com.foxlu.gentlecook.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foxlu.gentlecook.dao.CookDao;
import com.foxlu.gentlecook.entity.Comment;
import com.foxlu.gentlecook.entity.Cook;

@Service
public class CookManager {
	private static final Logger loger = LoggerFactory.getLogger(CookManager.class);
	@Autowired
	private CookDao cd;
	
	public List<Cook> getAllCooks(){
		return cd.getAllCooks();
	}

	public List<Comment> getAllCommentsByCookId(Long id) {
		return cd.getAllCommentsByCookId(id);
	}

	public void saveComment(Long userId,Long cookId,String content,Boolean type) {
		cd.saveComment(userId,cookId,content,type);
		
	}
}
