package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.CommentItem;
import com.cugb.javaee.starbucks.bean.Dish;

/**
 * 评论信息处理接口，主要功能包括：
 * 1.增加评论信息。
 * 2.修改评论信息。
 * 3.删除评论信息。
 */
public interface CommentDAO {
	public int addComment(CommentItem res) throws SQLException;

	public int removeComment(int Commentid) throws SQLException; 

	public int modifyComment(CommentItem res) throws SQLException; 
	
	public ArrayList findComments(int dishid) throws SQLException;
	
	public CommentItem findComment(int commentid) throws SQLException;
}
