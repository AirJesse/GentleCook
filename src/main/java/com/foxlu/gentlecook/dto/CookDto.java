package com.foxlu.gentlecook.dto;

public class CookDto {
	private Long id;
	private String name;
	private String avatar;
	private String gender;
	private String motto; //简介
	private String skill;
	private Integer price;
	private Integer times;
	private String acclaim; //好评率
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getTimes() {
		return times;
	}
	public void setTimes(Integer times) {
		this.times = times;
	}
	public String getAcclaim() {
		return acclaim;
	}
	public void setAcclaim(String acclaim) {
		this.acclaim = acclaim;
	}
	
	
}
