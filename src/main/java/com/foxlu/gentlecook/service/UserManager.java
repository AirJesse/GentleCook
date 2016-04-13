package com.foxlu.gentlecook.service;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foxlu.gentlecook.dao.OrderDao;
import com.foxlu.gentlecook.dao.UserDao;
import com.foxlu.gentlecook.entity.User;

@Service
@Transactional
public class UserManager {
	@Autowired
	private UserDao ud;
	@Autowired
	private OrderDao od;

	public User getUserInfo(Long id) {
		return ud.getUser(id);
	}

	public void addUser(User user) {
		ud.addUser(user);
	}

	public boolean checkUsername(String username) {
		User user = ud.getUserByusername(username);
		return user == null ? false : true;
	}

	public User login(User user) {
		User u = ud.login(user.getUsername(), user.getPassword());
		return u;
	}

	public Set getCommentsByUserId(Long id) {
		return ud.getCommentsByUserId(id);
	}

	public Set getUserOrders(Long userId) {
		Set s =  ud.getUserOrders(userId);
		TreeSet ts = new TreeSet(s);
		return ts;
	}

	public boolean submitOrder(Long userId, Long cookId, String trueName, String phone, String orderDate,
			String address, Boolean daimai, String type, int price) {
		try {
			od.createNewOrder(userId, cookId, trueName, phone, orderDate, address, daimai, type, price);

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void cancelOrderById(Long orderId) {
		od.cancelOrderById(orderId);
		
	}
}
