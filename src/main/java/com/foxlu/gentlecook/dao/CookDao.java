package com.foxlu.gentlecook.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foxlu.gentlecook.entity.Comment;
import com.foxlu.gentlecook.entity.Cook;
import com.foxlu.gentlecook.entity.User;

@Repository
public class CookDao {
	private static final Logger logger = LoggerFactory.getLogger(CookDao.class);
	@Autowired
	private SessionFactory sf;
	public List<Cook> getAllCooks() {
		Session s =  sf.openSession();
		String hql = "select new Cook(id,name,avatar,gender,motto,skill,price,times) from Cook";
		List<Cook> result = s.createQuery(hql).list();
		s.close();
		return result;
		
	}
	public List<Comment> getAllCommentsByCookId(Long id) {
		Session s = sf.openSession();
		String hql ="from Comment where cook_id = :id";
		List<Comment> result = s.createQuery(hql).setLong("id", id).list();
		s.close();
		return result;
	}
	public void saveComment(Long userId, Long cookId, String content,Boolean type) {
		Session s = sf.openSession();
		s.beginTransaction();
		Comment comment = new Comment();
		User u = (User) s.get(User.class, userId);
		Cook c = (Cook) s.get(Cook.class, cookId);
		comment.setContent(content);
		comment.setType(type);
		comment.setCreateDate(new Date());
		comment.setUser(u);
		comment.setCook(c);
		s.save(comment);
		logger.debug("评价存储成功");
		s.getTransaction().commit();
		s.close();
	}
}
