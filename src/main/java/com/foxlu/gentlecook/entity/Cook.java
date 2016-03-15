package com.foxlu.gentlecook.entity;

import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Cook {
	private Long id;
	private String name;
	private String avatar;
	private String gender;
	private String motto; //简介
	private String skill;
	private Integer price;
	private Integer times;
	
	//one to many
	private List<Comment> comments;
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public Cook(){
		
	}
	public Cook(Long id, String name, String avatar, String gender, String motto, String skill, Integer price,
			Integer times) {
		super();
		this.id = id;
		this.name = name;
		this.avatar = avatar;
		this.gender = gender;
		this.motto = motto;
		this.skill = skill;
		this.price = price;
		this.times = times;
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
	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="cook_id")
	@Cascade(value={CascadeType.ALL})
	@JsonIgnore
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	
}
