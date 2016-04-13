package com.foxlu.gentlecook.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foxlu.gentlecook.entity.Cook;
import com.foxlu.gentlecook.entity.Order;
import com.foxlu.gentlecook.entity.User;

@Repository
public class OrderDao {
	private static final Logger logger = LoggerFactory.getLogger(OrderDao.class);
	@Autowired
	private SessionFactory sf;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public List<Order> getAllOrders(){
		Session s = sf.openSession();
		String hql = "from Order";
		List<Order> list = s.createQuery(hql).list();
		s.close();
		return list;
	}

	public void createNewOrder(Long userId, Long cookId, String trueName, String phone,String orderDate,String address, Boolean daimai,
			String type, int price) throws Exception {
		Session s = sf.openSession();
		s.beginTransaction();
		Date now = new Date();
		Order order = new Order();
		User user = (User) s.get(User.class, userId);
		Cook cook = (Cook) s.get(Cook.class,cookId);
		order.setUser(user);
		order.setCook(cook);
		order.setTrueName(trueName);
		order.setPhone(phone);
		order.setAddress(address);
		order.setDaimai(daimai);
		order.setType(type);
		order.setPrice(price);
		order.setCreateTime(now);
		order.setOrderDate(sdf.parse(orderDate));
		order.setStatus("等待确认");
		//装载完毕
		s.save(order);
		cook.setTimes(cook.getTimes()+1);
		s.saveOrUpdate(cook);
		s.getTransaction().commit();
		s.close();
	}

	public void cancelOrderById(Long orderId) {
		Session s = sf.openSession();
		s.beginTransaction();
		Order o = (Order) s.get(Order.class, orderId);
		o.setStatus("已取消");
		s.saveOrUpdate(o);
		s.getTransaction().commit();
		s.close();	
	}
}
