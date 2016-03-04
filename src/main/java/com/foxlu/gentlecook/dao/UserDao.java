package com.foxlu.gentlecook.dao;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foxlu.gentlecook.entity.User;

@Repository
public class UserDao {
	@Autowired
	private SessionFactory sf;
	
	public User getUser(Long id){
		Session session = sf.openSession();
		User user = (User) session.get(User.class, id);
		session.close();
		return user;
	}
	public void addUser(User user){
		Session session = sf.openSession();
		session.save(user);
		session.close();
	}
	public User getUserByusername(String username){
		Session session = sf.openSession();
		String hql = "from User where username = :username";
		User user = (User) session.createQuery(hql).setString("username", username).uniqueResult();
		session.close();
		return user;
	}
}
