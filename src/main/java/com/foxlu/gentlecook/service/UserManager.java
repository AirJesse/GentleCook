package com.foxlu.gentlecook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foxlu.gentlecook.dao.UserDao;
import com.foxlu.gentlecook.entity.User;

@Service
@Transactional
public class UserManager {
	@Autowired
	private UserDao ud;
	
	public User getUserInfo(Long id){
		return ud.getUser(id);
	}
	public void addUser(User user){
		ud.addUser(user);
	}
	public boolean checkUsername(String username){
		User user = ud.getUserByusername(username);
		return user==null?false:true;
	}
	public User login(User user){
		User u = ud.login(user.getUsername(),user.getPassword());
		return u;
	}
	public List getCommentsByUserId(Long id) {
		return ud.getCommentsByUserId(id);
	}
}
