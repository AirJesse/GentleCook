package com.foxlu.gentlecook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foxlu.gentlecook.entity.Comment;
import com.foxlu.gentlecook.entity.Cook;
import com.foxlu.gentlecook.entity.User;
import com.foxlu.gentlecook.service.CookManager;

@Controller
@RequestMapping("/cook")
public class CookController {
	private static final Logger logger = LoggerFactory.getLogger(CookController.class);
	@Autowired
	private CookManager cm;
	
	@RequestMapping("/getcooks.pub")
	@ResponseBody
	public List<Cook> getCooks(){
		List<Cook> result = cm.getAllCooks();
		logger.debug("浏览厨师: " + result.size() + "条");
		return cm.getAllCooks();
	}
	@RequestMapping("/getcookcomments.pub")
	@ResponseBody
	public Map<String,Object> getCookComments(Long id,HttpSession session){
		System.out.println(id);
		Map<String,Object> result = new HashMap<>();
		if(session.getAttribute("currentUser")!=null){
			result.put("isLogin", true);
		}else{
			result.put("isLogin",false);
		}
		List<Comment> list = cm.getAllCommentsByCookId(id);
		logger.debug(list.toString());
		result.put("result", list);
		return result;
	}
	@RequestMapping("/submitcomment.do")
	@ResponseBody
	public String submitCommit(String content,Long id,Boolean type,HttpSession session){
		logger.debug("接受评价:" + id + "  " + content + "  " + type);
		Long userId = ((User)session.getAttribute("currentUser")).getId();
		cm.saveComment(userId,id,content,type);
		return "success";
	}
}
