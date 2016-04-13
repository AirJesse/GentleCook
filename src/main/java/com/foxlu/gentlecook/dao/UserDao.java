package com.foxlu.gentlecook.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;



import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foxlu.gentlecook.entity.User;

@Repository
public class UserDao {
	private static final Logger logger = LoggerFactory.getLogger(UserDao.class);
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
	public User login(String username, String password) {
		String hql = "from User where username=:username and password=:password";
		Session session = sf.openSession();
		session.beginTransaction();
		User user = (User) session.createQuery(hql).setString("username", username)
				.setString("password", DigestUtils.md5Hex(password)).uniqueResult();
		if(user!=null){
			user.setLastLogin(new Date());
			logger.debug(user.getLastLogin().toString());
			session.saveOrUpdate(user);
		}
		session.getTransaction().commit();
		session.close();
		return user;
		
	}
	public Set getCommentsByUserId(Long id) {
		Session s = sf.openSession();
		User u = (User) s.get(User.class, id);
		s.close();
		return u.getComments();
		
	}
	public Set getUserOrders(Long userId) {
		Session s = sf.openSession();
		User u = (User) s.get(User.class, userId);
		s.close();
		return u.getOrders();
	}
}
