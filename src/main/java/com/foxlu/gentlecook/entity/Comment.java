package com.foxlu.gentlecook.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Comment {
	private Long id;
	private User user;
	private Cook cook;
	private String content;
	private Date createDate;
	private Boolean type; //true 好评， false 差评
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@ManyToOne
	@JsonIgnore
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	@JsonIgnore
	public Cook getCook() {
		return cook;
	}
	public void setCook(Cook cook) {
		this.cook = cook;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Boolean getType() {
		return type;
	}
	public void setType(Boolean type) {
		this.type = type;
	}
//	@Override
//	public String toString() {
//		return "Comment [id=" + id + ", user=" + user==null?null:user.getUsername() + ", cook=" + cook==null?null:cook.getName() + ", content=" + content + ", createDate="
//				+ createDate + ", type=" + type + "]";
//	}
//	
	
}
