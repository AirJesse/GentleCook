package com.foxlu.gentlecook.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foxlu.gentlecook.entity.Order;
import com.foxlu.gentlecook.entity.User;
import com.foxlu.gentlecook.service.UserManager;

@Controller
@RequestMapping("/usercenter")
public class UserCenterController {
	private static final Logger logger = LoggerFactory.getLogger(UserCenterController.class);
	
	@Autowired
	private UserManager userManager;
	
	@RequestMapping("/showuserinfo.do")
	@ResponseBody
	public User showUserInfo(HttpSession session){
		return (User) session.getAttribute("currentUser");
	}
	@RequestMapping("/showuserorders.do")
	@ResponseBody
	public Set showUserOrders(HttpSession session){
		User u = (User) session.getAttribute("currentUser");
		return userManager.getUserOrders(u.getId());
	}
	@RequestMapping("/cancelorder.do")
	@ResponseBody
	public void cancelOrder(@RequestParam Long orderId){
		userManager.cancelOrderById(orderId);
	}
}
