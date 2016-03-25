package com.foxlu.gentlecook.entity;

import java.util.Date;

import javax.persistence.Entity;

@Entity
public class Order {
	private Long id;
	private User user;
	private Cook cook;
	private Date createTime;
	private Date orderDate;
	private String address;
	private String type;
	private Integer price;
	private Boolean daimai;
	
}
