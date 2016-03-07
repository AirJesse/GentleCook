package com.foxlu.gentlecook.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.Md5Crypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foxlu.gentlecook.entity.User;
import com.foxlu.gentlecook.service.UserManager;
import com.foxlu.gentlecook.util.Constant;

@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@Autowired
	private UserManager userManager;

	@RequestMapping("/register")
	public String registerPage() {
		return null;
	}

	@RequestMapping("/register.pub")
	@ResponseBody
	public String register(User user) {
		logger.debug("注册:  " + user.toString());
		user.preRegister();
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		userManager.addUser(user);
		
		return  "success";
	}
	

	@RequestMapping("/register/checkusername.pub")
	@ResponseBody
	public Map<String,String> checkUsername(String username) {
		boolean status = userManager.checkUsername(username);
		Map<String, String> result = new HashMap<>();
		result.put("status", status==true?"success":"failed");
		logger.debug("checkUsername --- " + result );
		return result;	
	}
	@RequestMapping("/login")
	public String loginPage(){
		return null;
	}
	@RequestMapping("/login.pub")
	public String login(User user,HttpSession session){
		logger.debug(user.toString());
		User u = userManager.login(user);
		if(u!=null){
			session.setAttribute("currentUser", u);
			return "successlogin";
		}else{
			return "failedlogin";
		}
	}
	@RequestMapping("/logout.pub")
	public String logout(HttpSession session){
		if(session.getAttribute("currentUser")!=null){
			session.removeAttribute("currentUser");
			return "index";
		}else{
			return "index";
		}
	}
}
