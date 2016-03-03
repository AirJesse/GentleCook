package com.foxlu.gentlecook.service;

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
}
