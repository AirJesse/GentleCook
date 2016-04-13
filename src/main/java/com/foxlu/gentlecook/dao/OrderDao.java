package com.foxlu.gentlecook.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foxlu.gentlecook.entity.Order;

@Repository
public class OrderDao {
	private static final Logger logger = LoggerFactory.getLogger(OrderDao.class);
	@Autowired
	private SessionFactory sf;
	
	public List<Order> getAllOrders(){
		Session s = sf.openSession();
		String hql = "from Order";
		List<Order> list = s.createQuery(hql).list();
		s.close();
		return list;
	}
}
