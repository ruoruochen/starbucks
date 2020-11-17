package com.cugb.javaee.starbucks.bean;

import java.sql.Timestamp;

public class CommentItem {
	public int commentid;
	public String username;
	public int dishid;
	public Timestamp time;
	public String commenttext;
	
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getDishid() {
		return dishid;
	}
	public void setDishid(int dishid) {
		this.dishid = dishid;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getCommenttext() {
		return commenttext;
	}
	public void setCommenttext(String commenttext) {
		this.commenttext = commenttext;
	}
}
