package com.foxlu.gentlecook.controller;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foxlu.gentlecook.dao.OrderDao;
import com.foxlu.gentlecook.entity.User;
import com.foxlu.gentlecook.service.UserManager;

@Controller
@RequestMapping("/test")
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserCenterController.class);

	@Autowired
	private UserManager userManager;
	@Autowired
	private OrderDao od;

	@RequestMapping("/adduser.do")
	@ResponseBody
	public User addUser() {
		User user = new User();
		String username = "test" + String.valueOf((int)(Math.random() * 9000 + 1000));
		String email = username + "@test.com";
		user.setUsername(username);
		user.setEmail(email);
		user.preRegister();
		userManager.addUser(user);
		logger.info(user.toString());
		return user;
	}
	@RequestMapping("getcomments")
	@ResponseBody
	public Set getCommentsByUser(Long id){
		return userManager.getCommentsByUserId(id);
	}
	
	@RequestMapping("getallorders")
	@ResponseBody
	public List getAllOrders(){
		return od.getAllOrders();
	}
}
