package com.foxlu.gentlecook.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foxlu.gentlecook.dao.CookDao;
import com.foxlu.gentlecook.dto.CookDto;
import com.foxlu.gentlecook.entity.Comment;
import com.foxlu.gentlecook.entity.Cook;

@Service
public class CookManager {
	private static final Logger loger = LoggerFactory.getLogger(CookManager.class);
	@Autowired
	private CookDao cd;
	
	public List<CookDto> getAllCookDtos(){
		List<Cook> list = cd.getAllCooks();
		List<CookDto> result = new ArrayList<>();
		for(Cook c :list){
			CookDto cdt = new CookDto();
			cdt.setId(c.getId());
			cdt.setAvatar(c.getAvatar());
			cdt.setGender(c.getGender());
			cdt.setMotto(c.getMotto());
			cdt.setName(c.getName());
			cdt.setPrice(c.getPrice());
			cdt.setSkill(c.getSkill());
			cdt.setTimes(c.getTimes());
			Double acclaim = cd.getAcclaimById(c.getId());
			
			if(acclaim == -1){
				cdt.setAcclaim("暂无评价");
			}else{
				cdt.setAcclaim( (int)(acclaim*100) +"%");
			}
			result.add(cdt);
		}
		return result;
	}

	public List<Comment> getAllCommentsByCookId(Long id) {
		return cd.getAllCommentsByCookId(id);
	}

	public void saveComment(Long userId,Long cookId,String content,Boolean type) {
		cd.saveComment(userId,cookId,content,type);
		
	}
	public Cook getCookById(Long id){
		return cd.getCookById(id);
	}
}
